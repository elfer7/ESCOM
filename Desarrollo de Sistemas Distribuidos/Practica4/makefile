# Variables
COMPILADOR=g++

# Targets
# Principal
construir: ejercicio.cpp RectanguloTarget
	$(COMPILADOR) ejercicio.cpp Rectangulo.o Coordenada.o
# Genera a "Rectangulo.o"
RectanguloTarget: Rectangulo.cpp CoordenadaTarget Rectangulo.hpp
	$(COMPILADOR) -c Rectangulo.cpp
# Genera a "Coordenada.o"
CoordenadaTarget: Coordenada.cpp Coordenada.hpp
	$(COMPILADOR) -c Coordenada.cpp

# Notas
# Argumento "-c" indica que el compilador no debe linkear