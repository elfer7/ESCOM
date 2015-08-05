	/* Definiciones necesarias para los clientes y el servidor de archivos */
#define MAX_PATH 255 	//Longitud máxima en el nombre de un archivo
#define BUF_SIZE 1000 	//Cantidad de bytes que se transfieren por paquete

/* Definición de las operaciones permitidas */
#define CREATE 	1 	//Crea un nuevo archivo
#define READ 	2	//Lee una parte del archivo
#define WRITE 	3 	//Escribe una parte del archivo
#define DELETE 	4 	//Elimina un archivo existente

/*Códigos de error */
#define OK 		0	//Operación correcta
#define E_BAD_OPCODE 	-1 	//Operación desconocida
#define E_BAD_PARAM 	-2 	//Error en un parámetro
#define E_IO 		-3 	//Error en disco u otro error de E/S

/* Formato del mensaje que viaja del cliente hacia el servidor. 
 * El tipo de dato numérico uint32_t está definido en 		
 * y es consistente entre computadoras distintas e
 * independiente del sistema operativo
 */
struct messageCS
{
	// Código de la operación solicitada por el cliente
	uint32_t opcode; 	
	// Numero de bytes útiles (leídos o por escribir), devuelto por el servidor en READ y enviado por el cliente en WRITE
	uint32_t count; 	
	// Lugar del archivo donde se debe iniciar la lectura o escritura, enviado por el cliente
	uint32_t offset; 
	// Nombre del archivo sobre el cual se opera
	char name[MAX_PATH]; 
};

/* Formato del mensaje que viaja del servidor hacia el cliente */
struct messageSC
{
	// Numero de bytes útiles, devuelto por el servidor en READ y enviado por el cliente en WRITE
	uint32_t count; 
	// Código de error devuelto por el servidor
	uint32_t result; 
	// Datos del archivo 
	char data[BUF_SIZE]; 
};
