#include <inttypes.h>	
#include <cstdlib>
#include <cstdio>
#include <cstring>
#include <fcntl.h>
#include <unistd.h>
#include "header.h"
#include "SocketDatagrama.h"
#include "PaqueteDatagrama.h"

int main(int argc, char ** argv)
{
	int port;
	int destino;
	char serverIp[16];
	char fileName[MAX_PATH];
	if(argc != 4)
	{
		exit(-1);
	}
	
	strcpy(serverIp, argv[1]);
	port = atoi(argv[2]);
	strcpy(fileName, argv[3]);
	
	SocketDatagrama socket = SocketDatagrama();
	messageCS mensaje;
	strcpy(mensaje.name, fileName);
	
	PaqueteDatagrama in = PaqueteDatagrama(sizeof(messageSC));
	socket.setTiempoEspera(0.5);
	int offset = 0, ans = 0;
	messageSC * dataIn;
	destino = open(fileName, O_WRONLY|O_TRUNC|O_CREAT, 0666);
	int peticion = 1, perdidas = 0;
	do {
		mensaje.opcode = READ;
		mensaje.count = 0;
		mensaje.offset = offset;
		PaqueteDatagrama out = PaqueteDatagrama((char*)&mensaje, sizeof(mensaje),serverIp, port);
		
		ans = 0;
		socket.envia(out);
		ans = socket.recibe(in);
		while(ans == -1) {
			socket.envia(out);
			ans = socket.recibe(in);
			perdidas++;
		}
		dataIn = (messageSC *) in.obtieneDatos();
		if(OK == dataIn->result)
		{
			write(destino, dataIn->data, dataIn->count);
		}
		else
		{
			printf("Recibe error de %s:%d, error %d\n",in.obtieneDireccion(), in.obtienePuerto(),dataIn->result);
		}
		offset += dataIn->count;
	} while((BUF_SIZE - dataIn->count) == 0);
	close(destino);
	printf("Archivo recibido bytes: %d\n\n", offset);
}
