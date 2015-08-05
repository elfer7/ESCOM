#include <cmath>
#include "Circulo.hpp"

Circulo::Circulo(double r): radio(r)
{

}
double Circulo::calcularVal()
{
	return M_PI * radio * radio;
}