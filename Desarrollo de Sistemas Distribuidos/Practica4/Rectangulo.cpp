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
#include "Rectangulo.hpp"

Rectangulo::Rectangulo(double xSI, double ySI, double xID, double yID): superiorIzq(0, 0), inferiorDer(0, 0)
{

}
Rectangulo::Rectangulo(): superiorIzq(0, 0), inferiorDer(0, 0)
{

}
// Agregado en el ejercicio 2
Rectangulo::Rectangulo(Coordenada superiorIzq, Coordenada inferiorDer)
{
	this->superiorIzq = superiorIzq;
	this->inferiorDer = inferiorDer;
}
void Rectangulo::imprimirEsquina()
{
	std::cout << "Esquina superior izquierda:\n\tx = " << superiorIzq.getX() << "\ty = " << superiorIzq.getY() << std::endl;
	std::cout << "Esquina inferior derecha:\n\tx = " << inferiorDer.getX() << "\ty = " << inferiorDer.getY() << std::endl;
}
Coordenada Rectangulo::getSupIzq()
{
	return superiorIzq;
}
Coordenada Rectangulo::getInfDer()
{
	return inferiorDer;
}
// Agregado en el ejercicio 3
double Rectangulo::getArea()
{
	double ancho = inferiorDer.getX() - superiorIzq.getX(), alto = superiorIzq.getY() - inferiorDer.getY();
	return ancho * alto;
}