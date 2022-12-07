(* Module de la passe de gestion des identifiants *)
(* doit être conforme à l'interface Passe *)
open Tds
open Exceptions
open Ast
open Type
open Placement

type t1 = Ast.AstType.programme
type t2 = Ast.AstPlacement.programme


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
| AstTds.Unaire (u, e) -> let (ast_type, t) = (analyse_type_expression e) in (if t <> Rat then raise (TypeInattendu(t, Rat)) 
                                                                            else (AstType.Unaire (analyse_unaire u, ast_type), Int)) 
| AstTds.Binaire (b, e1, e2) -> let (et1, t1) = (analyse_type_expression e1) in
                                let (et2, t2) = (analyse_type_expression e2) in 
                                let (bf, tf) = analyse_binaire b t1 t2 in
                                (AstType.Binaire (bf, et1,et2), tf)

| AstTds.Ident s -> (match (info_ast_to_info s) with
                   | InfoConst (_,_) -> (AstType .Ident s, Int) 
                   | InfoVar(_, t, _, _) -> (AstType.Ident s, t)
                   | InfoFun(_,_,_) -> failwith "pb Tds rat")
| AstTds.AppelFonction (s,e_l)-> (match (info_ast_to_info s) with
| InfoFun(_,t,_) -> (AstType.AppelFonction(s, List.map(fst) (List.map(analyse_type_expression) e_l)), t)
| InfoConst (st,_) -> raise (MauvaiseUtilisationIdentifiant (st))
| InfoVar(st, _, _, _) -> raise (MauvaiseUtilisationIdentifiant (st)))

let rec analyse_placement_instruction i =
  match i with
  | AstType.Declaration (a, e) -> let (e2, t2) = (analyse_placement_expression e) in 
                                      (if (t2 <> t) then
                                        raise (TypeInattendu(t2, t))
                                      else
                                        (modifier_type_variable t a);
                                        AstType.Declaration (a, e2))                                      
                              
                                      

  | AstType.Affectation (a,e) -> modifier_adresse_variable 0 "SB" a;
                                (AstPlacement.Affectation(a,e),0)
                                
      
  | AstTds.Affichage e -> (match analyse_type_expression e with
                          | (e2, Int) -> AffichageInt e2
                          | (e2, Rat) -> AffichageRat e2
                          | (e2, Bool) -> AffichageBool e2
                          | _ -> failwith "Erreur de type")

  | AstTds.Conditionnelle (e,b1,b2) -> let (e2,t2) = analyse_type_expression e in 
                                      (if (t2 = Bool) then
                                        AstType.Conditionnelle (e2,(analyse_type_bloc b1),(analyse_type_bloc b2))
                                      else raise (TypeInattendu (t2,Bool)))

  | AstTds.TantQue (c,b) -> let (e2,t2) = analyse_type_expression c in 
                            (if (t2 = Bool) then
                              AstType.TantQue (e2,(analyse_type_bloc b))
                            else raise (TypeInattendu (t2,Bool)))
  
      
  | AstTds.Retour (e,i) -> let (e2, t2) = (analyse_type_expression e) in
                          (match Tds.info_ast_to_info i with
                          |InfoFun(_,typ,_) -> (if t2 <> typ then
                                                raise (TypeInattendu (t2, typ))
                                              else
                                                AstType.Retour (e2, i))
                          | _ -> failwith "")

  | AstTds.Empty -> AstType.Empty
  | _ -> failwith ""

  and analyse_placement_bloc li =
    let l = List.map (analyse_placement_instruction) li in 
    (List.map(fst) l,List.fold_right (+) (List.map (fun (_,y)->y) l) 0)

      



(* analyser : AstSyntax.programme -> AstTds.programme *)
(* Paramètre : le programme à analyser *)
(* Vérifie la bonne utilisation des identifiants et transforme le programme
en un programme de type AstTds.programme *)
(* Erreur si mauvaise utilisation des identifiants *)
let analyser (AstTds.Programme (fonctions,prog)) =
  assert(fonctions =[]);
  AstType.Programme ([],(analyse_type_bloc prog))