#include "Circulo.cpp"

class Cilindro: public Circulo
{
	private:
		double longitud;
	public:
		Cilindro(double r = 1.0, double l = 1.0): Circulo(r), longitud(l)
		{

		}
		double calcularVal();
};