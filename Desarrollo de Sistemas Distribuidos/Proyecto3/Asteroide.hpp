/*
	IPN - ESCOM
	Desarrollo de Sistemas Distribuidos
	4CM1

	=> Ortega Ortuño Eder

	multiaportes.com/sistemasdistribuidos
*/

#include <vector>
#include <SDL2/SDL.h>
#include "MultiAportesConstantes.hpp"
#include "Vector2D.hpp"

class Asteroide
{
	public:
		Asteroide(std::vector<int>, int, int, int, int, int, bool);
		~Asteroide();
		void actualizar();
		int getX();
		int getY();
		int getR();
		int getG();
		int getB();
		int getCantidadLineas();
		SDL_Point *getPuntosSDL();
	private:
		int x, y, r, g, b, desplazamientoX, desplazamientoY, angulo, rotacion;
		bool giroContrarreloj;
		void establecerCoordenadas();
		void establecerDesplazamiento(int);
		void establecerRotacion(int);
		std::vector<int> magnitudes;
		std::vector<Vector2D> vertices;
		SDL_Point puntosSDL[ASTEROIDE_VERTICES_MAXIMO];
};