(* Module de la passe de gestion des identifiants *)
(* doit être conforme à l'interface Passe *)
open Tds
open Exceptions
open Ast
open Type

type t1 = Ast.AstTds.programme
type t2 = Ast.AstType.programme

let analyse_type_expression tds e = match e with
| AstTds.Booleen b -> AstType.Booleen b
| AstTds.Entier e -> AstType.Entier e
| AstTds.Unaire (u, e) -> AstType.Unaire (u, analyse_tds_expression tds e)
| AstTds.Binaire (b, e1, e2) -> AstType.Binaire (b, analyse_tds_expression tds e1, analyse_tds_expression tds e2)
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