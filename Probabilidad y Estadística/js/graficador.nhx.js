/*
	NHX-Plotter - Funciona gracias a Dygraph
*/

function graficar(ecuacion, grafica, inicio, fin)
{
	var eq = ecuacion;
	var graph = grafica;
	var width = parseInt(graph.style.width, 10);
	var x1 = inicio;
	var x2 = fin;
	var xs = 1.0 * (x2 - x1) / width;
	var informacion = [];

	for(var i = 0; i < width; i++)
	{
		var x = x1 + i * xs;
		var y = eval(ecuacion);
		var row = [x];
		if (y.length > 0)
		{
			for (var j = 0; j < y.length; j++)
			{
				row.push(y[j]);
            }
        }
        else
        {
        	row.push(y);
        }
        informacion.push(row);
    }
    opciones = {strokeWidth:5, color:"#2bbbad", drawGrid: true, drawAxesAtZero: true, includeZero: true};
    new Dygraph(graph, informacion, opciones);
}