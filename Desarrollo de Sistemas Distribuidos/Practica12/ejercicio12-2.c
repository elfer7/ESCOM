/*
	IPN - ESCOM
	Desarrollo de Sistemas Distribuidos
	4CM1

	Equipo 5
	=> Hernández Jiménez Enrique
	=> Ortega Ortuño Eder
	=> Fernandez Eduardo

	multiaportes.com/sistemasdistribuidos
*/

#include <stdio.h>
#include <pthread.h>

struct valores
{
	short int a;
	float b;
};
typedef struct valores Args;

void funcionConcurrente(void *argumentos)
{
	Args *tmp = (Args *) argumentos;
	printf("%d, %.3f\n", tmp->a, tmp->b);
	pthread_exit(0);
}
int main(int argc, char **argv)
{
	pthread_t hilo;
	Args argumentos;

	argumentos.a = 666;
	argumentos.b = 666.666;

	pthread_create(&hilo, NULL, (void *) funcionConcurrente, (void *) &argumentos);
	pthread_join(hilo, NULL);

	return 0;
}
