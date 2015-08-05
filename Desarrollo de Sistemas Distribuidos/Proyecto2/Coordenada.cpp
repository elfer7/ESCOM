/*
	IPN - ESCOM
	Desarrollo de Sistemas Distribuidos
	4CM1

	=> Ortega Ortuño Eder

	multiaportes.com/sistemasdistribuidos
*/

#include <cmath>
#include "Coordenada.hpp"
	
Coordenada::Coordenada(int valX, int valY): x(valX), y(valY)
{

}
int Coordenada::getX()
{
	return this->x;
}
int Coordenada::getY()
{
	return this->y;
}