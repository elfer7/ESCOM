/*
	IPN - ESCOM
	Desarrollo de Sistemas Distribuidos
	4CM1

	=> Ortega Ortuño Eder

	multiaportes.com/sistemasdistribuidos
*/

#include <cstdlib>
#include "MultiAportesConstantes.hpp"

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

/*
	TODO
		=> Utilizar Valgrind para manejar la memoria y depurar errores
*/