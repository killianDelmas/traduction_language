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
  (match ((b:AstSyntax.binaire), t1, t2) with
  | (Plus, Int, Int) -> (AstType.PlusInt, Int)
  | (Fraction, Int, Int) -> (Fraction, Rat)
  | (Plus, Rat, Rat) -> (PlusRat, Rat)
  | (Mult, Int, Int) -> (MultInt, Int)
  | (Mult, Rat, Rat) -> (MultRat, Rat)
  | (Equ, Int, Int) -> (EquInt, Bool)
  | (Equ, Bool, Bool) -> (EquBool, Bool)
  | (Inf, Int, Int) -> (Inf, Bool)
  | _ -> raise (TypeBinaireInattendu (b,t1,t2)))


let rec analyse_type_affectable a =
  match a with
  | AstTds.Valeur af -> (match analyse_type_affectable af with
                        | (aff, Pointeur ty) -> (AstType.Valeur aff,ty)
                        | _ -> failwith "")
  | AstTds.Ident i -> (match info_ast_to_info i with
                        | InfoConst (_,_) -> (AstType.Ident i, Int)
                        | InfoVar (_,t,_,_) -> (Ident i, t)
                        | _ -> failwith "")

let rec analyse_type_expression e = match e with
| AstTds.Booleen b -> (AstType.Booleen b, Bool)
| AstTds.Entier e -> (AstType.Entier e, Int)
| AstTds.Unaire (u, e) -> let (ast_type, t) = (analyse_type_expression e) in (if t <> Rat then raise (TypeInattendu(t, Rat)) 
                                                                            else (AstType.Unaire (analyse_unaire u, ast_type), Int)) 
| AstTds.Binaire (b, e1, e2) -> let (et1, t1) = (analyse_type_expression e1) in
                                let (et2, t2) = (analyse_type_expression e2) in 
                                let (bf, tf) = analyse_binaire b t1 t2 in
                                (AstType.Binaire (bf, et1,et2), tf)
| AstTds.AppelFonction (s,e_l)-> (match (info_ast_to_info s) with
                                  | InfoFun(_,t,tl) -> let e_l1 = (List.map(analyse_type_expression) e_l) in
                                    
                                    if not(est_compatible_list tl (List.map (snd) e_l1 )) then
                                      raise (TypesParametresInattendus ((List.map (snd) e_l1),tl))
                                    else 
                                    (AstType.AppelFonction(s, List.map(fst) e_l1), t)
                                  | _ -> failwith "")
| AstTds.CondTer(c,t,e) -> let (c1,tc) = analyse_type_expression c in 
                          let (t1,tt) = analyse_type_expression t in 
                          let (e1,te) = analyse_type_expression e in 
                          if (est_compatible tt te) then
                            if tc =Bool then
                              (AstType.CondTer(c1,t1,e1),tt)
                            else 
                              raise (TypeInattendu(tc,Bool))
                          else raise (TypeInattendu(tt,te))
| Affectable a -> let (af,ta) = analyse_type_affectable a in
                  (Affectable af, ta)
| New t -> (New t, Pointeur t)
| Adresse i -> (match info_ast_to_info i with
                | InfoVar (_,t,_,_) -> (Adresse i, Pointeur t)
                | _ -> failwith "")
| Null -> (Null, Pointeur Undefined)


let rec analyse_type_instruction i =
  match i with
  | AstTds.Declaration (t, a, e) -> let (e2, t2) = (analyse_type_expression e) in 
                                      (if (t2 <> t) then
                                        raise (TypeInattendu(t2, t))
                                      else
                                        (modifier_type_variable t a);
                                        AstType.Declaration (a, e2))                                      
                              
                                      
  | AstTds.Affectation (a,e) -> let (a1,t1) = (analyse_type_affectable a) in
                                let (e2,t2) = (analyse_type_expression e) in
                                if not(est_compatible t1 t2) then
                                  raise (TypeInattendu (t2,t1))
                                else
                                  Affectation (a1,e2)
      
  | AstTds.Affichage e -> (match analyse_type_expression e with
                          | (e2, Int) -> AffichageInt e2
                          | (e2, Rat) -> AffichageRat e2
                          | (e2, Bool) -> AffichageBool e2
                          | _ -> failwith "Erreur de type")

  | AstTds.Conditionnelle (e,b1,b2) -> let (e2,t2) = analyse_type_expression e in 
                                      (if (t2 = Bool) then
                                        AstType.Conditionnelle (e2,(analyse_type_bloc b1),(analyse_type_bloc b2))
                                      else raise (TypeInattendu (t2,Bool)))
  | AstTds.CondiSansElse (e,b) -> let (e2,t2) = analyse_type_expression e in 
                                      (if (t2 = Bool) then
                                        AstType.CondiSansElse (e2,(analyse_type_bloc b))
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



  and analyse_type_bloc li =
      List.map (analyse_type_instruction) li



  let analyse_type_fonction (AstTds.Fonction(t,i,lp,li))  =
  let lpt = List.map (fst) lp in 
  modifier_type_fonction t lpt i;
  let nv_li = analyse_type_bloc li in
  AstType.Fonction(i,List.map (snd) lp,nv_li)
  



(* analyser : AstSyntax.programme -> AstTds.programme *)
(* Paramètre : le programme à analyser *)
(* Vérifie la bonne utilisation des identifiants et transforme le programme
en un programme de type AstTds.programme *)
(* Erreur si mauvaise utilisation des identifiants *)
let analyser (AstTds.Programme (fonctions,prog)) =
  let n_fonctions = List.map (analyse_type_fonction) fonctions in
  AstType.Programme (n_fonctions ,(analyse_type_bloc prog))
