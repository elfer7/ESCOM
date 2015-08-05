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

ModoGraficoSDL::ModoGraficoSDL()
{

}
ModoGraficoSDL::~ModoGraficoSDL()
{

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
void ModoGraficoSDL::setColor(int r, int g, int b)
{
	SDL_SetRenderDrawColor(this->renderizador, r, g, b, 255);
}
void ModoGraficoSDL::limpiarRender()
{
	SDL_RenderClear(this->renderizador);
}
void ModoGraficoSDL::actualizar()
{
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
SDL_Renderer *ModoGraficoSDL::getRenderizador()
{
	return this->renderizador;
}
Uint32 ModoGraficoSDL::getTiempoJuego()
{
	return SDL_GetTicks();
}