(* Module de la passe de gestion des identifiants *)
(* doit être conforme à l'interface Passe *)
open Tds
open Exceptions
open Ast
open Type

type t1 = Ast.AstTds.programme
type t2 = Ast.AstType.programme


let analyse_unaire u =
  match u with
  |AstSyntax.Numerateur -> AstType.Numerateur
  |AstSyntax.Denominateur -> AstType.Denominateur

let analyse_binaire b t1 t2 =
  if (t1 = t2) then 
    match t1 with
    | Bool -> (match b with
              | AstSyntax.Equ -> AstType.EquBool
              | _ -> raise TypeBinaireInattendu(b, t1, t2))
    | Int -> (match b with
              | Plus -> PlusInt
              | Mult -> MultInt
              | Equ -> EquInt
              | _ -> raise TypeBinaireInattendu(b, t1, t2))
    | Rat -> 
    | Undefined ->

let rec analyse_type_expression tds e = match e with
| AstTds.Booleen b -> (AstType.Booleen b, Bool)
| AstTds.Entier e -> (AstType.Entier e, Int)
| AstTds.Unaire (u, e) -> let (ast_type, t) = (analyse_type_expression tds e) in (AstType.Unaire (analyse_unaire u, ast_type), t)  
| AstTds.Binaire (b, e1, e2) -> let (et1, t1) = (analyse_type_expression tds e1) in
                                 let (et2, t2) = (analyse_type_expression tds e2) in 
                                  let  AstType.Binaire ((analyse_binaire b t1 t2), et1, et2)
| AstTds.Ident s -> (match chercherGlobalement tds s with
                        | Some i -> (match info_ast_to_info i with
                                    | InfoVar _ -> AstType.Ident i
                                    | InfoConst _ -> AstType.Ident i
                                    | InfoFun _ -> raise (MauvaiseUtilisationIdentifiant s))
                        | None -> raise (IdentifiantNonDeclare s ))
| AstTds.AppelFonction (s,e_l)-> (match chercherGlobalement tds s with
                                    | Some i -> (match info_ast_to_info i with 
                                                | InfoFun _ -> AstType.AppelFonction (i, List.map( analyse_tds_expression tds) e_l)
                                                | _ -> raise (MauvaiseUtilisationIdentifiant s))
                                    | None -> raise (IdentifiantNonDeclare s ))

let analyse_type_instruction tds i =