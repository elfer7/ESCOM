/*
	IPN - ESCOM
	Desarrollo de Sistemas Distribuidos
	4CM1

	=> Ortega Ortuño Eder

	multiaportes.com/sistemasdistribuidos
*/

#include <iostream>
#include <cstdlib>
#include <cmath>
#include "MultiAportesUtils.hpp"
#include "ModoGraficoSDL.cpp"
#include "PoligonoRegular.hpp"
using namespace std;

int main(int argc, char **argv)
{
	int c, i, n, velocidad, sentido_x, sentido_y;
	Uint32 frameInicio, frameTiempo;
	PoligonoRegular p;

	srand(generarSemilla());

	p.inicializar(getAleatorio(MINIMO_LADOS_POLIGONO_REGULAR, MAXIMO_LADOS_POLIGONO_REGULAR, false), getAleatorio(MINIMO_RADIO, MAXIMO_RADIO, false), Coordenada(getAleatorio(0, 800, false), getAleatorio(0, 800, false)));
	//PoligonoRegular pr[MAXIMO_POLIGONOS];
	ModoGraficoSDL *juego;

	juego = new ModoGraficoSDL();
	juego->iniciar("Proyecto 2: Sistemas Distribuidos | Ortega Ortuño Eder - 4CM1", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, VENTANA_TAM_X, VENTANA_TAM_Y, SDL_WINDOW_SHOWN);

	velocidad = getVelocidad(p.getArea());
	sentido_x = velocidad * getAleatorio(1, 1, true);
	sentido_y = velocidad * getAleatorio(1, 1, true);

	while(juego->correr())
	{
		frameInicio = juego->getTiempoJuego();

		juego->setColor(0, 0, 0);
		juego->manejarEventos();
		juego->limpiarRender();
		juego->setColor(getAleatorio(0, 255, false), getAleatorio(0, 255, false), getAleatorio(0, 255, false));
		for(i = 0; i < p.getCantidadVertices(); i += 1)
		{
			n = (i == p.getCantidadVertices() - 1)? 0 : i+1;
			cout << p.getVertice(i).getX() << ", " << p.getVertice(i).getY() << endl;
			if(abs(p.getVertice(i).getX()) <= RESOLUCION_MAX_X || abs(p.getVertice(i).getY()) <= RESOLUCION_MAX_Y)
				SDL_RenderDrawLine(juego->getRenderizador(), p.getVertice(i).getX(), p.getVertice(i).getY(), p.getVertice(n).getX(), p.getVertice(n).getY());
			else
			{
				velocidad = getVelocidad(p.getArea());
				sentido_x = velocidad * getAleatorio(1, 1, true);
				sentido_y = velocidad * getAleatorio(1, 1, true);
				p.inicializar(getAleatorio(MINIMO_LADOS_POLIGONO_REGULAR, MAXIMO_LADOS_POLIGONO_REGULAR, false), getAleatorio(MINIMO_RADIO, MAXIMO_RADIO, false), Coordenada(getAleatorio(0, 800, false), getAleatorio(0, 800, false)));
			}
		}

		juego->actualizar();

		for(i = 0; i < p.getCantidadVertices(); i += 1)
		{
			p.modificarVertice(i, Coordenada(p.getVertice(i).getX()+sentido_x, p.getVertice(i).getY()+sentido_y));
			// MUTANTE: p.modificarVertice(i, Coordenada(p.getVertice(i).getX()+getAleatorio(0, 1, true), p.getVertice(i).getY()+getAleatorio(0, 1, true)));
		}

		frameTiempo = juego->getTiempoJuego() - frameInicio;
		if(frameTiempo < TIEMPO_RETARDO)
			juego->setRetardo((int) TIEMPO_RETARDO - frameTiempo);
		/*for(c = 0; c < MAXIMO_POLIGONOS; c++)
		{
			pr[c].inicializar(getAleatorio(MINIMO_LADOS_POLIGONO_REGULAR, MAXIMO_LADOS_POLIGONO_REGULAR), getAleatorio(20, 80), Coordenada(250, 250));

			for(i = 0; i < pr[c].getCantidadVertices(); i += 1)
			{
				n = (i == pr[c].getCantidadVertices() - 1)? 0 : i+1;
				SDL_RenderDrawLine(juego->getRenderizador(), pr[c].getVertice(i).getX(), pr[c].getVertice(i).getY(), pr[c].getVertice(n).getX(), pr[c].getVertice(n).getY());
			}
		}*/

	}

	juego->limpiar();

	return 0;
}
