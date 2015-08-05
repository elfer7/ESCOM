#include "Cilindro.hpp"

double Cilindro::calcularVal()
{
	return longitud * Circulo::radio * Circulo::radio * M_PI; // Ejercicio 2
	//return longitud * Circulo::calcularVal();
}