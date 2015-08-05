/*
	IPN - ESCOM
	Desarrollo de Sistemas Distribuidos
	4CM1

	Equipo 5
	=> Ortega Ortuño Eder

	multiaportes.com/sistemasdistribuidos

	g++ -std=c++11 -lSDL2
*/

#include <iostream>
#include <SDL2/SDL.h>

using namespace std;

SDL_Window *ventana;
SDL_Renderer *renderizador;

bool init(const char *mensaje, int x, int y, int w, int h, int flags)
{
	if(SDL_Init(SDL_INIT_EVERYTHING) != 0)
	{
		cerr << "Error SDL_Init(): " << SDL_GetError() << endl;
		return false;
	}

	if((ventana = SDL_CreateWindow(mensaje, x, y, w, h, flags)) == nullptr)
	{
		cerr << "Error SDL_CreateWindow(): " << SDL_GetError() << endl;
		return false;
	}

	if((renderizador = SDL_CreateRenderer(ventana, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC)) == nullptr)
	{
		cerr << "Error SDL_CreateRenderer(): " << SDL_GetError() << endl;
		return false;
	}

	return true;
}
int main(int argc, char **argv)
{
	if(init("Hola mundo!", 10, 20, 640, 480, SDL_WINDOW_SHOWN))
	{
		SDL_Surface *bitmap;
		SDL_Texture *textura;

		if((bitmap = SDL_LoadBMP("./hello.bmp")) == nullptr)
		{
			cerr << "Error SDL_LoadBMP(): " << SDL_GetError() << endl;
			return -1;
		}

		textura = SDL_CreateTextureFromSurface(renderizador, bitmap);
		SDL_FreeSurface(bitmap);
		if(textura == nullptr)
		{
			cerr << "Error SDL_CreateTextureFromSurface(): " << SDL_GetError() << endl;
			return -1;
		}

		SDL_RenderClear(renderizador);
		SDL_RenderCopy(renderizador, textura, NULL, NULL);
		SDL_RenderPresent(renderizador);
		SDL_Delay(5000);

		SDL_DestroyTexture(textura);
		SDL_DestroyRenderer(renderizador);
		SDL_DestroyWindow(ventana);
		SDL_Quit();
	}

	return 0;
}
