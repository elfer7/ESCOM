all: SocketDatagrama.o PaqueteDatagrama.o servidor cliente clienteNormal servidorNormal clienteHilos interactivo concurrente

clienteArchivos: SocketDatagrama.o PaqueteDatagrama.o
	g++ clienteArchivos.cpp SocketDatagrama.o PaqueteDatagrama.o -o clienteArchivos

servidorReconocimiento: SocketDatagrama.o PaqueteDatagrama.o
	g++ servidorReconocimiento.cpp SocketDatagrama.o PaqueteDatagrama.o -o servidorReconocimiento

clienteReconocimiento: SocketDatagrama.o PaqueteDatagrama.o
	g++ clienteReconocimiento.cpp SocketDatagrama.o PaqueteDatagrama.o -o clienteReconocimiento	

servidor: SocketDatagrama.o PaqueteDatagrama.o
	g++ servidor.cpp SocketDatagrama.o PaqueteDatagrama.o -o servidor

cliente: SocketDatagrama.o PaqueteDatagrama.o
	g++ cliente.cpp SocketDatagrama.o PaqueteDatagrama.o -o cliente	

clienteHilos: SocketDatagrama.o PaqueteDatagrama.o
	g++ -pthread clienteHilos.cpp SocketDatagrama.o PaqueteDatagrama.o -o clienteHilos

interactivo: SocketDatagrama.o PaqueteDatagrama.o
	g++ Interactivo.cpp SocketDatagrama.o PaqueteDatagrama.o -o interactivo

concurrente: SocketDatagrama.o PaqueteDatagrama.o
	g++ Concurrente.cpp SocketDatagrama.o PaqueteDatagrama.o -o concurrente

SocketDatagrama.o: SocketDatagrama.cpp SocketDatagrama.h
	g++ SocketDatagrama.cpp -c 

PaqueteDatagrama.o: PaqueteDatagrama.cpp PaqueteDatagrama.h
	g++ PaqueteDatagrama.cpp -c

servidorNormal:
	gcc programa9-1.c -o servidorNormal

clienteNormal:
	gcc programa10-1.c -o clienteNormal

clean:
	rm *.o servidor cliente clienteNormal servidorNormal clienteHilos interactivo concurrente
