#include "PoligonoIrregular.hpp"

class PoligonoRegular: public PoligonoIrregular
{
	private:
		double area;
	public:
		PoligonoRegular(); // Constructor vacío: necesario para crear arrays PoligonoRegular[]
		void inicializar(double, double, Coordenada);
		double getArea();
};