(* Module de la passe de gestion des identifiants *)
(* doit être conforme à l'interface Passe *)
open Tds
open Exceptions
open Ast
open Type
open AstPlacement
open Code
open Tam

type t1 = Ast.AstPlacement.programme
type t2 = string



let rec analyse_code_expression e = 
  match e with
  | AstType.AppelFonction(info, le) -> (match info_ast_to_info info with (*concaténer le code correspondant à chacune des expressions arguments*)
                                      | InfoFun(n,t,lt) -> (call "ST" n)
                                      | _ -> failwith "")
  (* | AstPlacement.Rationnel (e1, e2) -> (analyse_code_expression e1) ^ (analyse_code_expression e2) *)
  | Unaire (u, e1) -> (match u with
                    | Numerateur -> (analyse_code_expression e1) ^ (pop 0 1)
                    | Denominateur -> (analyse_code_expression e1) ^ (pop 1 1))
  | Ident info -> (match info_ast_to_info info with
                  | InfoVar(_,t,dep,reg) -> load (getTaille t) dep reg
                  | InfoConst(_,v) -> loadl_int v
                  | _ -> failwith "Erreur précédente")
  | Booleen b -> if b then loadl_int 1 else loadl_int 0
  | Entier i -> loadl_int i
  | Binaire (b, e1, e2) -> (analyse_code_expression e1) ^ (analyse_code_expression e2) ^ 
                          (match b with 
                           | PlusInt -> subr "IAdd"
                           | MultInt -> subr "IMul"
                           | EquInt -> subr "IEq"
                           | Inf -> subr "ILss"
                           | Fraction -> call "ST" "norm"
                           | PlusRat -> call "ST" "RAdd"
                           | MultRat -> call "ST" "RMul"
                           | EquBool -> subr "BEq"
                           | _ -> failwith "Erreur")
let rec analyse_code_instruction i =
  match i with
  | AstPlacement.Declaration (a, e) -> (match info_ast_to_info a with
                                  | InfoVar(_, t, dep, reg) -> (push (getTaille t)) ^
                                    (analyse_code_expression e) ^ (store (getTaille t) dep reg)
                                  | _ -> failwith "Erreur"
                                  )                                  
                              
  | AstPlacement.Affectation (a,e) -> (match info_ast_to_info a with
                                  | InfoVar(_, t, dep, reg) -> (analyse_code_expression e) ^ (store (getTaille t) dep reg)
                                  | _ -> failwith "Erreur"
                                  )
  | AstPlacement.AffichageInt (e) -> (analyse_code_expression e) ^ (subr "IOut")

  | AstPlacement.AffichageRat (e) -> (analyse_code_expression e) ^ (call "ST" "ROut")
  
  | AstPlacement.AffichageBool (e) -> (analyse_code_expression e) ^ (subr "BOut")

  | AstPlacement.Conditionnelle (e,b1,b2) -> let l_else = getEtiquette() in 
                                              let l_fin_else = getEtiquette() in 
                                                (analyse_code_expression e) 
                                                ^ (jumpif 0 l_else)
                                                ^ (analyse_code_bloc b1)
                                                ^ (jump l_fin_else)
                                                ^ (label l_else) 
                                                ^ (analyse_code_bloc b2) 
                                              ^ (label l_fin_else) 

  | AstPlacement.TantQue (e,b) -> let l_debut = getEtiquette() in 
                                    let l_fin = getEtiquette() in 
                                    (label l_debut) 
                                    ^ (analyse_code_expression e) 
                                    ^ (jumpif 0 l_fin)
                                    ^ (analyse_code_bloc b) ^ (jump l_debut) ^ (label l_fin)
      
  | AstPlacement.Retour (e,i1,i2) -> (analyse_code_expression e) ^ (return i1 i2)

  | AstPlacement.Empty -> ""
  | _ -> failwith ""

  and analyse_code_bloc (li,i) = 
                              let popfinal = (pop 0 i) in
                              (String.concat "" (List.map analyse_code_instruction li)) ^ popfinal
    
  

      



(* analyser : AstSyntax.programme -> AstTds.programme *)
(* Paramètre : le programme à analyser *)
(* Vérifie la bonne utilisation des identifiants et transforme le programme
en un programme de type AstTds.programme *)
(* Erreur si mauvaise utilisation des identifiants *)
let analyser (AstPlacement.Programme (fonctions,prog)) =
  getEntete () ^ (label "main") ^ (analyse_code_bloc prog) ^ halt
 