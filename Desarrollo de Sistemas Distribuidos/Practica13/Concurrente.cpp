//
//  Interactivo.cpp
//  
//
//  Created by Eduardo Fernandez on 25/05/15.
//
//
#include "SocketDatagrama.h"
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <stdlib.h>

int main()
{
    int num[2];
    char ip[] = "192.168.1.255";
    int *res = NULL;
    SocketDatagrama socket;
    num[0] = 2;
    num[1] = 5;
    PaqueteDatagrama paq1(sizeof(int));
    socket.activaBroadcast();
    pid_t pid;
    int estado = 0;
    
    pid = fork();
    switch (pid) {
        case -1:
            perror("Error en el fork");
            break;
        case 0:
            while (1) {
                socket.recibe(paq1);
            }
            exit(0);
            break;
        default:
            //envia
            PaqueteDatagrama paq((char *)num,2 * sizeof(int),ip,7200);
            socket.envia(paq);
            wait(&estado);
            exit(0);
    }
}
    
    
