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
#include <cmath>
#include <algorithm>
#include "PoligonoIrregular.hpp"

bool CoordenadaComparador(Coordenada uno, Coordenada dos)
{
	return uno.getX() < dos.getX();
}

int PoligonoIrregular::contadorVertices = 0;
PoligonoIrregular::PoligonoIrregular()
{

}
void PoligonoIrregular::agregarVertice(Coordenada c, bool benchmarking)
{
	this->distancias.push_back(sqrt(pow(c.getX(), 2) + pow(c.getY(), 2)));
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
	std::vector<Coordenada>::reverse_iterator iterador;
	std::vector<double>::reverse_iterator iterador2;

	for(iterador = this->coords.rbegin(), iterador2 = this->distancias.rbegin(); iterador != this->coords.rend(), iterador2 != this->distancias.rend(); iterador++, iterador2++)
	{
		std::cout << "X = " << iterador->getX() << "\tY = " << iterador->getY() << std::endl;
		std::cout << "Magnitud: " << *iterador2 << std::endl;
	}
}
void PoligonoIrregular::ordenarVertices()
{
	std::vector<Coordenada>::reverse_iterator iterador;
	std::sort(this->coords.begin(), this->coords.end(), CoordenadaComparador);
	std::cout << "Coordenadas sort()" << std::endl;
	for(iterador = this->coords.rbegin(); iterador != this->coords.rend(); iterador++)
	{
		std::cout << "X = " << iterador->getX() << "\tY = " << iterador->getY() << std::endl;
	}
}
int PoligonoIrregular::getContador()
{
	return contadorVertices;
}