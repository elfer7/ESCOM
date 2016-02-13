/*
	IPN - ESCOM
	Compiladores - 3CV5
	Ortega Ortuño Eder - blog.nativehex.com/compiladores
*/

/* Sección de declaraciones en C */
%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
#include "NHX_Generic_TablaSimbolos.h"

#ifdef __cplusplus
// Al compilar con G++ y linkear la librería de Flex, se produce un error a menos que indiquemos que se debe utilizar el compilador de C (no es válido 'g++ -lfl algo.yy.c')
extern "C"
{
#endif
	FILE *yyin;
	int yylex();
	int yyparse();
#ifdef __cplusplus
}
#endif

// Prototipos de la función
void yyerror(const char *);

// Tabla de símbolos
extern struct Simbolo tablaSimbolos[];
%}

/* Sección de definiciones de Bison */
// Con la estructura UNION, prescindimos de especificar el YYSTYPE (tipo de dato por defecto a utilizar en Bison, el cual puede ser int, double, char *, etc.) y en cambio podemos usar diferentes tipos de datos
%union{
	int nhx_valorEntero;
	float nhx_valorFlotante;
	char *nhx_valorString;
}
// Símbolos terminales
%token <nhx_valorString> NHX_TOKEN_STRING
%token <nhx_valorEntero> NHX_TOKEN_ENTERO
%token <nhx_valorFlotante> NHX_TOKEN_FLOTANTE
%token <nhx_valorString> NHX_TOKEN_VARIABLE
%token NHX_TOKEN_SUMA NHX_TOKEN_RESTA NHX_TOKEN_MULTIPLICACION NHX_TOKEN_DIVISION NHX_TOKEN_MODULO NHX_TOKEN_POTENCIA
%token NHX_TOKEN_ASIGNACION NHX_TOKEN_PARENTESIS_APERTURA NHX_TOKEN_PARENTESIS_CIERRE NHX_TOKEN_SEMICOLON
%token NHX_TOKEN_KEYWORD_ENTERO NHX_TOKEN_KEYWORD_DECIMAL NHX_TOKEN_KEYWORD_CADENA NHX_TOKEN_KEYWORD_FUNCION NHX_TOKEN_KEYWORD_SALIR
%token NHX_TOKEN_DECIMAL
%token NHX_TOKEN_LINEA
%token NHX_TOKEN_CAD
// Símbolos no terminales
%type <nhx_valorEntero> nhx_expresionEntera
%type <nhx_valorFlotante> nhx_expresionDecimal
%type <nhx_valorString> nhx_expresionString
%type <nhx_valorEntero> nhx_expresionVarEnt
%type <nhx_valorFlotante> nhx_expresionVarDec
%type <nhx_valorString> nhx_expresionVarStr
// Precedencia de operadores
%left NHX_TOKEN_SUMA NHX_TOKEN_RESTA
%left NHX_TOKEN_MULTIPLICACION NHX_TOKEN_DIVISION NHX_TOKEN_MODULO
%left NHX_TOKEN_POTENCIA

%%
/* Sección de reglas gramaticales (producciones de la gramática) */
nhx_entrada:
		/* Cadena vacía */
	|	nhx_entrada nhx_linea
;
nhx_linea:
		NHX_TOKEN_LINEA
	|	nhx_expresionString NHX_TOKEN_LINEA {printf("\t\tResultado [str]: %s\n", $1);};
	|	nhx_expresionEntera NHX_TOKEN_LINEA {printf("\t\tResultado [int]: %d\n", $1);} 
	|	nhx_expresionDecimal NHX_TOKEN_LINEA {printf("\t\tResultado [dec]: %f\n", $1);}
	|	nhx_expresionFuncion NHX_TOKEN_LINEA {printf("\t\tFuncion encontrada\n");}
	|	nhx_expresionDeclaracion NHX_TOKEN_LINEA {printf("\t\tDeclaracion encontrada\n"); NativeHex_DebugTS();}
	|	nhx_expresionAsignacion NHX_TOKEN_LINEA {printf("\t\tAsignacion encontrada\n"); NativeHex_DebugTS();}
	|	NHX_TOKEN_KEYWORD_SALIR NHX_TOKEN_LINEA {printf("Chau!\n"); exit(0);}
;
nhx_expresionString:
		NHX_TOKEN_STRING {$$ = $1;}
	|	NHX_TOKEN_STRING NHX_TOKEN_SUMA NHX_TOKEN_STRING {limpiarCadena($1); $$ = strcat($1, $3);}
	|	nhx_expresionVarStr {$$ = $1;}
;
nhx_expresionEntera:
		NHX_TOKEN_ENTERO {$$ = $1;}
	|	NHX_TOKEN_SUMA NHX_TOKEN_ENTERO {$$ = $2;}
	|	NHX_TOKEN_RESTA NHX_TOKEN_ENTERO {$$ = $2 * -1;}
	| 	nhx_expresionEntera NHX_TOKEN_SUMA nhx_expresionEntera {$$ = $1 + $3;}
	| 	nhx_expresionEntera NHX_TOKEN_RESTA nhx_expresionEntera {$$ = $1 - $3;}
	| 	nhx_expresionEntera NHX_TOKEN_MULTIPLICACION nhx_expresionEntera {$$ = $1 * $3;}
	| 	nhx_expresionEntera NHX_TOKEN_DIVISION nhx_expresionEntera {$$ = $1 / $3;}
	| 	nhx_expresionEntera NHX_TOKEN_MODULO nhx_expresionEntera {$$ = $1 % $3;}
	| 	nhx_expresionEntera NHX_TOKEN_POTENCIA nhx_expresionEntera {$$ = pow($1, $3);}
	|	nhx_expresionVarEnt {$$ = $1;}
;
nhx_expresionDecimal:
		NHX_TOKEN_FLOTANTE {$$ = $1;}
	|	NHX_TOKEN_SUMA NHX_TOKEN_FLOTANTE {$$ = $2;}
	|	NHX_TOKEN_RESTA NHX_TOKEN_FLOTANTE {$$ = $2 * -1;}
	| 	nhx_expresionDecimal NHX_TOKEN_SUMA nhx_expresionDecimal {$$ = $1 + $3;}
	| 	nhx_expresionDecimal NHX_TOKEN_RESTA nhx_expresionDecimal {$$ = $1 - $3;}
	| 	nhx_expresionDecimal NHX_TOKEN_MULTIPLICACION nhx_expresionDecimal {$$ = $1 * $3;}
	| 	nhx_expresionDecimal NHX_TOKEN_DIVISION nhx_expresionDecimal {$$ = $1 / $3;}
	| 	nhx_expresionDecimal NHX_TOKEN_MODULO nhx_expresionDecimal {$$ = (int) $1 % (int) $3;}
	| 	nhx_expresionDecimal NHX_TOKEN_POTENCIA nhx_expresionDecimal {$$ = pow($1, $3);}
	| 	nhx_expresionEntera NHX_TOKEN_SUMA nhx_expresionDecimal {$$ = (float) $1 + $3;}
	| 	nhx_expresionEntera NHX_TOKEN_RESTA nhx_expresionDecimal {$$ = (float) $1 - $3;}
	| 	nhx_expresionEntera NHX_TOKEN_MULTIPLICACION nhx_expresionDecimal {$$ = (float) $1 * $3;}
	| 	nhx_expresionEntera NHX_TOKEN_DIVISION nhx_expresionDecimal {$$ = (float) $1 / $3;}
	| 	nhx_expresionEntera NHX_TOKEN_MODULO nhx_expresionDecimal {$$ = (int) $1 % (int) $3;}
	| 	nhx_expresionEntera NHX_TOKEN_POTENCIA nhx_expresionDecimal {$$ = pow($1, $3);}
	| 	nhx_expresionDecimal NHX_TOKEN_SUMA nhx_expresionEntera {$$ = $1 + (float) $3;}
	| 	nhx_expresionDecimal NHX_TOKEN_RESTA nhx_expresionEntera {$$ = $1 - (float) $3;}
	| 	nhx_expresionDecimal NHX_TOKEN_MULTIPLICACION nhx_expresionEntera {$$ = $1 * (float) $3;}
	| 	nhx_expresionDecimal NHX_TOKEN_DIVISION nhx_expresionEntera {$$ = $1 / (float) $3;}
	| 	nhx_expresionDecimal NHX_TOKEN_MODULO nhx_expresionEntera {$$ = (int) $1 % (int) $3;}
	| 	nhx_expresionDecimal NHX_TOKEN_POTENCIA nhx_expresionEntera {$$ = pow($1, $3);}
	|	nhx_expresionVarDec {$$ = $1;}
;
nhx_expresionFuncion:
		NHX_TOKEN_KEYWORD_FUNCION NHX_TOKEN_KEYWORD_ENTERO NHX_TOKEN_VARIABLE NHX_TOKEN_PARENTESIS_APERTURA NHX_TOKEN_PARENTESIS_CIERRE NHX_TOKEN_SEMICOLON
	|	NHX_TOKEN_KEYWORD_FUNCION NHX_TOKEN_KEYWORD_DECIMAL NHX_TOKEN_VARIABLE NHX_TOKEN_PARENTESIS_APERTURA NHX_TOKEN_PARENTESIS_CIERRE NHX_TOKEN_SEMICOLON
	|	NHX_TOKEN_KEYWORD_FUNCION NHX_TOKEN_KEYWORD_CADENA NHX_TOKEN_VARIABLE NHX_TOKEN_PARENTESIS_APERTURA NHX_TOKEN_PARENTESIS_CIERRE NHX_TOKEN_SEMICOLON
;
nhx_expresionDeclaracion:
		NHX_TOKEN_KEYWORD_ENTERO NHX_TOKEN_VARIABLE NHX_TOKEN_SEMICOLON {if(NativeHex_InsertarEntero($2, 0) < 0) fprintf(stderr, "\t[Error: variable existente]\n");}
	|	NHX_TOKEN_KEYWORD_DECIMAL NHX_TOKEN_VARIABLE NHX_TOKEN_SEMICOLON {if(NativeHex_InsertarDecimal($2, 0.0) < 0) fprintf(stderr, "\t[Error: variable existente]\n");}
	|	NHX_TOKEN_KEYWORD_CADENA NHX_TOKEN_VARIABLE NHX_TOKEN_SEMICOLON {if(NativeHex_InsertarCadena($2, "") < 0) fprintf(stderr, "\t[Error: variable existente]\n");}
	|	NHX_TOKEN_KEYWORD_ENTERO nhx_expresionEntera NHX_TOKEN_ASIGNACION NHX_TOKEN_VARIABLE NHX_TOKEN_SEMICOLON {if(NativeHex_InsertarEntero($4, $2) < 0) fprintf(stderr, "\t[Error: variable existente]\n");}
	|	NHX_TOKEN_KEYWORD_DECIMAL nhx_expresionDecimal NHX_TOKEN_ASIGNACION NHX_TOKEN_VARIABLE NHX_TOKEN_SEMICOLON {if(NativeHex_InsertarDecimal($4, $2) < 0) fprintf(stderr, "\t[Error: variable existente]\n");}
	|	NHX_TOKEN_KEYWORD_CADENA nhx_expresionString NHX_TOKEN_ASIGNACION NHX_TOKEN_VARIABLE NHX_TOKEN_SEMICOLON {if(NativeHex_InsertarCadena($4, $2) < 0) fprintf(stderr, "\t[Error: variable existente]\n");}
;
nhx_expresionAsignacion:
		nhx_expresionEntera NHX_TOKEN_ASIGNACION NHX_TOKEN_VARIABLE {if(NativeHex_ActualizarEntero($3, $1) < 0) fprintf(stderr, "\t[Error: variable no existente]\n");}
	|	nhx_expresionDecimal NHX_TOKEN_ASIGNACION NHX_TOKEN_VARIABLE {if(NativeHex_ActualizarDecimal($3, $1) < 0) fprintf(stderr, "\t[Error: variable no existente]\n");}
	|	nhx_expresionString NHX_TOKEN_ASIGNACION NHX_TOKEN_VARIABLE {if(NativeHex_ActualizarCadena($3, $1) < 0) fprintf(stderr, "\t[Error: variable no existente]\n");}
;
nhx_expresionVarEnt:
		NHX_TOKEN_VARIABLE {int iii = NativeHex_BuscarElemento($1); if(iii > -1) $$ = tablaSimbolos[iii].valor.entero; else fprintf(stderr, "\t\t[Error: variable no encontrada]\n");}
;
nhx_expresionVarDec:
		NHX_TOKEN_DECIMAL NHX_TOKEN_VARIABLE {int iii = NativeHex_BuscarElemento($2); if(iii > -1) $$ = tablaSimbolos[iii].valor.decimal; else fprintf(stderr, "\t\t[Error: variable no encontrada]\n");}
;
nhx_expresionVarStr:
		NHX_TOKEN_CAD NHX_TOKEN_VARIABLE {int iii = NativeHex_BuscarElemento($2); if(iii > -1) $$ = tablaSimbolos[iii].valor.cadena; else fprintf(stderr, "\t\t[Error: variable no encontrada]\n");}
%%

/* Sección de código adicional */

// Definimos nuestra propia implementación del control de errores
void yyerror(const char *mensaje)
{
	fprintf(stderr, "\t[Error]: %s\n", mensaje);
}
// Nuestra función main()
int main(int argc, char **argv)
{
	yyin = stdin;

	do
	{
		yyparse();
		fflush(yyin);
	}
	while(!feof(yyin));

	return 0;
}