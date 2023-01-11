
(* The type of tokens. *)

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
  | ID of (string)
  | FALSE
  | ESPER
  | EQUAL
  | EOF
  | ENTIER of (int)
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

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.AstSyntax.programme)
