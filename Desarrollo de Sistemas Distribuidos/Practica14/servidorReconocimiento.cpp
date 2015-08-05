#include "SocketDatagrama.h"
#include <unistd.h>

using namespace std;

int main()
{
    SocketDatagrama socket(7272);
    int *paquetesAEnviar;
    int numeroDePaquete = 0;
    while (1) {
        PaqueteDatagrama paq(sizeof(paquetesAEnviar));
        socket.recibe(paq);
        paquetesAEnviar = (int*)paq.obtieneDatos();
        std::cout << "recibiendo de " << paq.obtieneDireccion() << 
        " numero de paquetes a enviar " << *paquetesAEnviar << std::endl;
            int dormido = 0;
        while(numeroDePaquete < *paquetesAEnviar)
        {
            PaqueteDatagrama paq1((char *) &numeroDePaquete,sizeof(int)*256,paq.obtieneDireccion(),paq.obtienePuerto());
            socket.envia(paq1);

            if(numeroDePaquete % 50 == 0)
            {
//               std::cout << " durmiendo en " << numeroDePaquete << std::endl;
               usleep(250);
               dormido++;
            }
            numeroDePaquete++;
        }
        std::cout << "enviados " << numeroDePaquete << " a " << paq.obtieneDireccion();
        std::cout << " dormido " << dormido << std::endl;
        numeroDePaquete = 0;
    }
    return 0;
}
