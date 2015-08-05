#include <vector>
#include "Coordenada.hpp"

class PoligonoIrregular
{
	private:
		static int contadorVertices;
		std::vector <double> distancias;
		std::vector <Coordenada> coords;
	public:
		PoligonoIrregular();
		void agregarVertice(Coordenada, bool);
		void imprimirVertices();
		void ordenarVertices();
		static int getContador();
};