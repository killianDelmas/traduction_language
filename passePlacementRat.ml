(* Module de la passe de gestion des identifiants *)
(* doit être conforme à l'interface Passe *)
open Tds
open Ast
open Type

type t1 = Ast.AstType.programme
type t2 = Ast.AstPlacement.programme

 (* analyse_placement_affectable : AstType.affectable -> AstTds.affectable
Paramètre a : l'affectable à analyser 
Tranforme l'affectable en un affectable de type AstPlacement.affectable *)
let analyse_placement_affectable a = a

(* analyse_type_expression : AstTds.expression -> AstType.expression * typ *)
(* Paramètre e : l'expression à analyser *)
(* Tranforme l'expression en une expression de type AstType.expression et calcule le
   typ associé *)
let analyse_placement_expression e = e

(* analyse_placement_instruction : int -> string -> AstType.instruction -> AstPlacement.instruction *)
(* Paramètre dec : entier du déplacement courant*)
(* Paramètre reg : string représentant l'endroit de la pile courant*)
(* Paramètre i : l'instruction à analyser *)
(* Tranforme l'instruction en une instruction de type AstPlacement.instruction
   et calcule la place dans la pile de l'instruction*)
(* Erreur si mauvaise utilisation des types *)
let rec analyse_placement_instruction dec reg i =
  match i with
  | AstType.Declaration (a, e) -> (match info_ast_to_info a with
                                  | InfoVar(_, t, _, _) -> modifier_adresse_variable dec reg a;
                                    AstPlacement.Declaration(a, analyse_placement_expression e), getTaille t
                                  | _ -> failwith ""
                                  )                                  
                              
                                      

  | AstType.Affectation (a,e) -> (AstPlacement.Affectation(analyse_placement_affectable a,analyse_placement_expression e),0)
                                  
  | AstType.AffichageInt (e) -> AstPlacement.AffichageInt (e),0

  | AstType.AffichageRat (e) -> AstPlacement.AffichageRat (e),0
  
  | AstType.AffichageBool (e) -> AstPlacement.AffichageBool (e),0

  | AstType.Conditionnelle (e,b1,b2) -> let e1 = analyse_placement_expression e in 
                                        let (b11) = analyse_placement_bloc dec reg b1 in
                                        let (b21) = analyse_placement_bloc dec reg b2 in 
                                        AstPlacement.Conditionnelle (e1, b11, b21), 0
  | AstType.CondiSansElse (e,b) -> let e1 = analyse_placement_expression e in 
                                        let (b1) = analyse_placement_bloc dec reg b in
                                        AstPlacement.CondiSansElse(e1, b1), 0

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

  (* analyse_placement_bloc : int -> string -> AstType.bloc -> AstPlacement.bloc *)
  (* Paramètre dec : entier du déplacement courant*)
(* Paramètre reg : string représentant l'endroit de la pile courant*)
(* Paramètre li : liste d'instructions à analyser *)
(* Calcule le deplacement de chaque variable *)
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

  (* analyse_placement_fonction : AstType.fonction -> AstPlacement.fonction *)
(* Paramètre : la fonction à analyser *)
(* Calcule le deplacement de chaque variable et Tranforme la fonction en une fonction de type AstPlacement.fonction *)
let analyse_placement_fonction (AstType.Fonction(ia,lp,li))  =
    let _ = analyse_placement_parametres lp in 
    let nv_bloc = analyse_placement_bloc 3 "LB" li in 
    AstPlacement.Fonction(ia,lp,nv_bloc)
    



(* analyser : AstType.programme -> AstPlacement.programme *)
(* Paramètre : le programme à analyser *)
(* Fais la passe de Placement *)
let analyser (AstType.Programme (fonctions,prog)) =
  let fs = List.map (analyse_placement_fonction) fonctions in
  let (b,i) = analyse_placement_bloc 0 "SB" prog in
  AstPlacement.Programme (fs,(b,i)) 
