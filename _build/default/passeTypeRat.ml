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
                                  | InfoFun(_,t,tl) -> let e_l1 = (List.map(analyse_type_expression) e_l) in
                                    
                                    if not(est_compatible_list tl (List.map (snd) e_l1 )) then
                                      raise (TypesParametresInattendus ((List.map (snd) e_l1),tl))
                                    else 
                                    (AstType.AppelFonction(s, List.map(fst) e_l1), t)
                                  | _ -> failwith "")



let rec analyse_type_instruction i =
  match i with
  | AstTds.Declaration (t, a, e) -> let (e2, t2) = (analyse_type_expression e) in 
                                      (if (t2 <> t) then
                                        raise (TypeInattendu(t2, t))
                                      else
                                        (modifier_type_variable t a);
                                        AstType.Declaration (a, e2))                                      
                              
                                      

  | AstTds.Affectation (a,e) -> let (e2,t2) = (analyse_type_expression e) in
                                (match info_ast_to_info a with
                                |InfoVar(_, t, _, _) ->
                                  (if (t2 <> t) then
                                    raise (TypeInattendu(t2, t))
                                   else
                                    AstType.Affectation(a, e2)) 
                                |_ -> failwith "")
                                
      
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

  and analyse_type_bloc li =
      List.map (analyse_type_instruction) li


  let analyse_type_fonction (AstTds.Fonction(t,i,lp,li))  =
  let lpt = List.map (fst) lp in 
  modifier_type_fonction t lpt i;
  let nv_li = analyse_type_bloc li in
  List.fold_right (fun (tp,pi) _ -> modifier_type_variable (Int) pi) lp ();
  AstType.Fonction(i,List.map (snd) lp,nv_li)
  



(* analyser : AstSyntax.programme -> AstTds.programme *)
(* Paramètre : le programme à analyser *)
(* Vérifie la bonne utilisation des identifiants et transforme le programme
en un programme de type AstTds.programme *)
(* Erreur si mauvaise utilisation des identifiants *)
let analyser (AstTds.Programme (fonctions,prog)) =
  let n_fonctions = List.map (analyse_type_fonction) fonctions in
  AstType.Programme (n_fonctions ,(analyse_type_bloc prog))
