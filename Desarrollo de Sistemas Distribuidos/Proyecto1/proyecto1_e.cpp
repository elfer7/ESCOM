/*
	IPN - ESCOM
	Desarrollo de Sistemas Distribuidos
	4CM1

	=> Ortega Ortuño Eder

	multiaportes.com/sistemasdistribuidos
*/

#include <iostream>
#include <string>
#include <boost/math/common_factor.hpp>
#include "ezOptionParser.hpp"
#include "Fraccion.hpp"
using namespace std;

Fraccion::Fraccion(int numerador, int denominador)
{
	if(denominador == 0)
	{
		cerr << "No es posible establecer un denominador con valor cero" << endl;
		exit(-1);
	}
	this->numerador = numerador;
	this->denominador = denominador;
}
void Fraccion::setValores(int numerador, int denominador)
{
	this->numerador = numerador;
	this->denominador = denominador;
}
double Fraccion::getDivision()
{
	return static_cast<double>(this->numerador) / static_cast<double>(this->denominador);
}
void Fraccion::simplificar()
{
	int mcd = boost::math::gcd(this->numerador, this->denominador); // Máximo común divisor de ambos miembros para obtener la expresión simplificada
	cout << "Fracción simplificada: " << this->numerador / mcd << "/" << this->denominador / mcd << endl;
}

int main(int argc, const char **argv)
{
	int num, den;
	string uso;
	vector<string> errores;
	ez::ezOptionParser argumentos;

	argumentos.overview = "Proyecto 1: Fracciones";
	argumentos.syntax = "./a.out -n <numerador> -d <denominador>";
	argumentos.example = "./a.out -n 20 -d 80\nSe almacena la fracción 20/80 y se retorna simplificada junto a la división de ambos números.\n\n";
	argumentos.footer = "Por Ortega Ortuño Eder - 4CM1";

	argumentos.add("666", 1, 1, 0, "Valor del numerador", "-n", "--numerador");
	argumentos.add("666", 1, 1, 0, "Valor del denominador", "-d", "--denominador");

	argumentos.parse(argc, argv);

	if(!argumentos.gotRequired(errores))
	{
		argumentos.getUsage(uso);
		cerr << uso << endl;
	}
	else
	{
		Fraccion f;

		argumentos.get("-n")->getInt(num);
		argumentos.get("-d")->getInt(den);

		cout.setf(ios::fixed);
		cout.setf(ios::showpoint);
		cout.precision(4);

		f.setValores(num, den);
		cout << "División: " << f.getDivision() << endl;
		f.simplificar();
	}

	return 0;
}
