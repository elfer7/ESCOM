/*
	IPN - ESCOM
	Desarrollo de Sistemas Distribuidos
	4CM1

	Equipo 5
	=> Enrique Hernández Jiménez
	=> Ortega Ortuño Eder

	multiaportes.com/sistemasdistribuidos
*/

#include <iostream>
#include "Fecha.hpp"
using namespace std;

Fecha::Fecha(int dd, int mm, int aaaa) // Constructor
{
	mes = mm;
	dia = dd;
	anio = aaaa;
}
void Fecha::inicializaFecha(int dd, int mm, int aaaa)
{
	anio = aaaa;
	mes = mm;
	dia = dd;
	return;
}
void Fecha::muestraFecha()
{
	cout << "La fecha es " << dia << "/" << mes << "/" << anio << endl;
	return;
}
int Fecha::convierte()
{
	return this->anio * 10000 + this->mes * 100 + this->dia;
}
bool Fecha::leapyr()
{
	if(this->anio % 4 == 0)
	{
		if(this->anio % 100 != 0 || this->anio % 400 == 0)
			return true;
		else
			return false;
	}
	return false;
}

int main()
{
	int var;
	Fecha tmp;

	for(var = 1; var <= 2015; var++)
	{
		tmp.inicializaFecha(27, 3, var);
		if(tmp.leapyr())
			cout << var << " es bisiesto" << endl;
	}

	return 0;
}
