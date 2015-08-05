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
using namespace std;

void crearRectangulo(Coordenada a, Coordenada b)
{
	Rectangulo rectangulo1(a, b);

	cout << "Calcular área rectángulo dadas sus coordenadas en el plano cartesiano: ";
	rectangulo1.imprimirEsquina();
	cout << endl;

	cout << "Área del rectángulo: " << rectangulo1.getArea() << endl;
}
int main(int argc, char **argv)
{
	crearRectangulo(Coordenada(2, 3), Coordenada(5, 1));
	/*
		Convirtiendo a coordenadas polares para que salga el mismo valor del anterior:
			r = raiz (x^2 + y^2)
			tetha = arctan(y / x)
			** No es necesario convertir de rads a grados **
			r1 = 3.6055, tetha1 = 0.9827 rads
			r2 = 5.0990, tetha2 = 0.1973 rads
	*/
	crearRectangulo(Coordenada(3.6055, 0.9827, true), Coordenada(5.0990, 0.1973, true)); // Calcular los valores para que salga el mismo valor que el anterior pero utilizando coordenadas polares

	return 0;
}
