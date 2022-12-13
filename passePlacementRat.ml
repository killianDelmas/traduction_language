(* Module de la passe de gestion des identifiants *)
(* doit être conforme à l'interface Passe *)
open Tds
open Exceptions
open Ast
open Type
open AstPlacement

type t1 = Ast.AstType.programme
type t2 = Ast.AstPlacement.programme



let rec analyse_placement_expression e = e
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
                            | InfoFun(s, t, l_t) -> let i2 = List.fold_right (fun t q -> (getTaille t) + q) l_t 0 in
                                                    let i1 = getTaille t in 
                                                    AstPlacement.Retour (e1,i1, i2),0
                            | _ -> failwith "a")

  | AstType.Empty -> AstPlacement.Empty,0
  | _ -> failwith ""

  and analyse_placement_bloc dec reg li =
    match li with
    |[] -> ([],dec)
    |instr::l_instr -> let instr,size = analyse_placement_instruction dec reg instr in
                        let l_instr,dec_li = analyse_placement_bloc (dec+size) reg l_instr in 
                        (instr::l_instr, dec_li+size) 
 
  

      



(* analyser : AstSyntax.programme -> AstTds.programme *)
(* Paramètre : le programme à analyser *)
(* Vérifie la bonne utilisation des identifiants et transforme le programme
en un programme de type AstTds.programme *)
(* Erreur si mauvaise utilisation des identifiants *)
let analyser (AstType.Programme (fonctions,prog)) =
  assert(fonctions =[]);
  let (b,i) = analyse_placement_bloc 0 "SB" prog in
  AstPlacement.Programme ([],(b,i)) 
