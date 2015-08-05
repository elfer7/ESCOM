/*
	IPN - ESCOM
	Desarrollo de Sistemas Distribuidos
	4CM1

	Equipo 5
	=> Ortega Ortuño Eder

	multiaportes.com/sistemasdistribuidos
*/

#include <iostream>
#include "ModoGraficoSDL.hpp"

ModoGraficoSDL::ModoGraficoSDL(int c, bool d): cantidad(c), debug(d)
{
	/*puntosTmp = (SDL_Point *) std::malloc(20 * sizeof(SDL_Point));
	if(puntosTmp == NULL)
		std::exit(-1);*/
	asteroides.reserve(this->cantidad);
}
ModoGraficoSDL::~ModoGraficoSDL()
{
	/*free(puntosTmp);
	puntosTmp = NULL;*/
}
bool ModoGraficoSDL::multiaportesMensajeError(const char *funcion)
{
	std::cerr << "Error [" << funcion << "()]: " << SDL_GetError() << std::endl;
	return false;
}
bool ModoGraficoSDL::init(const char *mensaje, int x, int y, int w, int h, int flags)
{
	if(SDL_Init(SDL_INIT_EVERYTHING) != 0)
		return this->multiaportesMensajeError("SDL_Init");

	if((this->ventana = SDL_CreateWindow(mensaje, x, y, w, h, flags)) == nullptr)
		return this->multiaportesMensajeError("SDL_CreateWindow");

	if((this->renderizador = SDL_CreateRenderer(this->ventana, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC)) == nullptr)
		return this->multiaportesMensajeError("SDL_CreateRenderer");

	return true;
}
void ModoGraficoSDL::iniciar(const char *mensaje, int x, int y, int w, int h, int flags)
{
	this->corriendo = this->init(mensaje, x, y, w, h, flags);
}
bool ModoGraficoSDL::correr()
{
	return this->corriendo;
}
void ModoGraficoSDL::actualizar()
{
	int c;

	// Monitorear centros de cada asteroide para eliminarlo si está fuera de la pantalla
	for(c = 0; c < this->asteroides.size(); c++)
	{
		if(abs(this->asteroides.at(c).getX()) > VENTANA_X + VENTANA_TOLERANCIA || abs(this->asteroides.at(c).getY()) > VENTANA_Y + VENTANA_TOLERANCIA)
				this->asteroides.erase(this->asteroides.begin() + c);
	}

	// Agregar nuevos asteroides si no han superado el límite
	if(this->asteroides.size() < this->cantidad)
	{
		int radio_diff = getAleatorio(0, ASTEROIDE_RADIO_DIFF, false), magnitudes_size = getAleatorio(ASTEROIDE_VERTICES_MINIMO, ASTEROIDE_VERTICES_MAXIMO, false);
		this->magnitudes.reserve(magnitudes_size);

		for(c = 0; c < magnitudes_size; c++)
			this->magnitudes.push_back(getAleatorio(ASTEROIDE_RADIO_MINIMO, ASTEROIDE_RADIO_MAXIMO - radio_diff, false));

		if(this->debug)
			std::cout << "Cantidad vertices: " << this->magnitudes.size() << std::endl;

		asteroide = new Asteroide(magnitudes, getAleatorio(ASTEROIDE_RADIO_MAXIMO, VENTANA_X + VENTANA_TOLERANCIA, true), getAleatorio(ASTEROIDE_RADIO_MAXIMO, VENTANA_Y + VENTANA_TOLERANCIA, true), getAleatorio(0, 255, false), getAleatorio(0, 255, false), getAleatorio(0, 255, false),false);
		this->asteroides.emplace_back(*asteroide);
		this->magnitudes.clear();
		delete asteroide;
	}
	//}
	// Monitorear coordenadas each asteroide en el vector
		// if asteroides(i).coordenada > LIMITES_VENTANA + RADIO_ASTEROIDE
			// destruirAsteroide(i)
	//if this->asteroides.size() < LIMITE_ASTEROIDES
		/*
			En este punto se crea un nuevo centro aleatorio para el nuevo asteroide;
			de acuerdo a la región generada, se desplazará en 4 posibles direcciones
			y siempre pasando por la pantalla. El giro horario/antihorario es aleatorio
		*/
		// std::vector<int> magnitudes;
		// for(i < rand(maximo_vectores_por_asteroide))
			// magnitudes.push_back(magnitud_aleatoria);
		// new Asteroide(&magnitudes, x_rand, y_rand, giro_rand);
	// foreach asteroide en el vector
		// Actualizar posiciones asteroide(i)...aquí considerar la velocidad de desplazamiento/rotación


	/*for(i = 0; i < 7; i++)
		std::cout << puntosTmp[i].x << ", " << puntosTmp[i].y << std::endl;
	std::cout << std::endl;*/
}
void ModoGraficoSDL::renderizar()
{
	int i = 0;
	std::vector<Asteroide>::iterator it_as;

	SDL_SetRenderDrawColor(this->renderizador, 0, 0, 0, 255);
	SDL_RenderClear(this->renderizador);

	for(it_as = this->asteroides.begin(); it_as != this->asteroides.end(); ++it_as)
	{
		SDL_SetRenderDrawColor(this->renderizador, it_as->getR(), it_as->getG(), it_as->getB(), 255);
		SDL_RenderDrawLines(this->renderizador, it_as->getPuntosSDL(), it_as->getCantidadLineas());
		it_as->actualizar();
	}

	SDL_RenderPresent(this->renderizador);
}
void ModoGraficoSDL::manejarEventos()
{
	SDL_Event evento;
	if(SDL_PollEvent(&evento))
	{
		switch(evento.type)
		{
			case SDL_QUIT:
				this->corriendo = false;
				break;
			default:
				break;
		}
	}
}
void ModoGraficoSDL::limpiar()
{
	SDL_DestroyRenderer(this->renderizador);
	SDL_DestroyWindow(this->ventana);
	SDL_Quit();
}
void ModoGraficoSDL::setRetardo(int tiempo)
{
	SDL_Delay(tiempo);
}
Uint32 ModoGraficoSDL::getTiempoJuego()
{
	return SDL_GetTicks();
}