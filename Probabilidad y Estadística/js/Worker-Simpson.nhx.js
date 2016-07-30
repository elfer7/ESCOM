/*
	==== Instituto Politécnico Nacional ====
	==== Escuela Superior de Cómputo ====
	==== Probabilidad y Estadística ====
	==== NHX::MétodosNuméricos - Librería genérica para el cálculo de integrales definidas mediante métodos numéricos conocidos ====
	==== Desarrollada por: Eder Ortega ====
	==== Website: http://blog.nativehex.com/probabilidad ====

	*** Descripción: este archivo es parte del Worker para la programación concurrente en JS; requiere de un navegador web moderno y que cumpla con el estándar HTML5 y otros. ***

	* Nota: esta implementación requiere de la librería Math.js (http://mathjs.org)
*/

/*
	Se define a la integral definida calculada por Simpson (1/3) compuesto como:
	
		integral[lim_inf, lim_sup] f(x)dx ~= (lim_sup - lim_inf / 3*divisiones) (f(x0) + 4f(x1) + 2f(x2) + 4f(x3) + 2f(x4) + ... + 4f(x_impar) + 2f(x_par) + ... + 4f(x_div-1) + f(x_div))

	Esta es una implementación del método de Simpson compuesto para reducir el error en intervalos muy grandes; el número de divisiones siempre debe ser par.
*/

// Importamos los scripts necesarios (dependencias)
importScripts('math.min.js');
// Inicializar parámetros de configuración para intentar reducir consumo de memoria; se ejecuta antes de recibir un mensaje
math.config({precision: 4}); // Por defecto es de 64
// Todas las variables serán globales
var array_x = [];
var delta_x = fraccion = xx = tmp = suma = undefined;

// Al recibir un mensaje, se ejecuta el callback
self.addEventListener('message', function(evento)
	{
		// Inicializar variables BigNumber y genéricas
		funcion_original = evento.data[0];
		limite_inferior = math.bignumber(evento.data[1]);
		limite_superior = math.bignumber(evento.data[2]);
		divisiones = evento.data[3];

		// Calcular la delta
		delta_x = math.divide(math.subtract(limite_superior, math.abs(limite_inferior)), divisiones);
		fraccion = math.divide(math.subtract(limite_superior, limite_inferior), 3 * divisiones); // Si falla, hay qué intentar con el valor absoluto para que no existan resultados negativos
		
		// Calcular cada una de las X
		xx = limite_inferior;
		while(math.smallerEq(xx, limite_superior))
		{
			array_x.push(xx);
			xx = math.add(xx, delta_x);
		}

		// Evaluar y sumar las X de acuerdo a la fórmula
		suma = math.bignumber(0);
		for(i = 0; i < array_x.length; i++)
		{
			tmp = math.eval(funcion_original, {x: array_x[i]});
			if(i == 0 || i == array_x.length - 1)
			{
				suma = math.add(suma, tmp);
				continue;
			}
			if(i % 2 != 0)
				tmp = math.multiply(tmp, 4);
			else
				tmp = math.multiply(tmp, 2);

			suma = math.add(suma, tmp);
		}
		array_x.length = 0;

		self.postMessage([math.string(limite_inferior), math.string(limite_superior), math.string(math.multiply(fraccion, suma))]); // Devolvemos el resultado como un string
	},
false);