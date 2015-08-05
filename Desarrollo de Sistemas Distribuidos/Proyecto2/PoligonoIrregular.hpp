#include <vector>
#include "Coordenada.hpp"

class PoligonoIrregular
{
	protected:
		std::vector <Coordenada> coords;
	public:
		PoligonoIrregular();
		void agregarVertice(Coordenada);
		void modificarVertice(int, Coordenada);
		Coordenada getVertice(int);
		void imprimirVertices();
		int getCantidadVertices();
};
