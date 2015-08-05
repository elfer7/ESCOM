<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tlds/selectp" prefix="SEL" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<!DOCTYPE html>
<html:html lang="true">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modify User</title>
        <style>
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
            table{
                 white-space: nowrap;
            }
        </style>
        <script type="text/javascript">
        <!--
            var xmlHttp;
            var selecItems;
            var index;
            var tableData;
        
            function createXMLHttpRequest(){
		if (window.ActiveXObject)
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		else if (window.XMLHttpRequest)
			xmlHttp = new XMLHttpRequest();
            }
            
            function setFields(){
                selecItems = document.getElementById("users");
                index = selecItems.selectedIndex;
                var user = selecItems.options[index].value;
                var url = "http://localhost:8080/loginEP/getData.jsp?name=" + user;
                var encodeuri = encodeURI(url);
                createXMLHttpRequest();
                xmlHttp.open("GET", encodeuri, true);
                xmlHttp.onreadystatechange = callback;
                xmlHttp.send(null);
                
            }
            
            function updateData(){
                var name = document.getElementById("name").value;
                var pass = document.getElementById("pass").value;
                var id = document.getElementById("id").value;
                var username = document.getElementById("data").rows[1].cells.item(0).innerHTML;
                if(id != "" && pass != "" && name != ""){
                    var url = "http://localhost:8080/loginEP/modifyUser.jsp?username="+username
                            +"&name=" + name
                            +"&pass="+ pass
                            +"&id="+id;
                    var encodeuri = encodeURI(url);
                    createXMLHttpRequest();
                    xmlHttp.open("GET", encodeuri, true);
                    xmlHttp.onreadystatechange = callbackstate;
                    xmlHttp.send(null);
                }
                else{
                    alert("There are fields empty");
                }
            }
            
            function callback() {
		if (xmlHttp.readyState == 4) {
                    if (xmlHttp.status == 200){
                        var name = xmlHttp.responseXML.getElementsByTagName("field");
                        fill(name);
                    }
		}
            }
            
            function callbackstate(){
                if (xmlHttp.readyState == 4) {
                    if (xmlHttp.status == 200){
                        var name = xmlHttp.responseText;
                        updateSelect();
                        clearData();
                        alert(name);
                    }
		}
            }
            
            function fill(data){
                for(var i =0; i<data.length ;i++)
                    document.getElementById("data").rows[1].cells.item(i).innerHTML = data[i].firstChild.data;
            }
            function clearData(){
                document.getElementById("name").value = "";
                document.getElementById("pass").value = "";
                document.getElementById("id").value = "";
            }
            function updateSelect(){
                index = selecItems.selectedIndex;
                selecItems.options[index].innerHTML = document.getElementById("name").value;
                selecItems.options[index].value = document.getElementById("name").value;
            }
        -->
        </script>
    </head>
    <body>
        <jsp:useBean id="conn" class="WAD.dbConnection" scope="session"></jsp:useBean>
        <%
            String id = ""+(String) session.getAttribute("id");
            if(id.equals("null"))
                response.sendRedirect("index.jsp");
        %>
        <div> 
            <!--Username : <select name="userName" id="users" onchange="setFields();">-->
            <SEL:SELE>
                setFields();
            </SEL:SELE>
            <!--</select>-->
        </div>
            <div style="width: 10%;">
            <table id="data" border="1" >
                <tr>
                    <th>Name</th>
                    <th>Password</th>
                    <th>ID</th>
                </tr>
                <tr>
                    <td> </td>
                    <td> </td>
                    <td> </td>
                </tr>
            </table>
                Name : <input type="text" id="name">
                Password : <input type="text" id="pass">
                ID : <input type="text" id="id">
                <label for="up" id="label"></label>
                <br><input type="button" value="Update" id="up" onclick="updateData();">
                <br><html:link forward="succes">Home</html:link>
        </div>
    </body>
</html:html>
