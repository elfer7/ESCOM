/*
	IPN - ESCOM
	Desarrollo de Sistemas Distribuidos
	4CM1

	=> Ortega Ortuño Eder

	multiaportes.com/sistemasdistribuidos
*/

#include <iostream>
#include <string>
#include <cmath>
#include "ezOptionParser.hpp"
#include "NumeroPrimo.hpp"
using namespace std;

void initAlgoritmo(vector<NumeroPrimo> *ce, const int *n)
{
	int i;
	for(i = 2; i < *n; i++)
		ce->push_back(NumeroPrimo(i));
}
void calcular(vector<NumeroPrimo> *ce, const int *n)
{
	int primo;
	vector<NumeroPrimo>::iterator it, it2;

	it2 = ce->begin();
	do
	{
		for(it = it2; it != ce->end(); it++)
		{
			if(it->getEstado())
			{
				primo = it->getNumero();
				it2 = it + 1;
				break;
			}
		}
		for(it = it2; it != ce->end(); it++)
			if(it->getNumero() % primo == 0)
				it->setEstado(false);
	}
	while(pow(primo, 2) < *n);

	for(it = ce->begin(); it != ce->end(); it++)
		if(it->getEstado())
			cout << it->getNumero() << endl;
}

int main(int argc, const char **argv)
{
	int num, den;
	string uso;
	vector<string> errores;
	ez::ezOptionParser argumentos;

	argumentos.overview = "Proyecto 1: Números primos";
	argumentos.syntax = "./a.out -n <numero>";
	argumentos.example = "./a.out -n 20\nEl algoritmo calcula todos los números primos menores a 20.\n\n";
	argumentos.footer = "Por Ortega Ortuño Eder - 4CM1";

	argumentos.add("666", 1, 1, 0, "Valor del número", "-n", "--numero");

	argumentos.parse(argc, argv);

	if(!argumentos.gotRequired(errores))
	{
		argumentos.getUsage(uso);
		cerr << uso << endl;
	}
	else
	{
		int num, i;
		vector<NumeroPrimo> numeros;

		argumentos.get("-n")->getInt(num);

		initAlgoritmo(&numeros, &num);
		calcular(&numeros, &num);
	}

	return 0;
}
