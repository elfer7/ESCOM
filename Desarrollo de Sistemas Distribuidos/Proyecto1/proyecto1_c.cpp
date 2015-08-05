/*
	IPN - ESCOM
	Desarrollo de Sistemas Distribuidos
	4CM1

	=> Ortega Ortuño Eder

	multiaportes.com/sistemasdistribuidos
*/

#include <iostream>
#include <cstdio> // Para espacio de nombres std::sprintf

std::string calcularHMS(int tt)
{
	int horas = 0, minutos = 0, segundos = 0, tiempo_restante = tt;
	char temporal[80];
	std::string salida;

	while(1)
	{
		if(horas * 3600 >= tiempo_restante)
		{
			horas--;
			tiempo_restante -= horas * 3600;
			break;
		}
		else
			horas++;
	}
	while(1)
	{
		if(minutos * 60 >= tiempo_restante)
		{
			minutos--;
			tiempo_restante -= minutos * 60;
			break;
		}
		else
			minutos++;
	}

	// Reduciendo riesgos de buffer overflow con snprintf()
	std::snprintf(temporal, sizeof temporal, "%d horas, %d minutos, %d segundos", horas, minutos, tiempo_restante);
	salida = temporal;

	return salida;
}
int main()
{
	int tt;

	std::cout << "Tiempo (segundos): ";
	std::cin >> tt;

	std::cout << calcularHMS(tt) << std::endl;

	return 0;
}
