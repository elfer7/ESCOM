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

#include <cmath>
#include "Coordenada.hpp"
	
Coordenada::Coordenada(double valX, double valY): x(valX), y(valY)
{

}
Coordenada::Coordenada(double r, double tetha, bool coordenadasPolares)
{
	// Convirtiendo de polares a cartesianas
	this->x = r * cos(tetha);
	this->y = r * sin(tetha);
}
double Coordenada::getX()
{
	return this->x;
}
double Coordenada::getY()
{
	return this->y;
}