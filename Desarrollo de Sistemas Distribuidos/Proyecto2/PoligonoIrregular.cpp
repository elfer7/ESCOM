/*
	IPN - ESCOM
	Desarrollo de Sistemas Distribuidos
	4CM1

	=> Ortega Ortuño Eder

	multiaportes.com/sistemasdistribuidos
*/

#include <iostream>
#include <cmath>
#include "PoligonoIrregular.hpp"

PoligonoIrregular::PoligonoIrregular()
{

}
void PoligonoIrregular::agregarVertice(Coordenada c)
{
	this->coords.push_back(c);
}
void PoligonoIrregular::modificarVertice(int p, Coordenada c)
{
	coords[p] = c;
}
void PoligonoIrregular::imprimirVertices()
{
	std::vector<Coordenada>::reverse_iterator iterador;

	for(iterador = this->coords.rbegin(); iterador != this->coords.rend(); iterador++)
		std::cout << "X = " << iterador->getX() << "\tY = " << iterador->getY() << std::endl;
}
Coordenada PoligonoIrregular::getVertice(int i)
{
	return this->coords.at(i);
}
int PoligonoIrregular::getCantidadVertices()
{
	return this->coords.size();
}