
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | WHILE
    | TRUE
    | STAR
    | SLASH
    | RETURN
    | RAT
    | PV
    | PRINT
    | POINTI
    | PO
    | PLUS
    | PF
    | NUM
    | NUL
    | NEW
    | MULT
    | INT
    | INF
    | IF
    | ID of (
# 11 "parser.mly"
       (string)
# 34 "parser.ml"
  )
    | FALSE
    | ESPER
    | EQUAL
    | EOF
    | ENTIER of (
# 10 "parser.mly"
       (int)
# 43 "parser.ml"
  )
    | ELSE
    | DOUBLEP
    | DENOM
    | CONST
    | CO
    | CF
    | CALL
    | BOOL
    | AO
    | AF
  
end

include MenhirBasics

# 3 "parser.mly"
  

open Type
open Ast.AstSyntax

# 66 "parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState000 : ('s, _menhir_box_main) _menhir_state
    (** State 000.
        Stack shape : .
        Start symbol: main. *)

  | MenhirState007 : (('s, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 007.
        Stack shape : typ ID.
        Start symbol: main. *)

  | MenhirState010 : (('s, _menhir_box_main) _menhir_cell1_param, _menhir_box_main) _menhir_state
    (** State 010.
        Stack shape : param.
        Start symbol: main. *)

  | MenhirState013 : ((('s, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID, _menhir_box_main) _menhir_cell1_list_param_, _menhir_box_main) _menhir_state
    (** State 013.
        Stack shape : typ ID list(param).
        Start symbol: main. *)

  | MenhirState014 : (('s, _menhir_box_main) _menhir_cell1_AO, _menhir_box_main) _menhir_state
    (** State 014.
        Stack shape : AO.
        Start symbol: main. *)

  | MenhirState015 : (('s, _menhir_box_main) _menhir_cell1_WHILE, _menhir_box_main) _menhir_state
    (** State 015.
        Stack shape : WHILE.
        Start symbol: main. *)

  | MenhirState017 : (('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_state
    (** State 017.
        Stack shape : PO.
        Start symbol: main. *)

  | MenhirState018 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_STAR, _menhir_box_main) _menhir_state
    (** State 018.
        Stack shape : PO STAR.
        Start symbol: main. *)

  | MenhirState019 : (('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_state
    (** State 019.
        Stack shape : PO.
        Start symbol: main. *)

  | MenhirState023 : (('s, _menhir_box_main) _menhir_cell1_NUM, _menhir_box_main) _menhir_state
    (** State 023.
        Stack shape : NUM.
        Start symbol: main. *)

  | MenhirState029 : (('s, _menhir_box_main) _menhir_cell1_DENOM, _menhir_box_main) _menhir_state
    (** State 029.
        Stack shape : DENOM.
        Start symbol: main. *)

  | MenhirState030 : (('s, _menhir_box_main) _menhir_cell1_CO, _menhir_box_main) _menhir_state
    (** State 030.
        Stack shape : CO.
        Start symbol: main. *)

  | MenhirState033 : (('s, _menhir_box_main) _menhir_cell1_CALL _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 033.
        Stack shape : CALL ID.
        Start symbol: main. *)

  | MenhirState036 : (('s, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 036.
        Stack shape : e.
        Start symbol: main. *)

  | MenhirState040 : ((('s, _menhir_box_main) _menhir_cell1_CO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 040.
        Stack shape : CO e.
        Start symbol: main. *)

  | MenhirState045 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_NEW, _menhir_box_main) _menhir_state
    (** State 045.
        Stack shape : PO NEW.
        Start symbol: main. *)

  | MenhirState049 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 049.
        Stack shape : PO e.
        Start symbol: main. *)

  | MenhirState051 : (((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 051.
        Stack shape : PO e e.
        Start symbol: main. *)

  | MenhirState054 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 054.
        Stack shape : PO e.
        Start symbol: main. *)

  | MenhirState058 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 058.
        Stack shape : PO e.
        Start symbol: main. *)

  | MenhirState061 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 061.
        Stack shape : PO e.
        Start symbol: main. *)

  | MenhirState064 : ((('s, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 064.
        Stack shape : PO e.
        Start symbol: main. *)

  | MenhirState067 : ((('s, _menhir_box_main) _menhir_cell1_WHILE, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 067.
        Stack shape : WHILE e.
        Start symbol: main. *)

  | MenhirState069 : (('s, _menhir_box_main) _menhir_cell1_RETURN, _menhir_box_main) _menhir_state
    (** State 069.
        Stack shape : RETURN.
        Start symbol: main. *)

  | MenhirState072 : (('s, _menhir_box_main) _menhir_cell1_PRINT, _menhir_box_main) _menhir_state
    (** State 072.
        Stack shape : PRINT.
        Start symbol: main. *)

  | MenhirState075 : (('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_state
    (** State 075.
        Stack shape : IF.
        Start symbol: main. *)

  | MenhirState076 : ((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_state
    (** State 076.
        Stack shape : IF e.
        Start symbol: main. *)

  | MenhirState078 : (((('s, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_cell1_bloc, _menhir_box_main) _menhir_state
    (** State 078.
        Stack shape : IF e bloc.
        Start symbol: main. *)

  | MenhirState087 : (('s, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 087.
        Stack shape : typ ID.
        Start symbol: main. *)

  | MenhirState092 : (('s, _menhir_box_main) _menhir_cell1_i, _menhir_box_main) _menhir_state
    (** State 092.
        Stack shape : i.
        Start symbol: main. *)

  | MenhirState095 : (('s, _menhir_box_main) _menhir_cell1_a, _menhir_box_main) _menhir_state
    (** State 095.
        Stack shape : a.
        Start symbol: main. *)

  | MenhirState103 : (('s, _menhir_box_main) _menhir_cell1_list_fonc_ _menhir_cell0_ID, _menhir_box_main) _menhir_state
    (** State 103.
        Stack shape : list(fonc) ID.
        Start symbol: main. *)

  | MenhirState105 : (('s, _menhir_box_main) _menhir_cell1_fonc, _menhir_box_main) _menhir_state
    (** State 105.
        Stack shape : fonc.
        Start symbol: main. *)


and ('s, 'r) _menhir_cell1_a = 
  | MenhirCell1_a of 's * ('s, 'r) _menhir_state * (Ast.AstSyntax.affectable)

and ('s, 'r) _menhir_cell1_bloc = 
  | MenhirCell1_bloc of 's * ('s, 'r) _menhir_state * (Ast.AstSyntax.bloc)

and ('s, 'r) _menhir_cell1_e = 
  | MenhirCell1_e of 's * ('s, 'r) _menhir_state * (Ast.AstSyntax.expression)

and ('s, 'r) _menhir_cell1_fonc = 
  | MenhirCell1_fonc of 's * ('s, 'r) _menhir_state * (Ast.AstSyntax.fonction)

and ('s, 'r) _menhir_cell1_i = 
  | MenhirCell1_i of 's * ('s, 'r) _menhir_state * (Ast.AstSyntax.instruction)

and ('s, 'r) _menhir_cell1_list_fonc_ = 
  | MenhirCell1_list_fonc_ of 's * ('s, 'r) _menhir_state * (Ast.AstSyntax.fonction list)

and ('s, 'r) _menhir_cell1_list_param_ = 
  | MenhirCell1_list_param_ of 's * ('s, 'r) _menhir_state * ((Type.typ * string) list)

and ('s, 'r) _menhir_cell1_param = 
  | MenhirCell1_param of 's * ('s, 'r) _menhir_state * (Type.typ * string)

and ('s, 'r) _menhir_cell1_typ = 
  | MenhirCell1_typ of 's * ('s, 'r) _menhir_state * (Type.typ)

and ('s, 'r) _menhir_cell1_AO = 
  | MenhirCell1_AO of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_CALL = 
  | MenhirCell1_CALL of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_CO = 
  | MenhirCell1_CO of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_DENOM = 
  | MenhirCell1_DENOM of 's * ('s, 'r) _menhir_state

and 's _menhir_cell0_ID = 
  | MenhirCell0_ID of 's * (
# 11 "parser.mly"
       (string)
# 278 "parser.ml"
)

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_NEW = 
  | MenhirCell1_NEW of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_NUM = 
  | MenhirCell1_NUM of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PO = 
  | MenhirCell1_PO of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PRINT = 
  | MenhirCell1_PRINT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_RETURN = 
  | MenhirCell1_RETURN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_STAR = 
  | MenhirCell1_STAR of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_WHILE = 
  | MenhirCell1_WHILE of 's * ('s, 'r) _menhir_state

and _menhir_box_main = 
  | MenhirBox_main of (Ast.AstSyntax.programme) [@@unboxed]

let _menhir_action_01 =
  fun n ->
    (
# 81 "parser.mly"
                          (Ident n)
# 313 "parser.ml"
     : (Ast.AstSyntax.affectable))

let _menhir_action_02 =
  fun aa ->
    (
# 82 "parser.mly"
                          (Valeur aa)
# 321 "parser.ml"
     : (Ast.AstSyntax.affectable))

let _menhir_action_03 =
  fun li ->
    (
# 68 "parser.mly"
                        (li)
# 329 "parser.ml"
     : (Ast.AstSyntax.bloc))

let _menhir_action_04 =
  fun lp n ->
    (
# 92 "parser.mly"
                          (AppelFonction (n,lp))
# 337 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_05 =
  fun e1 e2 ->
    (
# 93 "parser.mly"
                          (Binaire(Fraction,e1,e2))
# 345 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_06 =
  fun () ->
    (
# 95 "parser.mly"
                          (Booleen true)
# 353 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_07 =
  fun () ->
    (
# 96 "parser.mly"
                          (Booleen false)
# 361 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_08 =
  fun e ->
    (
# 97 "parser.mly"
                          (Entier e)
# 369 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_09 =
  fun e1 ->
    (
# 98 "parser.mly"
                          (Unaire(Numerateur,e1))
# 377 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_10 =
  fun e1 ->
    (
# 99 "parser.mly"
                          (Unaire(Denominateur,e1))
# 385 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_11 =
  fun e1 e2 ->
    (
# 100 "parser.mly"
                          (Binaire (Plus,e1,e2))
# 393 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_12 =
  fun e1 e2 ->
    (
# 101 "parser.mly"
                          (Binaire (Mult,e1,e2))
# 401 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_13 =
  fun e1 e2 ->
    (
# 102 "parser.mly"
                          (Binaire (Equ,e1,e2))
# 409 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_14 =
  fun e1 e2 ->
    (
# 103 "parser.mly"
                          (Binaire (Inf,e1,e2))
# 417 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_15 =
  fun exp ->
    (
# 104 "parser.mly"
                          (exp)
# 425 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_16 =
  fun e1 e2 e3 ->
    (
# 105 "parser.mly"
                                      (CondTer(e1,e2,e3))
# 433 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_17 =
  fun aa ->
    (
# 106 "parser.mly"
                           (Affectable aa)
# 441 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_18 =
  fun () ->
    (
# 107 "parser.mly"
                           (Null)
# 449 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_19 =
  fun t ->
    (
# 108 "parser.mly"
                           (New t)
# 457 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_20 =
  fun s ->
    (
# 109 "parser.mly"
                           (Adresse s)
# 465 "parser.ml"
     : (Ast.AstSyntax.expression))

let _menhir_action_21 =
  fun li lp n t ->
    (
# 64 "parser.mly"
                                          (Fonction(t,n,lp,li))
# 473 "parser.ml"
     : (Ast.AstSyntax.fonction))

let _menhir_action_22 =
  fun e1 n t ->
    (
# 71 "parser.mly"
                                    (Declaration (t,n,e1))
# 481 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_23 =
  fun e1 n ->
    (
# 72 "parser.mly"
                                    (Affectation (n,e1))
# 489 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_24 =
  fun e n ->
    (
# 73 "parser.mly"
                                    (Constante (n,e))
# 497 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_25 =
  fun e1 ->
    (
# 74 "parser.mly"
                                    (Affichage (e1))
# 505 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_26 =
  fun exp li1 li2 ->
    (
# 75 "parser.mly"
                                    (Conditionnelle (exp,li1,li2))
# 513 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_27 =
  fun exp li1 ->
    (
# 76 "parser.mly"
                                    (CondiSansElse (exp,li1))
# 521 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_28 =
  fun exp li ->
    (
# 77 "parser.mly"
                                    (TantQue (exp,li))
# 529 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_29 =
  fun exp ->
    (
# 78 "parser.mly"
                                    (Retour (exp))
# 537 "parser.ml"
     : (Ast.AstSyntax.instruction))

let _menhir_action_30 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 545 "parser.ml"
     : (Ast.AstSyntax.expression list))

let _menhir_action_31 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 553 "parser.ml"
     : (Ast.AstSyntax.expression list))

let _menhir_action_32 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 561 "parser.ml"
     : (Ast.AstSyntax.fonction list))

let _menhir_action_33 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 569 "parser.ml"
     : (Ast.AstSyntax.fonction list))

let _menhir_action_34 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 577 "parser.ml"
     : (Ast.AstSyntax.bloc))

let _menhir_action_35 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 585 "parser.ml"
     : (Ast.AstSyntax.bloc))

let _menhir_action_36 =
  fun () ->
    (
# 208 "<standard.mly>"
    ( [] )
# 593 "parser.ml"
     : ((Type.typ * string) list))

let _menhir_action_37 =
  fun x xs ->
    (
# 210 "<standard.mly>"
    ( x :: xs )
# 601 "parser.ml"
     : ((Type.typ * string) list))

let _menhir_action_38 =
  fun lfi ->
    (
# 60 "parser.mly"
                        (lfi)
# 609 "parser.ml"
     : (Ast.AstSyntax.programme))

let _menhir_action_39 =
  fun n t ->
    (
# 66 "parser.mly"
                    ((t,n))
# 617 "parser.ml"
     : (Type.typ * string))

let _menhir_action_40 =
  fun lf li ->
    (
# 62 "parser.mly"
                            (Programme (lf,li))
# 625 "parser.ml"
     : (Ast.AstSyntax.programme))

let _menhir_action_41 =
  fun () ->
    (
# 86 "parser.mly"
          (Bool)
# 633 "parser.ml"
     : (Type.typ))

let _menhir_action_42 =
  fun () ->
    (
# 87 "parser.mly"
          (Int)
# 641 "parser.ml"
     : (Type.typ))

let _menhir_action_43 =
  fun () ->
    (
# 88 "parser.mly"
          (Rat)
# 649 "parser.ml"
     : (Type.typ))

let _menhir_action_44 =
  fun t ->
    (
# 89 "parser.mly"
             (Pointeur t)
# 657 "parser.ml"
     : (Type.typ))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | AF ->
        "AF"
    | AO ->
        "AO"
    | BOOL ->
        "BOOL"
    | CALL ->
        "CALL"
    | CF ->
        "CF"
    | CO ->
        "CO"
    | CONST ->
        "CONST"
    | DENOM ->
        "DENOM"
    | DOUBLEP ->
        "DOUBLEP"
    | ELSE ->
        "ELSE"
    | ENTIER _ ->
        "ENTIER"
    | EOF ->
        "EOF"
    | EQUAL ->
        "EQUAL"
    | ESPER ->
        "ESPER"
    | FALSE ->
        "FALSE"
    | ID _ ->
        "ID"
    | IF ->
        "IF"
    | INF ->
        "INF"
    | INT ->
        "INT"
    | MULT ->
        "MULT"
    | NEW ->
        "NEW"
    | NUL ->
        "NUL"
    | NUM ->
        "NUM"
    | PF ->
        "PF"
    | PLUS ->
        "PLUS"
    | PO ->
        "PO"
    | POINTI ->
        "POINTI"
    | PRINT ->
        "PRINT"
    | PV ->
        "PV"
    | RAT ->
        "RAT"
    | RETURN ->
        "RETURN"
    | SLASH ->
        "SLASH"
    | STAR ->
        "STAR"
    | TRUE ->
        "TRUE"
    | WHILE ->
        "WHILE"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37-39"]
  
  let rec _menhir_run_104 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_list_fonc_ _menhir_cell0_ID -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _v _tok ->
      let MenhirCell0_ID (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_list_fonc_ (_menhir_stack, _, lf) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_40 lf li in
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let lfi = _v in
          let _v = _menhir_action_38 lfi in
          MenhirBox_main _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_004 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | STAR ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ID _v_0 ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PO ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RAT ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_43 () in
                  _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState007 _tok
              | INT ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_42 () in
                  _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState007 _tok
              | BOOL ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_41 () in
                  _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState007 _tok
              | PF ->
                  let _v = _menhir_action_36 () in
                  _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState007
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_005 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_typ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_typ (_menhir_stack, _menhir_s, t) = _menhir_stack in
      let _v = _menhir_action_44 t in
      _menhir_goto_typ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_typ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState092 ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState014 ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState045 ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState010 ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState007 ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState105 ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState000 ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_085 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | STAR ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ID _v_0 ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EQUAL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TRUE ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_06 () in
                  _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | PO ->
                  _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState087
              | NUM ->
                  _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState087
              | NUL ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_18 () in
                  _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | ID _v_3 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let n = _v_3 in
                  let _v = _menhir_action_01 n in
                  _menhir_run_038_spec_087 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | FALSE ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_07 () in
                  _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | ESPER ->
                  _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState087
              | ENTIER _v_6 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let e = _v_6 in
                  let _v = _menhir_action_08 e in
                  _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | DENOM ->
                  _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState087
              | CO ->
                  _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState087
              | CALL ->
                  _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState087
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_088 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_ID (_menhir_stack, n) = _menhir_stack in
          let MenhirCell1_typ (_menhir_stack, _menhir_s, t) = _menhir_stack in
          let e1 = _v in
          let _v = _menhir_action_22 e1 n t in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_i : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_i (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState092
      | RETURN ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState092
      | RAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_43 () in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState092 _tok
      | PRINT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState092
      | PO ->
          _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState092
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_42 () in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState092 _tok
      | IF ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState092
      | ID _v_2 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v_2 in
          let _v = _menhir_action_01 n in
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState092 _tok
      | CONST ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState092
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_41 () in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState092 _tok
      | AF ->
          let _v = _menhir_action_34 () in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_015 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_WHILE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState015 _tok
      | PO ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState015
      | NUM ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState015
      | NUL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_18 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState015 _tok
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_01 n in
          _menhir_run_038_spec_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_07 () in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState015 _tok
      | ESPER ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState015
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_08 e in
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState015 _tok
      | DENOM ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState015
      | CO ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState015
      | CALL ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState015
      | _ ->
          _eRR ()
  
  and _menhir_run_067 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_WHILE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | AO ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState067
      | _ ->
          _eRR ()
  
  and _menhir_run_014 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_AO (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | WHILE ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState014
      | RETURN ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState014
      | RAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_43 () in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState014 _tok
      | PRINT ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState014
      | PO ->
          _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState014
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_42 () in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState014 _tok
      | IF ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState014
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_01 n in
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState014 _tok
      | CONST ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState014
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_41 () in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState014 _tok
      | AF ->
          let _v = _menhir_action_34 () in
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_069 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_RETURN (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PO ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | NUM ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | NUL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_18 () in
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_01 n in
          _menhir_run_038_spec_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_07 () in
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ESPER ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_08 e in
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | DENOM ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | CO ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | CALL ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | _ ->
          _eRR ()
  
  and _menhir_run_070 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_RETURN -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_RETURN (_menhir_stack, _menhir_s) = _menhir_stack in
          let exp = _v in
          let _v = _menhir_action_29 exp in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_017 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PO (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState017 _tok
      | STAR ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | PO ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | NUM ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | NUL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_18 () in
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState017 _tok
      | NEW ->
          let _menhir_stack = MenhirCell1_NEW (_menhir_stack, MenhirState017) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | RAT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_43 () in
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState045 _tok
          | INT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_42 () in
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState045 _tok
          | BOOL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_41 () in
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState045 _tok
          | _ ->
              _eRR ())
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_01 n in
          _menhir_run_038_spec_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_07 () in
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState017 _tok
      | ESPER ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_08 e in
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState017 _tok
      | DENOM ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | CO ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | CALL ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | _ ->
          _eRR ()
  
  and _menhir_run_048 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | POINTI ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState049 _tok
          | PO ->
              _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState049
          | NUM ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState049
          | NUL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_18 () in
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState049 _tok
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_2 in
              let _v = _menhir_action_01 n in
              _menhir_run_038_spec_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_07 () in
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState049 _tok
          | ESPER ->
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState049
          | ENTIER _v_5 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_5 in
              let _v = _menhir_action_08 e in
              _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState049 _tok
          | DENOM ->
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState049
          | CO ->
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState049
          | CALL ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState049
          | _ ->
              _eRR ())
      | PLUS ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
          | NUM ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
          | NUL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_18 () in
              _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ID _v_9 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_9 in
              let _v = _menhir_action_01 n in
              _menhir_run_038_spec_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_07 () in
              _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ESPER ->
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
          | ENTIER _v_12 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_12 in
              let _v = _menhir_action_08 e in
              _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
          | CO ->
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
          | CALL ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
          | _ ->
              _eRR ())
      | PF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_PO (_menhir_stack, _menhir_s) = _menhir_stack in
          let exp = _v in
          let _v = _menhir_action_15 exp in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MULT ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | NUM ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | NUL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_18 () in
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ID _v_16 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_16 in
              let _v = _menhir_action_01 n in
              _menhir_run_038_spec_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_07 () in
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ESPER ->
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | ENTIER _v_19 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_19 in
              let _v = _menhir_action_08 e in
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | CO ->
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | CALL ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | _ ->
              _eRR ())
      | INF ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
          | NUM ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
          | NUL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_18 () in
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ID _v_23 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_23 in
              let _v = _menhir_action_01 n in
              _menhir_run_038_spec_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_07 () in
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ESPER ->
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
          | ENTIER _v_26 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_26 in
              let _v = _menhir_action_08 e in
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
          | CO ->
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
          | CALL ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
          | _ ->
              _eRR ())
      | EQUAL ->
          let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
          | NUM ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
          | NUL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_18 () in
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ID _v_30 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_30 in
              let _v = _menhir_action_01 n in
              _menhir_run_038_spec_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_07 () in
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ESPER ->
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
          | ENTIER _v_33 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_33 in
              let _v = _menhir_action_08 e in
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
          | CO ->
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
          | CALL ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_050 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | DOUBLEP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
          | NUM ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
          | NUL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_18 () in
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_2 in
              let _v = _menhir_action_01 n in
              _menhir_run_038_spec_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_07 () in
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ESPER ->
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
          | ENTIER _v_5 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_5 in
              let _v = _menhir_action_08 e in
              _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
          | CO ->
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
          | CALL ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState051
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_052 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_e (_menhir_stack, _, e2) = _menhir_stack in
          let MenhirCell1_e (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_PO (_menhir_stack, _menhir_s) = _menhir_stack in
          let e3 = _v in
          let _v = _menhir_action_16 e1 e2 e3 in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_e : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState095 ->
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState087 ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState075 ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState072 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState069 ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState015 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState064 ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState061 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState058 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState054 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState051 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState049 ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState017 ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState023 ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState029 ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState040 ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState030 ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState036 ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState033 ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_096 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_a -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_a (_menhir_stack, _menhir_s, n) = _menhir_stack in
          let e1 = _v in
          let _v = _menhir_action_23 e1 n in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_076 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | AO ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState076
      | _ ->
          _eRR ()
  
  and _menhir_run_073 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_PRINT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PV ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_PRINT (_menhir_stack, _menhir_s) = _menhir_stack in
          let e1 = _v in
          let _v = _menhir_action_25 e1 in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_065 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_e (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_PO (_menhir_stack, _menhir_s) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_13 e1 e2 in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_062 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_e (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_PO (_menhir_stack, _menhir_s) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_14 e1 e2 in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_059 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_e (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_PO (_menhir_stack, _menhir_s) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_12 e1 e2 in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_055 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_e (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_PO (_menhir_stack, _menhir_s) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_11 e1 e2 in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_044 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_NUM -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_NUM (_menhir_stack, _menhir_s) = _menhir_stack in
      let e1 = _v in
      let _v = _menhir_action_09 e1 in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_043 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_DENOM -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_DENOM (_menhir_stack, _menhir_s) = _menhir_stack in
      let e1 = _v in
      let _v = _menhir_action_10 e1 in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_041 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_CO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | CF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_e (_menhir_stack, _, e1) = _menhir_stack in
          let MenhirCell1_CO (_menhir_stack, _menhir_s) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_05 e1 e2 in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_039 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_CO as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SLASH ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
          | NUM ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
          | NUL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_18 () in
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_2 in
              let _v = _menhir_action_01 n in
              _menhir_run_038_spec_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_07 () in
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ESPER ->
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
          | ENTIER _v_5 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_5 in
              let _v = _menhir_action_08 e in
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
          | CO ->
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
          | CALL ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState040
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_023 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_NUM (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PO ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState023
      | NUM ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState023
      | NUL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_18 () in
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_01 n in
          _menhir_run_038_spec_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_07 () in
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ESPER ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState023
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_08 e in
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | DENOM ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState023
      | CO ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState023
      | CALL ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState023
      | _ ->
          _eRR ()
  
  and _menhir_run_038_spec_023 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_NUM -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let aa = _v in
      let _v = _menhir_action_17 aa in
      _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_026 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let s = _v in
          let _v = _menhir_action_20 s in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_029 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_DENOM (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PO ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState029
      | NUM ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState029
      | NUL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_18 () in
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_01 n in
          _menhir_run_038_spec_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_07 () in
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ESPER ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState029
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_08 e in
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | DENOM ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState029
      | CO ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState029
      | CALL ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState029
      | _ ->
          _eRR ()
  
  and _menhir_run_038_spec_029 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_DENOM -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let aa = _v in
      let _v = _menhir_action_17 aa in
      _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_030 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_CO (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState030 _tok
      | PO ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | NUM ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | NUL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_18 () in
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState030 _tok
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_01 n in
          _menhir_run_038_spec_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_07 () in
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState030 _tok
      | ESPER ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_08 e in
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState030 _tok
      | DENOM ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | CO ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | CALL ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState030
      | _ ->
          _eRR ()
  
  and _menhir_run_038_spec_030 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_CO -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let aa = _v in
      let _v = _menhir_action_17 aa in
      _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState030 _tok
  
  and _menhir_run_031 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_CALL (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PO ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | TRUE ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_06 () in
                  _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState033 _tok
              | PO ->
                  _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState033
              | NUM ->
                  _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState033
              | NUL ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_18 () in
                  _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState033 _tok
              | ID _v_2 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let n = _v_2 in
                  let _v = _menhir_action_01 n in
                  _menhir_run_038_spec_033 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | FALSE ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let _v = _menhir_action_07 () in
                  _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState033 _tok
              | ESPER ->
                  _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState033
              | ENTIER _v_5 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let e = _v_5 in
                  let _v = _menhir_action_08 e in
                  _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState033 _tok
              | DENOM ->
                  _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState033
              | CO ->
                  _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState033
              | CALL ->
                  _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState033
              | PF ->
                  let _v = _menhir_action_30 () in
                  _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _v
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_036 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_e (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState036 _tok
      | PO ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
      | NUM ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
      | NUL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_18 () in
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState036 _tok
      | ID _v_2 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v_2 in
          let _v = _menhir_action_01 n in
          _menhir_run_038_spec_036 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_07 () in
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState036 _tok
      | ESPER ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
      | ENTIER _v_5 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v_5 in
          let _v = _menhir_action_08 e in
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState036 _tok
      | DENOM ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
      | CO ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
      | CALL ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
      | PF ->
          let _v = _menhir_action_30 () in
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_038_spec_036 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let aa = _v in
      let _v = _menhir_action_17 aa in
      _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState036 _tok
  
  and _menhir_run_037 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_e (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_31 x xs in
      _menhir_goto_list_e_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_e_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState036 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState033 ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_034 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_CALL _menhir_cell0_ID -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell0_ID (_menhir_stack, n) = _menhir_stack in
      let MenhirCell1_CALL (_menhir_stack, _menhir_s) = _menhir_stack in
      let lp = _v in
      let _v = _menhir_action_04 lp n in
      _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_038_spec_033 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_CALL _menhir_cell0_ID -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let aa = _v in
      let _v = _menhir_action_17 aa in
      _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState033 _tok
  
  and _menhir_run_038_spec_040 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_CO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let aa = _v in
      let _v = _menhir_action_17 aa in
      _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_038_spec_051 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let aa = _v in
      let _v = _menhir_action_17 aa in
      _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_038_spec_049 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let aa = _v in
      let _v = _menhir_action_17 aa in
      _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState049 _tok
  
  and _menhir_run_038_spec_054 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let aa = _v in
      let _v = _menhir_action_17 aa in
      _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_038_spec_058 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let aa = _v in
      let _v = _menhir_action_17 aa in
      _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_038_spec_061 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let aa = _v in
      let _v = _menhir_action_17 aa in
      _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_038_spec_064 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let aa = _v in
      let _v = _menhir_action_17 aa in
      _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_018 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO as 'stack) -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_STAR (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PO ->
          _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_01 n in
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_019 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PO (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STAR ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState019
      | _ ->
          _eRR ()
  
  and _menhir_run_021 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_STAR -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | PF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_STAR (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_PO (_menhir_stack, _menhir_s) = _menhir_stack in
          let aa = _v in
          let _v = _menhir_action_02 aa in
          _menhir_goto_a _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_a : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState014 ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState092 ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState095 ->
          _menhir_run_038_spec_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState087 ->
          _menhir_run_038_spec_087 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState075 ->
          _menhir_run_038_spec_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState072 ->
          _menhir_run_038_spec_072 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState069 ->
          _menhir_run_038_spec_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState015 ->
          _menhir_run_038_spec_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState017 ->
          _menhir_run_038_spec_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState064 ->
          _menhir_run_038_spec_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState061 ->
          _menhir_run_038_spec_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState058 ->
          _menhir_run_038_spec_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState054 ->
          _menhir_run_038_spec_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState049 ->
          _menhir_run_038_spec_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState051 ->
          _menhir_run_038_spec_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState023 ->
          _menhir_run_038_spec_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState029 ->
          _menhir_run_038_spec_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState030 ->
          _menhir_run_038_spec_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState040 ->
          _menhir_run_038_spec_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState033 ->
          _menhir_run_038_spec_033 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState036 ->
          _menhir_run_038_spec_036 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState018 ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_094 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_a (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | EQUAL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_06 () in
              _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | PO ->
              _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState095
          | NUM ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState095
          | NUL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_18 () in
              _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ID _v_2 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let n = _v_2 in
              let _v = _menhir_action_01 n in
              _menhir_run_038_spec_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | FALSE ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_07 () in
              _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | ESPER ->
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState095
          | ENTIER _v_5 ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let e = _v_5 in
              let _v = _menhir_action_08 e in
              _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | DENOM ->
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState095
          | CO ->
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState095
          | CALL ->
              _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState095
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_038_spec_095 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_a -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let aa = _v in
      let _v = _menhir_action_17 aa in
      _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_038_spec_087 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let aa = _v in
      let _v = _menhir_action_17 aa in
      _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_038_spec_075 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_IF -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let aa = _v in
      let _v = _menhir_action_17 aa in
      _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState075 _tok
  
  and _menhir_run_038_spec_072 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_PRINT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let aa = _v in
      let _v = _menhir_action_17 aa in
      _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_038_spec_069 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_RETURN -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let aa = _v in
      let _v = _menhir_action_17 aa in
      _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_038_spec_015 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_WHILE -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let aa = _v in
      let _v = _menhir_action_17 aa in
      _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState015 _tok
  
  and _menhir_run_038_spec_017 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_PO -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let aa = _v in
      let _v = _menhir_action_17 aa in
      _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState017 _tok
  
  and _menhir_run_046 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_PO, _menhir_box_main) _menhir_cell1_NEW as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | STAR ->
          let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer
      | PF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_NEW (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_PO (_menhir_stack, _menhir_s) = _menhir_stack in
          let t = _v in
          let _v = _menhir_action_19 t in
          _menhir_goto_e _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_072 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PRINT (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PO ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | NUM ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | NUL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_18 () in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_01 n in
          _menhir_run_038_spec_072 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_07 () in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ESPER ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_08 e in
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | DENOM ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | CO ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | CALL ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState072
      | _ ->
          _eRR ()
  
  and _menhir_run_075 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_06 () in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState075 _tok
      | PO ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | NUM ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | NUL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_18 () in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState075 _tok
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let n = _v in
          let _v = _menhir_action_01 n in
          _menhir_run_038_spec_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | FALSE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_07 () in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState075 _tok
      | ESPER ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | ENTIER _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let e = _v in
          let _v = _menhir_action_08 e in
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState075 _tok
      | DENOM ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | CO ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | CALL ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState075
      | _ ->
          _eRR ()
  
  and _menhir_run_080 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EQUAL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | ENTIER _v_0 ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | PV ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let (n, e) = (_v, _v_0) in
                      let _v = _menhir_action_24 e n in
                      _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_090 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_AO -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_AO (_menhir_stack, _menhir_s) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_03 li in
      _menhir_goto_bloc _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_bloc : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState103 ->
          _menhir_run_104 _menhir_stack _v _tok
      | MenhirState013 ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState078 ->
          _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState076 ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState067 ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_098 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID, _menhir_box_main) _menhir_cell1_list_param_ -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_list_param_ (_menhir_stack, _, lp) = _menhir_stack in
      let MenhirCell0_ID (_menhir_stack, n) = _menhir_stack in
      let MenhirCell1_typ (_menhir_stack, _menhir_s, t) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_21 li lp n t in
      let _menhir_stack = MenhirCell1_fonc (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_43 () in
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState105 _tok
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_42 () in
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState105 _tok
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_41 () in
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState105 _tok
      | ID _ ->
          let _v = _menhir_action_32 () in
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_106 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_fonc -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_fonc (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_33 x xs in
      _menhir_goto_list_fonc_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list_fonc_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState105 ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState000 ->
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_102 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_list_fonc_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | AO ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState103
          | _ ->
              _eRR ())
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_079 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_e, _menhir_box_main) _menhir_cell1_bloc -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_bloc (_menhir_stack, _, li1) = _menhir_stack in
      let MenhirCell1_e (_menhir_stack, _, exp) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
      let li2 = _v in
      let _v = _menhir_action_26 exp li1 li2 in
      _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_077 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_IF, _menhir_box_main) _menhir_cell1_e as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ELSE ->
          let _menhir_stack = MenhirCell1_bloc (_menhir_stack, _menhir_s, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | AO ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState078
          | _ ->
              _eRR ())
      | AF | BOOL | CONST | ID _ | IF | INT | PO | PRINT | RAT | RETURN | WHILE ->
          let MenhirCell1_e (_menhir_stack, _, exp) = _menhir_stack in
          let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
          let li1 = _v in
          let _v = _menhir_action_27 exp li1 in
          _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_068 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_WHILE, _menhir_box_main) _menhir_cell1_e -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_e (_menhir_stack, _, exp) = _menhir_stack in
      let MenhirCell1_WHILE (_menhir_stack, _menhir_s) = _menhir_stack in
      let li = _v in
      let _v = _menhir_action_28 exp li in
      _menhir_goto_i _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_093 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_i -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_i (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_35 x xs in
      _menhir_goto_list_i_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_i_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState092 ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState014 ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_008 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | STAR ->
          let _menhir_stack = MenhirCell1_typ (_menhir_stack, _menhir_s, _v) in
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer
      | ID _v_0 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (t, n) = (_v, _v_0) in
          let _v = _menhir_action_39 n t in
          let _menhir_stack = MenhirCell1_param (_menhir_stack, _menhir_s, _v) in
          (match (_tok : MenhirBasics.token) with
          | RAT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_43 () in
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState010 _tok
          | INT ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_42 () in
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState010 _tok
          | BOOL ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let _v = _menhir_action_41 () in
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState010 _tok
          | PF ->
              let _v = _menhir_action_36 () in
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_011 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_param -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_param (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_37 x xs in
      _menhir_goto_list_param_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_param_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState007 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState010 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_012 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_typ _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_list_param_ (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | AO ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState013
      | _ ->
          _eRR ()
  
  let rec _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | RAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_43 () in
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | INT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_42 () in
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | BOOL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_41 () in
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | ID _ ->
          let _v = _menhir_action_32 () in
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState000 _tok
      | _ ->
          _eRR ()
  
end

let main =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_main v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
