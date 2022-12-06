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
  match ((b:AstSyntax.binaire), t1, t2) with
  | (Plus, Int, Int) -> (AstType.PlusInt, Int)
  | (Fraction, Int, Int) -> (Fraction, Rat)
  | (Plus, Rat, Rat) -> (PlusRat, Rat)
  | (Mult, Int, Int) -> (MultInt, Int)
  | (Mult, Rat, Rat) -> (MultRat, Rat)
  | (Equ, Int, Int) -> (EquInt, Bool)
  | (Equ, Bool, Bool) -> (EquBool, Bool)
  | (Inf, Int, Int) -> (Inf, Bool)
  | _ -> raise (TypeBinaireInattendu (b,t1,t2))

let rec analyse_type_expression e = match e with
| AstTds.Booleen b -> (AstType.Booleen b, Bool)
| AstTds.Entier e -> (AstType.Entier e, Int)
| AstTds.Unaire (u, e) -> let (ast_type, t) = (analyse_type_expression e) in (AstType.Unaire (analyse_unaire u, ast_type), t)  
| AstTds.Binaire (b, e1, e2) -> let (et1, t1) = (analyse_type_expression e1) in
                                let (et2, t2) = (analyse_type_expression e2) in 
                                let (bf, tf) = analyse_binaire b t1 t2 in
                                (AstType.Binaire (bf, et1,et2), tf)

| AstTds.Ident s -> (match (info_ast_to_info s) with
                   | InfoConst (_,_) -> (AstType .Ident s, Int) 
                   | InfoVar(_, t, _, _) -> (AstType.Ident s, t)
                   | InfoFun(_,t,_) -> failwith "pb Tds rat")
| AstTds.AppelFonction (s,e_l)-> (match (info_ast_to_info s) with
| InfoFun(_,t,_) -> (AstType.AppelFonction(s, List.map(fst) (List.map(analyse_type_expression) e_l)), t)
| InfoConst (st,_) -> raise (MauvaiseUtilisationIdentifiant (st))
| InfoVar(st, _, _, _) -> raise (MauvaiseUtilisationIdentifiant (st)))

let rec analyse_type_instruction oia i =
  match i with
  | AstTds.Declaration (t, a, e) -> let (e2, t2) = (analyse_type_expression e) in 
                                      modifier_type_variable t a;
                                      (if (t = t2) then 
                                      AstType.Declaration (a, e2)
                                      else raise (TypeInattendu(t, t2)))

  | AstTds.Affectation (a,e) -> let (e2,t2) = (analyse_type_expression e) in 
                                      modifier_type_variable t2 a;
                                      AstType.Affectation(a, e2)
      
  | AstTds.Affichage e -> (match analyse_type_expression e with
                          | (e2, Int) -> AffichageInt e2
                          | (e2, Rat) -> AffichageRat e2
                          | (e2, Bool) -> AffichageBool e2
                          | _ -> failwith "Erreur de type")

  | AstTds.Conditionnelle (e,b1,b2) -> failwith "Erreur de type"
  | AstTds.TantQue (c,b) -> failwith "Erreur de type"
  | _ -> failwith ""
      
 (* | AstTds.Retour (e) -> failwith "Erreur de type"

  | AstTds.Empty -> failwith "Erreur de type"*)

