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
#include <ctime>
#include "PoligonoIrregular.hpp"
using namespace std;

int main(int argc, char **argv)
{
	int i, n = atoi(argv[1]);
	double aleatorio1, aleatorio2, mantisa1, mantisa2;
	PoligonoIrregular p;

	srand(time(NULL));

	for(i = 0; i < n; i++)
	{
		aleatorio1 = static_cast<double>(1 + rand() % 99);
		aleatorio2 = static_cast<double>(1 + rand() % 99);
		mantisa1 = static_cast<double>(1 + rand() % 998);
		mantisa2 = static_cast<double>(1 + rand() % 998);
		aleatorio1 += (mantisa1 * 0.001);
		aleatorio2 += (mantisa2 * 0.001);
		aleatorio1 *= (static_cast<int>(mantisa1) % 2 == 0)? 1 : -1;
		aleatorio2 *= (static_cast<int>(mantisa2) % 2 == 0)? 1 : -1;
		
		p.agregarVertice(Coordenada(aleatorio1, aleatorio2), false);
	}

	p.imprimirVertices();
	p.ordenarVertices();

	return 0;
}
