# Variables
COMPILADOR=g++

# Targets
# Principal
construir: ejercicio.cpp PoligonoIrregularTarget
	$(COMPILADOR) ejercicio.cpp PoligonoIrregular.o Coordenada.o
PoligonoIrregularTarget: PoligonoIrregular.cpp CoordenadaTarget PoligonoIrregular.hpp
	$(COMPILADOR) -c PoligonoIrregular.cpp
CoordenadaTarget: Coordenada.cpp Coordenada.hpp
	$(COMPILADOR) -c Coordenada.cpp

# Notas
# Argumento "-c" indica que el compilador no debe linkear