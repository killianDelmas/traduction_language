(* Module de la passe de gestion des identifiants *)
(* doit être conforme à l'interface Passe *)
open Tds
open Ast
open Type

type t1 = Ast.AstType.programme
type t2 = Ast.AstPlacement.programme



let analyse_placement_expression e = e

let rec analyse_placement_instruction dec reg i =
  match i with
  | AstType.Declaration (a, e) -> (match info_ast_to_info a with
                                  | InfoVar(_, t, _, _) -> modifier_adresse_variable dec reg a;
                                    AstPlacement.Declaration(a, analyse_placement_expression e), getTaille t
                                  | _ -> failwith ""
                                  )                                  
                              
                                      

  | AstType.Affectation (a,e) -> (AstPlacement.Affectation(a,analyse_placement_expression e),0)
                                  
  | AstType.AffichageInt (e) -> AstPlacement.AffichageInt (e),0

  | AstType.AffichageRat (e) -> AstPlacement.AffichageRat (e),0
  
  | AstType.AffichageBool (e) -> AstPlacement.AffichageBool (e),0

  | AstType.Conditionnelle (e,b1,b2) -> let e1 = analyse_placement_expression e in 
                                        let (b11) = analyse_placement_bloc dec reg b1 in
                                        let (b21) = analyse_placement_bloc dec reg b2 in 
                                        AstPlacement.Conditionnelle (e1, b11, b21), 0

  | AstType.TantQue (e,b) -> let e1 = analyse_placement_expression e in
                              let b1 = analyse_placement_bloc dec reg b in 
                              AstPlacement.TantQue (e1, b1) ,0
      
  | AstType.Retour (e,i) -> let e1 = analyse_placement_expression e in
                            (match info_ast_to_info i with
                            | InfoFun(_, t, l_t) -> let i2 = List.fold_right (fun t q -> (getTaille t) + q) l_t 0 in
                                                    let i1 = getTaille t in 
                                                    AstPlacement.Retour (e1,i1, i2),0
                            | _ -> failwith "a")

  | AstType.Empty -> AstPlacement.Empty,0

  and analyse_placement_bloc dec reg li =
    let rec parcours_instr dec l_instr =
      match l_instr with
      | [] -> [], dec
      | i::q -> let (instr,size) = analyse_placement_instruction dec reg i in
                let l,dec = parcours_instr (dec + size) q in 
                instr :: l, dec in
                let bloc, nvdec = parcours_instr dec li in 
                bloc, nvdec - dec

  
 let analyse_placement_parametre i dec =
    match info_ast_to_info i with
    | InfoVar(_,t,_,_) -> modifier_adresse_variable (dec - (getTaille t)) "LB" i;
                          getTaille t
    | _ -> failwith ""

  let rec analyse_placement_parametres lp = 
    match lp with
    | [] -> 0
    | tete::queue -> let taille_q = analyse_placement_parametres queue in
                    let taille_t = analyse_placement_parametre tete (- taille_q) in 
                    taille_t + taille_q
    
let analyse_placement_fonction (AstType.Fonction(ia,lp,li))  =
    let _ = analyse_placement_parametres lp in 
    let nv_bloc = analyse_placement_bloc 3 "LB" li in 
    AstPlacement.Fonction(ia,lp,nv_bloc)
    



(* analyser : AstSyntax.programme -> AstTds.programme *)
(* Paramètre : le programme à analyser *)
(* Vérifie la bonne utilisation des identifiants et transforme le programme
en un programme de type AstTds.programme *)
(* Erreur si mauvaise utilisation des identifiants *)
let analyser (AstType.Programme (fonctions,prog)) =
  (* assert(fonctions =[]); *)
  let fs = List.map (analyse_placement_fonction) fonctions in
  let (b,i) = analyse_placement_bloc 0 "SB" prog in
  AstPlacement.Programme (fs,(b,i)) 
