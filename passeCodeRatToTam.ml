(* Module de la passe de gestion des identifiants *)
(* doit être conforme à l'interface Passe *)
open Tds
open Exceptions
open Ast
open Type
open AstPlacement
open Code

type t1 = Ast.AstPlacement.programme
type t2 = String



let rec analyse_code_expression e = 
  match e with
  | AstType.AppelFonction(info, le) -> (match info_ast_to_info info with (*concaténer le code correspondant à chacune des expressions arguments*)
                                      | InfoFun(n,t,lt) -> "CALL (ST) " ^ n ^"\n"
                                      | _ -> failwith "")
  (* | AstPlacement.Rationnel (e1, e2) -> (analyse_code_expression e1) ^ (analyse_code_expression e2) *)
  | Unaire (u, e1) -> (match u with
                    | Numerateur -> (analyse_code_expression e1) ^ "POP (0) 1\n"
                    | Denominateur -> (analyse_code_expression e1) ^ "POP (1) 1\n")
  | Ident info -> (match info_ast_to_info info with
                  | InfoVar(_,t,dep,reg) -> "LOAD (" ^ (string_of_int (getTaille t)) ^ ") " ^ (string_of_int dep) ^ "[" ^ (reg) ^ "] \n"  
                  | InfoConst(_,v) -> "LOADL " ^ (string_of_int v) ^ "\n"
                  | _ -> failwith "Erreur précédente")
  | Booleen b -> if b then "LOADL 1\n" else "LOADL 0\n"
  | Entier i -> "LOADL " ^ (string_of_int i) ^ "\n"
  | Binaire (b, e1, e2) -> (analyse_code_expression e1) ^ (analyse_code_expression e2) ^ 
                          (match b with 
                           | PlusInt -> "SUBR IAdd \n"
                           | MultInt -> "SUBR IMult \n"
                           | EquInt -> "SUBR IEq \n"
                           | Inf -> "SUBR ILss \n"
                           | Fraction -> "CALL (SB) norm \n"
                           | PlusRat -> "CALL (SB) RAdd \n"
                           | MultRat -> "CALL (SB) RMul \n"
                           | EquBool -> "SUBR BEq \n"
                           | _ -> failwith "Erreur")
let rec analyse_code_instruction i =
  match i with
  | AstPlacement.Declaration (a, e) -> (match info_ast_to_info a with
                                  | InfoVar(_, t, dep, reg) -> "PUSH " ^ (string_of_int(getTaille t)) ^ "\n" ^
                                    (analyse_code_expression e) ^ "STORE (" ^ (string_of_int(getTaille t)) ^ ") " ^ (string_of_int dep) ^ "[" ^ reg ^ "] \n"
                                  | _ -> failwith "Erreur"
                                  )                                  
                              
  | AstPlacement.Affectation (a,e) -> (match info_ast_to_info a with
                                  | InfoVar(_, t, dep, reg) -> (analyse_code_expression e) ^ "STORE (" ^ (string_of_int(getTaille t)) ^ ") " ^ (string_of_int dep) ^ "[" ^ reg ^ "] \n"
                                  | _ -> failwith "Erreur"
                                  )
  | AstPlacement.AffichageInt (e) -> (analyse_code_expression e) ^ "SUBR IOut \n"

  | AstPlacement.AffichageRat (e) -> (analyse_code_expression e) ^ "CALL (ST) ROut \n"
  
  | AstPlacement.AffichageBool (e) -> (analyse_code_expression e) ^ "SUBR BOut \n"

  | AstPlacement.Conditionnelle (e,b1,b2) -> let l_else = getEtiquette() in 
                                              let l_fin_else = getEtiquette() in 
                                                (analyse_code_expression e) 
                                                ^ "JUMPIF (0)" ^ l_else ^ "\n" 
                                                ^ (analyse_code_bloc b1)
                                                ^ "JUMP " ^ l_fin_else ^ "\n"
                                                ^ "LABEL " ^ l_else ^ "\n" 
                                                ^ (analyse_code_bloc b2) 
                                              ^ "LABEL " ^ l_fin_else ^ "\n" 

  | AstPlacement.TantQue (e,b) -> let l_debut = getEtiquette() in 
                                    let l_fin = getEtiquette() in 
                                    "LABEL " ^ l_debut ^ "\n"
                                    ^ (analyse_code_expression e) 
                                    ^ "JUMPIF (0) " ^ l_fin ^ "\n" 
                                    ^ (analyse_code_bloc b) ^ "JUMP " 
                                    ^ l_debut ^ "LABEL " ^ l_fin
      
  | AstPlacement.Retour (e,i1,i2) -> (analyse_code_expression e) ^ "RETURN (" ^ (string_of_int i1) ^ ") " ^ (string_of_int i2)

  | AstPlacement.Empty -> ""
  | _ -> failwith ""

  and analyse_code_bloc (li,i) = 
                              let popfinal = "POP (0) " ^ (string_of_int i) ^ "\n" in
                                (String.concat "" (List.map analyse_code_instruction li)) ^ popfinal
    
  

      



(* analyser : AstSyntax.programme -> AstTds.programme *)
(* Paramètre : le programme à analyser *)
(* Vérifie la bonne utilisation des identifiants et transforme le programme
en un programme de type AstTds.programme *)
(* Erreur si mauvaise utilisation des identifiants *)
let analyser (AstPlacement.Programme (fonctions,prog)) =
  getEntete () ^ "" ^ (analyse_code_bloc prog) ^ "HALT"
 