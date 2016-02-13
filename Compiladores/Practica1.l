DMX_VARIABLES ([a-zA-Z]|\_)+([a-zA-Z]|[0-9]|\_)*
DMX_ENTEROS (\+|\-){0,1}[0-9]+
DMX_DECIMALES {DMX_ENTEROS}*\.{1}[0-9]+
DMX_POTENCIAS ({DMX_ENTEROS}|{DMX_DECIMALES}|{DMX_VARIABLES})\^({DMX_ENTEROS}|{DMX_DECIMALES}|{DMX_VARIABLES})
DMX_OPERADORES_MATEMATICOS_BASICOS ({DMX_VARIABLES}|{DMX_ENTEROS}|{DMX_DECIMALES})(\+|\-|\*|\/)({DMX_VARIABLES}|{DMX_ENTEROS}|{DMX_DECIMALES})
DMX_OPERADORES_MATEMATICOS_MODULO (mod|MOD)\(({DMX_ENTEROS}|{DMX_DECIMALES}|{DMX_VARIABLES})\,({DMX_ENTEROS}|{DMX_DECIMALES}|{DMX_VARIABLES})\)
DMX_OPERADORES_MATEMATICOS_RESULTADO {DMX_VARIABLES}\=({DMX_ENTEROS}|{DMX_DECIMALES}|{DMX_POTENCIAS}|{DMX_OPERADORES_MATEMATICOS_BASICOS}|{DMX_OPERADORES_MATEMATICOS_MODULO}|{DMX_VARIABLES})
%%
{DMX_VARIABLES} printf("Encontrada variable.\n");
{DMX_ENTEROS} printf("Encontrado numero entero.\n");
{DMX_DECIMALES} printf("Encontrado numero decimal.\n");
{DMX_POTENCIAS} printf("Encontrada potencia.\n");
{DMX_OPERADORES_MATEMATICOS_BASICOS} printf("Encontrada operacion matematica.\n");
{DMX_OPERADORES_MATEMATICOS_MODULO} printf("Encontrada operacion modulo.\n");
{DMX_OPERADORES_MATEMATICOS_RESULTADO} printf("Encontrada operacion asignacion.\n");
%%
int main()
{
	/*
	IPN - ESCOM
	Ortega Ortuño Eder - 3CV5
	Compiladores - multiaportes.com/compiladores

	Eliminar este comentario si da errores:
		Variables:
			- Empiezan por una o más letras (min/may) o un guión bajo y pueden tener números, letras o guiones medios/bajos consecuentes
		Enteros
			- Pueden o no tener signo (+, -)
		Decimales
			- Pueden tener o no un número entero al inicio, solamente tienen un punto y al menos un número después del punto
		Potencias
			- Pueden ser números enteros o decimales (reales)
		Operaciones matemáticas
			- Los operadores matemáticos básicos se componen de números reales y se consideran solamente a operadores binarios
			- Una función módulo acepta dos argumentos separados por una coma dentro de paréntesis, los cuales son números reales
			- Una asignación de resultado siempre comienza por una variable seguida del operador y finalmente algún real, otro operador matemático o una potencia
	*/
	yylex();
	return 0;
}