/*
	IPN - ESCOM
	Desarrollo de Sistemas Distribuidos
	4CM1

	=> Ortega Ortuño Eder

	multiaportes.com/sistemasdistribuidos
*/

#include <cstdlib>
#define MINIMO_LADOS_POLIGONO_REGULAR 3
#define MAXIMO_LADOS_POLIGONO_REGULAR 15
#define MINIMO_RADIO 10
#define MAXIMO_RADIO 180
#define MAXIMO_POLIGONOS 5
#define VELOCIDAD_MINIMA 1
#define VELOCIDAD_MAXIMA 10
#define VENTANA_TAM_X 800
#define VENTANA_TAM_Y 600
#define RESOLUCION_MAX_X 1366
#define RESOLUCION_MAX_Y 768
#define FPS 30
#define TIEMPO_RETARDO 1000.0f / FPS

// Fuente: https://multiaportes.com/numeros-aleatorios-en-c/
int generarSemilla()
{
	__asm__ __volatile__("rdtsc");
}
int getAleatorio(int minimo, int maximo, bool signado)
{
	int signo = 1;
	if(signado)
		signo = (rand() % 2 == 0)? 1 : -1;
	return (rand() % (maximo - minimo + 1) + minimo) * signo;
}
int getVelocidad(double area)
{
	double a = 2000.0;
	if(area < a)
		return VELOCIDAD_MAXIMA;
	else if(area < a*2)
		return VELOCIDAD_MAXIMA - 1;
	else if(area < a*3)
		return VELOCIDAD_MAXIMA - 2;
	else if(area < a*4)
		return VELOCIDAD_MAXIMA - 3;
	else if(area < a*5)
		return VELOCIDAD_MAXIMA - 4;
	else if(area < a*6)
		return VELOCIDAD_MAXIMA - 5;
	else if(area < a*7)
		return VELOCIDAD_MAXIMA - 6;
	else if(area < a*8)
		return VELOCIDAD_MAXIMA - 7;
	else if(area < a*9)
		return VELOCIDAD_MAXIMA - 8;
	else
		return VELOCIDAD_MINIMA;
}