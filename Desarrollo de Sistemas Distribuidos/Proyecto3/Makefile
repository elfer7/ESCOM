Proyecto3: Proyecto.cpp Asteroide.o
	g++ -g -std=c++11 -lSDL2 Proyecto.cpp Asteroide.o Vector2D.o -o Proyecto3
Asteroide.o: Asteroide.cpp Vector2D.o Asteroide.hpp
	g++ -std=c++11 Asteroide.cpp -c 
Vector2D.o: Vector2D.cpp Vector2D.hpp
	g++ -std=c++11 Vector2D.cpp -c
clean:
	rm *.o Proyecto3
