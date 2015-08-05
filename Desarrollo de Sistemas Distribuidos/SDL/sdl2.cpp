/*
	IPN - ESCOM
	Desarrollo de Sistemas Distribuidos
	4CM1

	Equipo 5
	=> Hernández Jiménez Enrique
	=> Ortega Ortuño Eder
	=> Fernandez Eduardo

	multiaportes.com/sistemasdistribuidos
*/

#include <iostream>
#include "ModoGraficoSDL.cpp"
using namespace std;

int main(int argc, char **argv)
{
	ModoGraficoSDL *juego;
	SDL_Surface *bitmap;
	SDL_Texture *textura;
	
	juego = new ModoGraficoSDL();
	juego->iniciar("Hola mundo!", 10, 20, 640, 480, SDL_WINDOW_SHOWN);

	if((bitmap = SDL_LoadBMP("./hello.bmp")) == nullptr)
	{
		juego->multiaportesMensajeError("SDL_LoadBMP");
		return -1;
	}

	textura = SDL_CreateTextureFromSurface(juego->getRenderizador(), bitmap);
	SDL_FreeSurface(bitmap);
	if(textura == nullptr)
	{
		juego->multiaportesMensajeError("SDL_CreateTextureFromSurface");
		return -1;
	}

	while(juego->correr())
	{
		juego->manejarEventos();
		juego->limpiarRender();
		SDL_RenderCopy(juego->getRenderizador(), textura, NULL, NULL);
		juego->actualizar();
	}

	SDL_DestroyTexture(textura);
	juego->limpiar();

	return 0;
}
