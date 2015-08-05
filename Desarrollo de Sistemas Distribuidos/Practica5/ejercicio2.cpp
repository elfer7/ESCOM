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
#include "PoligonoIrregular.hpp"

int main(int argc, char **argv)
{
	PoligonoIrregular p;

	p.agregarVertice(Coordenada(0, 7), false);
	p.agregarVertice(Coordenada(7, 14), false);
	p.agregarVertice(Coordenada(20, 29), false);
	p.agregarVertice(Coordenada(27, 59), false);

	p.imprimirVertices();

	return 0;
}
