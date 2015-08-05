//
//  cliente.cpp
//  
//
//  Created by Eduardo Fernandez on 24/05/15.
//
//

#include "SocketDatagrama.h"

int main()
{
    int num[2];
    char ip[] = "192.168.0.116";
    int *res;
    SocketDatagrama socket;
    num[0] = 2;
    num[1] = 5;
    PaqueteDatagrama paq((char *)num,2 * sizeof(int),ip,7200);
    socket.envia(paq);
    PaqueteDatagrama paq1(sizeof(int));
    socket.recibe(paq1);
    res = (int *)paq1.obtieneDatos();
    std::cout << "RESPUESTA: " << *res << std::endl;
    
    return 0;
}