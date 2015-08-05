Proyecto2: Proyecto.cpp PoligonoRegular.o
	g++ -std=c++11 -lSDL2 Proyecto.cpp PoligonoRegular.o PoligonoIrregular.o Coordenada.o -o prac
PoligonoRegular.o: PoligonoRegular.cpp PoligonoIrregular.o PoligonoRegular.hpp
	g++ PoligonoRegular.cpp -c 
PoligonoIrregular.o: PoligonoIrregular.cpp Coordenada.o PoligonoIrregular.hpp
	g++ PoligonoIrregular.cpp -c 
Coordenada.o: Coordenada.cpp Coordenada.hpp
	g++ Coordenada.cpp -c
clean:
	rm *.o prac
