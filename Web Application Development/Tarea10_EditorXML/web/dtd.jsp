<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <style type="text/css">
            .mouseOut {
                    background: #708090;
                    color: #FFFAFA;
            }
            .mouseOver {
                    background: #FFFAFA;
                    color: #000000;
            }
            div{
                margin-left: auto;
                margin-right: auto;
                text-align: center;
                width: 25%;
                color: #e93446;
            }
            body{
                background-color: #efefef;
            }
	</style>
        
    <script type="text/javascript">
	<!--
	var xmlHttp;
	var completeDiv;
	var inputField;
	var nameTable;
	var nameTableBody;
        var content;
        var term;
	
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
                content = inputField.value;
	}

	function findTags() {
		initVars();
                var init,end;
		if ((end = content.length) > 0){
                    if(content.lastIndexOf(" ") == -1)
                        init = 0;
                    else init = content.lastIndexOf(" ")+1;
                    term = content.substring(init, end);
                    term = term.replace("<!", "");
                    createXMLHttpRequest();
                    var url = "http://localhost:8080/XMLG/AutoComp.jsp?names=" + escape(term);
                    xmlHttp.open("GET", url, true);
                    xmlHttp.onreadystatechange = callback;
                    xmlHttp.send(null);
                    
		} else {
			clearTags();
		}
	}
        
	function callback() {
		if (xmlHttp.readyState == 4) {
			if (xmlHttp.status == 200) {
				var name =
					xmlHttp.responseXML
					.getElementsByTagName("name")[0].firstChild.data;
				setTags(xmlHttp.responseXML.getElementsByTagName("name"));
			} else if (xmlHttp.status == 204){
				clearTags();
			}
		}
	}

	function setTags(the_names) {
		clearTags();
		var size = the_names.length;
		setOffsets();
		var row, cell, txtNode;
		for (var i = 0; i < size; i++){
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
	
	function populateName(cell){
                var endContent = content.lastIndexOf(term);
                var newval = content.substring(0,endContent)+cell.firstChild.nodeValue;
                inputField.value = newval;
		clearTags();
	}

	function clearTags() {
		var ind = nameTableBody.childNodes.length;
		for (var i = ind - 1; i >= 0 ; i--) {
			nameTableBody.removeChild(nameTableBody.childNodes[i]);
		}

		completeDiv.style.border = "none";
	}
    </script>
    
    </head>
    <body>
        <jsp:useBean id="write" scope="session" class="WAD.WriteFile"></jsp:useBean>
        <%
           String label = request.getParameter("label");
            String path = request.getServletContext().getRealPath("/");
            String content = request.getParameter("content");
            write.write(path+"\\"+label, content, "xml");
            //out.println("File : "+label+".xml created on "+path);
        %>
        <form action="dtdGenerate.jsp" method="post">
            FileName : <input type="text" name="label"/><br>
            
            <textarea id="names" onkeyup="findTags();" style="width:400px;height:500px;" name="content">Content</textarea>
            <div style="position:absolute;" id="popup">
                    <table id="name_table" bgcolor="#FFFAFA" border="0"
                            cellspacing="0" cellpadding="0"/>
                            <tbody id="name_table_body"></tbody>
                    </table>
            </div>
            <% session.setAttribute("xml", request.getParameter("label")); %>
            <!--<textarea name="content" id="names" >Contet of XML file</textarea>-->
            <br><input type="submit" value="Send"/>
        </form>
    </body>
</html>
