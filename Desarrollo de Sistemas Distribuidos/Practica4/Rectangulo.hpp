#include "Coordenada.hpp"

class Rectangulo
{
	private:
		Coordenada superiorIzq, inferiorDer;
	public:
		Rectangulo();
		Rectangulo(double, double, double, double);
		Rectangulo(Coordenada, Coordenada);
		void imprimirEsquina();
		Coordenada getSupIzq();
		Coordenada getInfDer();
		double getArea();
};