/*
	IPN - ESCOM
	Administración de Servicios en Red
	Ortega Ortuño Eder - 4CV1
*/

var NHX_defaults = {
	debug: false,
	fondo: '#fff',
	tt: 'h1',
	st: 'h2',
	mn: 'h3',
	tx: 'p',
	pp: 'h6'
};
var NHX_infoExposicion = {
	diapositivas: [
		{titulo: "Servidor Proxy", pie: "Eder Ortega - 4CV1"},
		{subtitulo: "¿Qué es un servidor proxy?", texto: ["Es un software que actúa como intermediario en la comunicación de dos o más dispositivos dentro de una red.", "Su uso es frecuente en infraestructuras cliente-servidor."]},
		{texto: ["Generalmente un servidor proxy se encargará de evaluar si el recurso solicitado por un cliente cumple con las restricciones hechas por el administrador", "También puede ser visto como un representante capaz de no exponer a los miembros de la red."]},
		{subtitulo: "Clasificaciones", texto: ["Los servidores proxy pueden ser clasificados en una de las siguientes categorías."]},
		{minititulo: "Proxy tunel", texto: ["Es el más sencillo de todos, su función es pasar las peticiones y respuestas sin hacer modificaciones.."]},
		{minititulo: "Proxy de redireccionamiento", texto: ["Funciona de manera similar al anterior pero puede hacer modificaciones a los elementos involucrados en la comunicación. Es el más común."]},
		{minititulo: "Proxy inverso", texto: ["Visto desde el lado de los clientes, actúa como un servidor normal. Funciona como un representante de una red interna en la que existen otros servidores.", "La característica principal es que este tipo de proxies están más cerca de los servidores que del cliente."]},
		{texto: ["Suelen ofrecer servicios como cifrado SSL (la cual ya no es hecha por el servidor original para reducir el gasto de recursos), balanceo de carga, caché de contenido estático, compresión, etc."]},
		{subtitulo: "Tipos de servidores", texto: ["Existen diferentes servidores proxy para trabajar con gran cantidad de protocolos de red; las implementaciones de uso más común son las siguientes."]},
		{minititulo: "Servidor proxy web", texto: ["La tarea principal de estos servidores es redireccionar tráfico HTTP y HTTPS. Lo adecuado es que los servidores proxy no hagan modificaciones a las peticiones y respuestas, simplemente se limiten a retransmitir la información respetando las políticas impuestas por el administrador.", "En el RFC 2616 (HTTP 1.1) se mencionan las cabeceras que un servidor de este tipo puede modificar sin causar mayores problemas."]},
		{minititulo: "Servidor proxy transparente", texto: ["La idea detrás de este proxy es que los clientes no tengan idea de que existe, por lo que su función fundamental es no modificar el contenido a retransmitir.", "En la práctica muchos de ellos hacen funciones de un gateway o router, entre las que destacan funciones de caché para reducir el consumo de ancho de banda."]},
		{minititulo: "Servidor proxy CGI", texto: ["CGI es una tecnología que permite intercambiar información entre un cliente y un programa ejecutado en un servidor web; estos proxies se encargaban de generar una respuesta al usuario en función de la URL solicitada.", "Actualmente han sido reemplazados por opciones más eficaces y arquitecturas que brinden una mayor seguridad y eficiencia."]},
		{minititulo: "Servidor proxy DNS", texto: ["Su uso principal es almacenar registros DNS en la memoria caché con el objetivo de reducir sobrecargas en la red y evitar el gasto excesivo de ancho de banda.", "Deben estar constantemente actualizados con las jerarquías superiores de servidores."]},
		{subtitulo: "Usos", texto: ["Los servidores proxy en la práctica tienen infinidad de usos, entre los que destacan algunos de los siguientes."]},
		{minititulo: "Control de contenido", texto: ["Sea unidireccional o bidireccional, se encargan de que el tráfico cumpla con las políticas de restricción de contenido.", "Pueden producir registros y estadísticas de uso de ancho de banda, listas negras y blancas de URLs o DNS, escaneo anti malware, entre otros."]},
		{minititulo: "Filtrado de información mediante SSL", texto: ["Dado que en condiciones normales no son capaces de analizar el contenido que viaja por una conexión cifrada, se encargan de proveer una conexión cifrada con el cliente y otra con el destinatario. Así son capaces de interceptar el contenido en texto plano y verificar que cumpla con las políticas de restricción."]},
		{minititulo: "Evasión de filtros", texto: ["También son utilizados para lo contrario: evadir filtros existentes que en condiciones normales son utilizados para censura."]},
		{minititulo: "Registro y escucha", texto: ["Pueden actuar como un agente chismoso almacenando toda la información que pasa a través de ellos."]},
		{minititulo: "Caché", texto: ["Son capaces de acelerar las respuestas al obtener contenido periódicamente de las fuentes originales y actualizándose cada cierto tiempo."]},
		{minititulo: "Anonimización y seguridad", texto: ["Funcionan como un representante que protege al cliente original, así los servidores no tendrán idea de quién realizó la petición originalmente.", "Bajo el mismo concepto funciona para proteger un conjunto de equipos con la implementación de un firewall dentro del mismo servidor proxy."]},
		{pie: "Fin"}
	],
	fondos: []
};
var opciones = {
	controls: true,
	progress: true,
	slideNumber: true,
	history: false,
	keyboard: true,
	overview: true,
	center: true,
	loop: false,
	fragments: true,
	transition: 'convex',
	transitionSpeed: 'fast',
	backgroundTransition: 'zoom'
};

function NHX_init()
{
	document.getElementById('envolvente').remove();
	NHX_draw();
	Reveal.initialize(opciones);
	document.getElementById('presentacionASR').mozRequestFullScreen();
}
function NHX_draw()
{
	for(diapositiva in NHX_infoExposicion.diapositivas)
	{
		document.getElementById('nhx_diap').innerHTML += '<section data-background="'+NHX_getFondo(diapositiva)+'">'+NHX_getTexto(diapositiva)+'</section>';
	}
}
function NHX_getFondo(id)
{
	return (NHX_infoExposicion.fondos[id] === undefined)? NHX_defaults.fondo : NHX_infoExposicion.fondos[id];
}
function NHX_getTexto(id)
{
	var elemento = NHX_infoExposicion.diapositivas[id];
	var html = '';
	
	if(elemento.titulo !== undefined)
	{
		html += NHX_genTags(NHX_defaults.tt, elemento.titulo);
	}
	if(elemento.subtitulo !== undefined)
	{
		html += NHX_genTags(NHX_defaults.st, elemento.subtitulo);
	}
	if(elemento.minititulo !== undefined)
	{
		html += NHX_genTags(NHX_defaults.mn, elemento.minititulo);
	}
	if(elemento.texto !== undefined)
	{
		html += NHX_genTags(NHX_defaults.tx, elemento.texto);
	}
	if(elemento.pie !== undefined)
	{
		html += NHX_genTags(NHX_defaults.pp, elemento.pie);
	}

	return html;
}
function NHX_genTags(template_tag, contenido)
{
	if(contenido instanceof Array)
	{
		var tmp = '';
		for(var i = 0; i < contenido.length; i++)
		{
			tmp += '<'+template_tag+'>'+contenido[i]+'</'+template_tag+'>';
		}
		return tmp;
	}
	if(typeof contenido === 'string')
	{
		return '<'+template_tag+'>'+contenido+'</'+template_tag+'>';
	}
}
