/* Imports. */

%{

open Type
open Ast.AstSyntax
%}


%token <int> ENTIER
%token <string> ID
%token RETURN
%token PV
%token AO
%token AF
%token PF
%token PO
%token EQUAL
%token CONST
%token PRINT
%token NUL
%token NEW
%token IF
%token ELSE
%token WHILE
%token BOOL
%token INT
%token RAT
%token CALL 
%token CO
%token CF
%token SLASH
%token NUM
%token DENOM
%token TRUE
%token FALSE
%token PLUS
%token MULT
%token DOUBLEP
%token POINTI
%token STAR
%token ESPER
%token INF
%token EOF

(* Type de l'attribut synthétisé des non-terminaux *)
%type <programme> prog
%type <instruction list> bloc
%type <fonction> fonc
%type <instruction> i
%type <typ> typ
%type <typ*string> param
%type <expression> e 

(* Type et définition de l'axiome *)
(* Les règles qui ont des commentaires à coté ont été créés pour l'extension de rat *)
%start <Ast.AstSyntax.programme> main

%%

main : lfi=prog EOF     {lfi}

prog : lf=fonc* ID li=bloc  {Programme (lf,li)}

fonc : t=typ n=ID PO lp=param* PF li=bloc {Fonction(t,n,lp,li)}

param : t=typ n=ID  {(t,n)}

bloc : AO li=i* AF      {li}

i :
| t=typ n=ID EQUAL e1=e PV          {Declaration (t,n,e1)}
| n=a EQUAL e1=e PV                 {Affectation (n,e1)} (* Règle 9 : modifier pour les pointeurs *)
| CONST n=ID EQUAL e=ENTIER PV      {Constante (n,e)}
| PRINT e1=e PV                     {Affichage (e1)}
| IF exp=e li1=bloc ELSE li2=bloc   {Conditionnelle (exp,li1,li2)}
| IF exp=e li1=bloc                 {CondiSansElse (exp,li1)} (* Règle 13 *)
| WHILE exp=e li=bloc               {TantQue (exp,li)} 
| RETURN exp=e PV                   {Retour (exp)}

a :
| n=ID                    {Ident n} (* Règle 20 *)
| PO STAR aa=a PF         {Valeur aa} (* Règle 21 *)


typ :
| BOOL    {Bool}
| INT     {Int}
| RAT     {Rat}
| t=typ STAR {Pointeur t} (* Règle 27 *)

e : 
| CALL n=ID PO lp=e* PF   {AppelFonction (n,lp)}
| CO e1=e SLASH e2=e CF   {Binaire(Fraction,e1,e2)}
| TRUE                    {Booleen true}
| FALSE                   {Booleen false}
| e=ENTIER                {Entier e}
| NUM e1=e                {Unaire(Numerateur,e1)}
| DENOM e1=e              {Unaire(Denominateur,e1)}
| PO e1=e PLUS e2=e PF    {Binaire (Plus,e1,e2)}
| PO e1=e MULT e2=e PF    {Binaire (Mult,e1,e2)}
| PO e1=e EQUAL e2=e PF   {Binaire (Equ,e1,e2)}
| PO e1=e INF e2=e PF     {Binaire (Inf,e1,e2)}
| PO exp=e PF             {exp}
| PO e1=e POINTI e2=e DOUBLEP e3=e PF {CondTer(e1,e2,e3)} (* Règle 42 *)
| aa=a                     {Affectable aa} (* Règle 43 *)
| NUL                      {Null} (* Règle 44 *)
| PO NEW t=typ PF          {New t} (* Règle 45 *)
| ESPER s=ID               {Adresse s} (* Règle 46 *)


