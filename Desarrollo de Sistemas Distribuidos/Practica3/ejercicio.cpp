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
#include <string.h> // Para strncmp()
#include <cstdlib>
#include <ctime>
#include "Fecha.hpp"
using namespace std;

Fecha::Fecha(int dd, int mm, int aaaa): dia(dd), mes(mm), anio(aaaa)
{
	xdd = 6666666666666;
	ydd = 7777777777777;
	zdd = 8888888888888;
	if(this->dia < 1 || this->dia > 31)
	{
		cerr << "No es un día válido" << endl;
		exit(-1); // Esta función solo es soportada en C++ 11 (g++ -std=c++11 $@)
	}
	if(this->mes < 1 || this->mes > 12)
	{
		cerr << "No es un mes válido" << endl;
		exit(-1);
	}
	if(this->anio < 1)
	{
		cerr << "No es un año válido" << endl;
		exit(-1);
	}
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
int Fecha::getDia()
{
	return this->dia;
}
int Fecha::getMes()
{
	return this->mes;
}

int Fecha::getAnio()
{
	return this->anio;
}

int Fecha::convierte()
{
	return this->anio * 10000 + this->mes * 100 + this->dia;
}

// Funciones ajenas a las clases
int masVieja(Fecha f1, Fecha f2)
{
	if(f1.getAnio() > f2.getAnio() && f1.getMes() > f2.getMes() && f1.getDia() > f2.getDia())
		return 1;
	else if(f1.getAnio() == f2.getAnio() && f1.getMes() == f2.getMes() && f1.getDia() == f2.getDia())
		return 0;
	else if(f1.getAnio() < f2.getAnio() && f1.getMes() < f2.getMes() && f1.getDia() < f2.getDia())
		return -1;
	//return (f1.getDia() == f2.getDia() && f1.getMes() == f2.getMes() && f1.getAnio() == f2.getAnio())? 1 : -1;
}
int masVieja(Fecha *f1, Fecha *f2)
{
	if(f1->getAnio() > f2->getAnio() && f1->getMes() > f2->getMes() && f1->getDia() > f2->getDia())
		return 1;
	else if(f1->getAnio() == f2->getAnio() && f1->getMes() == f2->getMes() && f1->getDia() == f2->getDia())
		return 0;
	else if(f1->getAnio() < f2->getAnio() && f1->getMes() < f2->getMes() && f1->getDia() < f2->getDia())
		return -1;
	//return (f1->getDia() == f2->getDia() && f1->getMes() == f2->getMes() && f1->getAnio() == f2->getAnio())? 1 : -1;
}
void bucle(int n, bool referencia)
{
	Fecha a, b;
	int contador;

	std::srand(std::time(0));

	for(contador = 1; contador <= n; contador++)
	{
		//Fecha a(rand() % 32, rand() % 13, rand() % 2015), b(rand() % 32, rand() % 13, rand() % 2015); <- AQUI SI SE HACEN LAS VALIDACIONES DE DIAS, MESES Y AÑOS
		a.inicializaFecha(rand() % 32, rand() % 13, rand() % 2015);
		b.inicializaFecha(rand() % 32, rand() % 13, rand() % 2015);
		//a.muestraFecha();
		//b.muestraFecha();

		if(!referencia)
			masVieja(a, b);
			//cout << masVieja(a, b) << endl;
		else
			masVieja(&a, &b);
			//cout << masVieja(&a, &b) << endl;
	}
}

int main(int argc, char **argv)
{
	int aaa;

	cout << "Iteraciones: ";
	cin >> aaa;

	if(strncmp(argv[1], "--valor", sizeof argv[1]) == 0)
		bucle(aaa, false);
	else if(strncmp(argv[1], "--referencia", sizeof argv[1]) == 0)
		bucle(aaa, true);
	else
		cerr << "No hay argumentos" << endl;

	return 0;
}
