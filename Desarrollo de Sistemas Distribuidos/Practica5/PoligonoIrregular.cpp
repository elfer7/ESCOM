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

int PoligonoIrregular::contadorVertices = 0;
PoligonoIrregular::PoligonoIrregular()
{

}
void PoligonoIrregular::agregarVertice(Coordenada c, bool benchmarking)
{
	if(benchmarking)
	{
		this->coords.reserve(this->coords.size() + 10);
		this->coords.push_back(c); // Aumenta su capacidad en uno si no hay más espacio disponible
	}
	else
	{
		this->coords.push_back(c);
	}
	contadorVertices++;
}
void PoligonoIrregular::imprimirVertices()
{
	int i;
	for(i = 0; i < this->coords.size(); i++)
		std::cout << "X = " << this->coords[i].getX() << "\tY = " << this->coords[i].getY() << std::endl;
}
int PoligonoIrregular::getContador()
{
	return contadorVertices;
}