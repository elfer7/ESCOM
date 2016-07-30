#!/usr/bin/env python
'''
	==== Instituto Politécnico Nacional ====
	==== Escuela Superior de Cómputo ====
	==== Probabilidad y Estadística ====
	==== NHX::MétodosNuméricos - Librería genérica para el cálculo de integrales definidas mediante métodos numéricos conocidos ====
	==== Desarrollada por: Eder Ortega ====
	==== Website: http://blog.nativehex.com/probabilidad ====
	
	Se define a la integral definida calculada por Simpson (1/3) compuesto como:
	
		integral[lim_inf, lim_sup] f(x)dx ~= (lim_sup - lim_inf / 3*divisiones) (f(x0) + 4f(x1) + 2f(x2) + 4f(x3) + 2f(x4) + ... + 4f(x_impar) + 2f(x_par) + ... + 4f(x_div-1) + f(x_div))

	Esta es una implementación del método de Simpson compuesto para reducir el error en intervalos muy grandes; el número de divisiones siempre debe ser par.
'''
#from mpmath import mp,mpf
import math
import socket

def simpson(funcion, limite_inferior, limite_superior, divisiones):
	# Inicializar variables
	array_x = []
	x = None

	# Calcular la delta y la fracción de la fórmula
	delta_x = (limite_superior - limite_inferior) / divisiones
	fraccion = (limite_superior - limite_inferior) / (3 * divisiones)

	# Calcular los valores de las X
	xx = limite_inferior
	while xx <= limite_superior:
		array_x.append(xx)
		xx += delta_x

	# Evaluar y sumar las X de acuerdo a la fórmula
	suma = 0
	for i in range(len(array_x)):
		x = array_x[i]
		tmp = eval(funcion)
		if i == 0 or i == len(array_x) - 1:
			suma += tmp
		else:
			if i%2 == 0:
				tmp *= 4
			else:
				tmp *= 2
		suma += tmp
	del array_x[:] # Vaciamos la lista

	# Hacemos la última operación de multiplicación
	return fraccion * suma

def init():
	socketEscucha = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	socketEscucha.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
	socketEscucha.bind(('', 8088))
	socketEscucha.listen(1)
	#print('Servidor en escucha: puerto 8088')
	while True:
		tabla_examen = open('tabla-distribucion-normal.csv', 'a')
		conexionCliente, direccionCliente = socketEscucha.accept()
		peticion = conexionCliente.recv(1024).decode('utf-8') # Recibir bytes y convertirlos a Str
		peticion_get = peticion.split()[1][2:].split('&')
		argumentos = dict([i.split('=') for i in peticion_get])
		eval_ecuaciones = ['(pow(math.e, (-1/2) * pow((x-'+argumentos['mu']+') / '+argumentos['sigma']+', 2))) / ('+argumentos['sigma']+' * math.sqrt(2 * math.pi))', '(pow((math.e), pow(x, 2) / -2) / math.sqrt(2 * (math.pi)))']
		xxx = simpson(eval_ecuaciones[int(argumentos['ecuacion'])], float(argumentos['a']), float(argumentos['b']), int(argumentos['div']))
		print('%s, %s, %s' %(argumentos['a'], argumentos['b'], xxx))
		tabla_examen.write('%s, %s\n' %(argumentos['b'], str(xxx)[0:9]))
		conexionCliente.sendall(str.encode('HTTP/1.1 200 OK\r\nAccess-Control-Allow-Origin: *\r\n\r\n'+str(xxx))) #Mandar bytes; la cabecera es para que Firefox permita la respuesta si el cliente la solicitó desde un dominio diferente "localhost" (Cross-Origin)
		conexionCliente.close()
		tabla_examen.close()
	'''limite = 6
	incremento = 0.02
	alpha = -6
	beta = alpha + incremento
	divisiones = 8
	mu = '9'
	sigma = '19'
	eval_ecuaciones = ['(pow(math.e, (-1/2) * pow((x-'+mu+') / '+sigma+', 2))) / ('+sigma+' * math.sqrt(2 * math.pi))', '(pow((math.e), pow(x, 2) / -2) / math.sqrt(2 * (math.pi)))']

	while beta <= limite:
		w = simpson(eval_ecuaciones[1], alpha, beta, divisiones);
		beta += incremento
		print(w)
	'''
init()
