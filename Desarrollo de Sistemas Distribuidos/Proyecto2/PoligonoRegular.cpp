/*
	IPN - ESCOM
	Desarrollo de Sistemas Distribuidos
	4CM1
	
	=> Ortega Ortuño Eder

	multiaportes.com/sistemasdistribuidos
*/

#include <cmath>
#include "PoligonoRegular.hpp"

PoligonoRegular::PoligonoRegular()
{

}
void PoligonoRegular::inicializar(double lados, double radio, Coordenada centroCirculo)
{
	int a;
	double x, y, angulo = 0, incremento = 360 / lados;

	this->coords.clear();
	this->coords.reserve(static_cast<int>(lados));

	for(a = 1; a <= lados; a++)
	{
		x = centroCirculo.getX() + radio * cos(2 * M_PI * a / lados);
		y = centroCirculo.getY() + radio * sin(2 * M_PI * a / lados);
		PoligonoIrregular::agregarVertice(Coordenada(x, y));
	}

	this->area = lados * radio * radio * sin(2 * M_PI / lados) / 2;
}
double PoligonoRegular::getArea()
{
	return this->area;
}