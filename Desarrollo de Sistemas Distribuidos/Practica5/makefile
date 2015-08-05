# Variables
COMPILADOR=g++

# Targets
# Principal
construir2: ejercicio2.cpp PoligonoIrregularTarget
	$(COMPILADOR) ejercicio2.cpp PoligonoIrregular.o Coordenada.o
construir3: ejercicio3.cpp PoligonoIrregularTarget
	$(COMPILADOR) ejercicio3.cpp PoligonoIrregular.o Coordenada.o
PoligonoIrregularTarget: PoligonoIrregular.cpp CoordenadaTarget PoligonoIrregular.hpp
	$(COMPILADOR) -c PoligonoIrregular.cpp
CoordenadaTarget: Coordenada.cpp Coordenada.hpp
	$(COMPILADOR) -c Coordenada.cpp

# Notas
# Argumento "-c" indica que el compilador no debe linkear