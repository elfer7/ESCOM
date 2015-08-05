/*
	IPN - ESCOM
	Desarrollo de Sistemas Distribuidos
	4CM1

	=> Ortega Ortuño Eder

	multiaportes.com/sistemasdistribuidos
*/

#include <iostream>
#include <string>
#include "ezOptionParser.hpp"
#include "Temperatura.hpp"
using namespace std;

Temperatura::Temperatura(float gradosK)
{
	this->gradosK = gradosK;
}
void Temperatura::setTempKelvin(float gradosK)
{
	this->gradosK = gradosK;
}
void Temperatura::setTempFahrenheit(float gradosF)
{
	this->gradosK = ((gradosF - 32) * 5 / 9) + 273.15;
}
void Temperatura::setTempCelsius(float gradosC)
{
	this->gradosK = gradosC + 273.15;
}
void Temperatura::imprimirKelvin()
{
	cout << "Grados K: " << this->gradosK << endl;
}
void Temperatura::imprimirFahrenheit()
{
	float temp = ((this->gradosK - 273.15) * 9 / 5) + 32;
	cout << "Grados F°: " << temp << endl;
}
void Temperatura::imprimirCelsius()
{
	cout << "Grados C°: " << (this->gradosK - 273.15) << endl;
}

int main(int argc, const char **argv)
{
	float temp;
	string uso, temperatura, escala;
	vector<string> errores;
	ez::ezOptionParser argumentos;

	argumentos.overview = "Proyecto 1: Temperatura";
	argumentos.syntax = "./a.out -t <valor> -e < k | c | f > [-c | --celsius] [-f | --fahrenheit] [-k | --kelvin]";
	argumentos.example = "./a.out -t 50 -e k -f -k\nGuarda 50 Kelvin e imprime su valor en grados Fahrenheit y Celsius\n\n";
	argumentos.footer = "Por Ortega Ortuño Eder - 4CM1";

	argumentos.add("666", 1, 1, 0, "Valor de la temperatura deseada", "-t", "--temperatura"); // Valor default, ¿argumento obligatorio?, subargumentos esperados, caracter delimitador por si se esperan más de un subargumento, instrucciones, nombres argumentos...
	argumentos.add("k", 1, 1, 0, "Escala de la temperatura [ k | c | f ]", "-e", "--escala");
	argumentos.add("", 0, 0, 0, "Imprimir la temperatura en Celsius", "-c", "--celsius");
	argumentos.add("", 0, 0, 0, "Imprimir la temperatura en Fahrenheit", "-f", "--fahrenheit");
	argumentos.add("", 0, 0, 0, "Imprimir la temperatura en Kelvin", "-k", "--kelvin");

	argumentos.parse(argc, argv);

	if(!argumentos.gotRequired(errores))
	{
		argumentos.getUsage(uso);
		cerr << uso << endl;
	}
	else
	{
		Temperatura t;

		argumentos.get("-t")->getString(temperatura);
		argumentos.get("-e")->getString(escala);

		temp = stof(temperatura);

		if(escala.compare("k") == 0)
			t.setTempKelvin(temp);
		else if(escala.compare("c") == 0)
			t.setTempCelsius(temp);
		else if(escala.compare("f") == 0)
			t.setTempFahrenheit(temp);

		if(argumentos.isSet("-k"))
			t.imprimirKelvin();
		if(argumentos.isSet("-c"))
			t.imprimirCelsius();
		if(argumentos.isSet("-f"))
			t.imprimirFahrenheit();
	}

	return 0;
}
