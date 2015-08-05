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
#include <vector>
#include <cstdlib>
#include "PoligonoIrregular.hpp"
using namespace std;

int main(int argc, char **argv)
{
	int i, j, aleatorio, m = atoi(argv[1]), n = atoi(argv[2]); // N objetos con un máximo de M vértices cada uno
	bool benchmark = (argv[3][0] == 't')? true : false;
	vector <PoligonoIrregular> poligonos(n);

	for(i = 0; i < poligonos.size(); i++)
	{
		aleatorio = 1 + rand() % (m - 1); // Entre uno y M vértices
		for(j = 1; j <= aleatorio; j++)
			poligonos[i].agregarVertice(Coordenada(1, 2), benchmark);
	}

	cout << "Vértices: " << poligonos[0].getContador() << endl;

	return 0;
}
