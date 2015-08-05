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

#include <iostream>
#include <cstdlib>
#include <cmath>
using namespace std;

int main(int argc, char **argv)
{
	double i = 0, seno, coseno, tangente, logaritmo, raiz, max = atof(argv[1]);

	while(i < max)
	{
		seno += sin(i);
		coseno += cos(i);
		tangente += tan(i);
		logaritmo += log10(i);
		raiz += sqrt(i);
		i++;
	}

	return 0;
}
