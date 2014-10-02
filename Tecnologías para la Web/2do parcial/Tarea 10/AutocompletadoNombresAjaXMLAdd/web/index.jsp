<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Ajax Auto Complete</title>
	<style type="text/css">
		.mouseOut {
			background: #708090;
			color: #FFFAFA;
		}
		.mouseOver {
			background: #FFFAFA;
			color: #000000;
		}
	</style>
<script type="text/javascript">
	<!--
	var xmlHttp;
	var completeDiv;
	var inputField;
	var nameTable;
	var nameTableBody;
	
	function createXMLHttpRequest() {
		if (window.ActiveXObject) {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		else if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		}
	}

	function initVars() {
		inputField = document.getElementById("names");
		nameTable = document.getElementById("name_table");
		completeDiv = document.getElementById("popup");
		nameTableBody = document.getElementById("name_table_body");
	}

	function findNames() {	//Primer m�todo en ser llamado
		initVars();
		if (inputField.value.length > 0) {
			createXMLHttpRequest();
			var url = "http://localhost:8080/AutocompletadoNombresAjaXMLAdd/AutocompletadoServlet?names=" + escape(inputField.value);
			xmlHttp.open("GET", url, true); // true = comunicacion asincrona, false = sincrona
			xmlHttp.onreadystatechange = callback;
			xmlHttp.send(null);
		} else {
			clearNames();
		}
	}

	function callback() {
		if (xmlHttp.readyState == 4) {
			if (xmlHttp.status == 200) {
				var name =
					xmlHttp.responseXML
					.getElementsByTagName("name")[0].firstChild.data;
				setNames(xmlHttp.responseXML.getElementsByTagName("name"));
			} else if (xmlHttp.status == 204){
				clearNames();
			}
		}
	}

	function setNames(the_names) {
		clearNames();
		var size = the_names.length;
		setOffsets();
		var row, cell, txtNode;
		for (var i = 0; i < size; i++) {
			var nextNode = the_names[i].firstChild.data;
			row = document.createElement("tr");
			cell = document.createElement("td");
			cell.onmouseout = function() {this.className='mouseOver';};
			cell.onmouseover = function() {this.className='mouseOut';};
			cell.setAttribute("bgcolor", "#FFFAFA");
			cell.setAttribute("border", "0");
			cell.onclick = function() { populateName(this); } ;
			txtNode = document.createTextNode(nextNode);
			cell.appendChild(txtNode);
			row.appendChild(cell);
			nameTableBody.appendChild(row);
		}
	}	


	function setOffsets() {
		var end = inputField.offsetWidth;
		var left = calculateOffsetLeft(inputField);
		var top = calculateOffsetTop(inputField) + inputField.offsetHeight;
		completeDiv.style.border = "black 1px solid";
		completeDiv.style.left = left + "px";
		completeDiv.style.top = top + "px";
		nameTable.style.width = end + "px";
	}

	function calculateOffsetLeft(field) {
		return calculateOffset(field, "offsetLeft");
	}
	
	function calculateOffsetTop(field) {
		return calculateOffset(field, "offsetTop");
	}

	function calculateOffset(field, attr) {
		var offset = 0;
		while(field) {
			offset += field[attr];
			field = field.offsetParent;
		}
		return offset;
	}
	
	function populateName(cell) {
		inputField.value = cell.firstChild.nodeValue;
		clearNames();
	}

	function clearNames() {
		var ind = nameTableBody.childNodes.length;
		for (var i = ind - 1; i >= 0 ; i--) {
			nameTableBody.removeChild(nameTableBody.childNodes[i]);
		}

		completeDiv.style.border = "none";
	}
	-->
</script>
</head>
<body>
	<h1>Ejemplo AJAX Autocompletado XML</h1>

		Names: <input type="text" size="20" id="names"
		onkeyup="findNames();" style="height:20;" maxlength="20"/>
                <br/>
                <br/>
                <br/>
                <script type="text/javascript">
                    var objeto;
                    var caja;
                    
                    function crearXMLHttpRequest()
                    {
                        if(window.ActiveXObject)
                        {
                            objeto = new ActiveXObject("Microsoft.XMLHTTP");
                        }
                        else if(window.XMLHttpRequest)
                        {
                            objeto = new XMLHttpRequest();
                        }
                    }
                    function inicializar()
                    {
                        caja = document.getElementById("nombre");
                        
                        if(caja.value.length > 0)
                        {
                            createXMLHttpRequest();
                            var url = "http://localhost:8080/AutocompletadoNombresAjaXMLAdd/AddNombre?n="+caja.value;
                            objeto.open("GET", url, true);
                            objeto.onreadystatechange = callback;
                            objeto.send();
                        }
                    }
                    function agregarNombre()
                    {
                        crearXMLHttpRequest();
                        inicializar();
                    }
                </script>
                Agregar nombre: <input type="text" size="20" id="nombre">
                <input type="button" onclick="agregarNombre();" value="Agregar">

	<div style="position:absolute;" id="popup">
		<table id="name_table" bgcolor="#FFFAFA" border="0"
			cellspacing="0" cellpadding="0"/>
			<tbody id="name_table_body"></tbody>
		</table>
	</div>
</body>
</html>