(* Module de la passe de gestion des identifiants *)
(* doit être conforme à l'interface Passe *)
open Tds
open Ast
open Type
open Code
open Tam

type t1 = Ast.AstPlacement.programme
type t2 = string

let rec type_de_affectable a = 
  match a with
  | AstType.Valeur af -> (match type_de_affectable af with
                  | Pointeur t -> t
                  | _ -> failwith "")
  | Ident i -> (match info_ast_to_info i with
                | InfoConst(_,_) -> Int
                | InfoVar(_,ty,_,_) -> ty 
                | _ -> failwith "")

let rec analyse_code_affectable modif deref a = 
  match a with
  | AstType.Valeur af ->  let ty = type_de_affectable af in 
                        let taille = getTaille(ty) in 
                        (analyse_code_affectable false true af) ^ (if (modif && not deref) then storei taille else loadi taille)
  | Ident i -> (match info_ast_to_info i with
                | InfoConst (_,v) -> loadl_int v
                | InfoVar (_,ty,dep,reg) -> if (est_compatible ty (Pointeur(Undefined))) then
                                              if (modif && not deref) then
                                                (store (getTaille(ty)) dep reg) 
                                            else
                                              load (getTaille(ty)) dep reg 
                                          else if not modif then
                                            load (getTaille(ty)) dep reg 
                                          else
                                            store (getTaille(ty)) dep reg 
                  | _ -> failwith "")


let rec analyse_code_expression e = 
  match e with
  | AstType.AppelFonction(info, le) -> (*concaténer le code correspondant à chacune des expressions arguments*)
                                      (String.concat "" (List.map (analyse_code_expression) le)) ^ 
                                      (match info_ast_to_info info with 
                                      | InfoFun(n,_,_) -> (call "ST" n)
                                      | _ -> failwith "")
  | Unaire (u, e1) -> (match u with
                    | Numerateur -> (analyse_code_expression e1) ^ (pop 0 1)
                    | Denominateur -> (analyse_code_expression e1) ^ (pop 1 1))
  (* | Ident info -> (match info_ast_to_info info with
                  | InfoVar(_,t,dep,reg) -> load (getTaille t) dep reg
                  | InfoConst(_,v) -> loadl_int v
                  | _ -> failwith "Erreur précédente") *)
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
                           | EquBool -> subr "IEq")
| CondTer(c,t,e) -> let fin_cond_ter = getEtiquette() in 
                    let else_cond_ter = getEtiquette() in 
                    (analyse_code_expression c) ^
                    (jumpif 0 else_cond_ter) ^
                    (analyse_code_expression t) ^
                    (jump fin_cond_ter) ^
                    (label else_cond_ter) ^
                    (analyse_code_expression e) ^
                    (label fin_cond_ter)
| AstType.Affectable a -> analyse_code_affectable false false a
| AstType.New t -> loadl_int (getTaille t) ^
                  (subr "MAlloc")
| Adresse i -> (match info_ast_to_info i with
                | InfoVar(_,_,dep,reg) ->  (loada dep reg)
                | _ -> failwith "")
| Null -> loadl_int (-1)


let rec analyse_code_instruction i =
  match i with
  | AstPlacement.Declaration (a, e) -> (match info_ast_to_info a with
                                  | InfoVar(_, t, dep, reg) -> (push (getTaille t)) ^
                                    (analyse_code_expression e) ^ (store (getTaille t) dep reg)
                                  | _ -> failwith "Erreur"
                                  )                                  
                              
  | AstPlacement.Affectation (a,e) -> (analyse_code_expression e)^
                                      (analyse_code_affectable true false a)
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

  | AstPlacement.CondiSansElse (e,b) -> 
                                        let l_fin_sans_else = getEtiquette() in 
                                          (analyse_code_expression e) 
                                          ^ (jumpif 0 l_fin_sans_else)
                                          ^ (analyse_code_bloc b)
                                        ^ (label l_fin_sans_else) 

  | AstPlacement.TantQue (e,b) -> let l_debut = getEtiquette() in 
                                    let l_fin = getEtiquette() in 
                                    (label l_debut) 
                                    ^ (analyse_code_expression e) 
                                    ^ (jumpif 0 l_fin)
                                    ^ (analyse_code_bloc b) ^ (jump l_debut) ^ (label l_fin)
      
  | AstPlacement.Retour (e,i1,i2) -> (analyse_code_expression e) ^ (return i1 i2)

  | AstPlacement.Empty -> ""


  and analyse_code_bloc (li,i) =  push i ^(String.concat "" (List.map analyse_code_instruction li)) ^ (pop 0 i) 
    
  let analyse_code_fonction (AstPlacement.Fonction(ia,_,(li,i))) = 
    match info_ast_to_info ia with
    | InfoFun(n,_,_) -> label n ^ analyse_code_bloc (li,i) ^ halt
    | _ -> failwith ""

(* analyser : AstSyntax.programme -> AstTds.programme *)
(* Paramètre : le programme à analyser *)
(* Vérifie la bonne utilisation des identifiants et transforme le programme
en un programme de type AstTds.programme *)
(* Erreur si mauvaise utilisation des identifiants *)
let analyser (AstPlacement.Programme (fonctions,prog)) =
  getEntete () ^ (String.concat "" (List.map (analyse_code_fonction) fonctions)) ^ (label "main") ^ (analyse_code_bloc prog) ^ halt
 