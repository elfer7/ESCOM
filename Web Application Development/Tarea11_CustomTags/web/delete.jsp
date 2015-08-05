<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tlds/selectp" prefix="SEL" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html:html lang="true">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete User</title>
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
        </style>
        <script type="text/javascript">
        <!--
            var xmlHttp;
            var selecItems;
            var index;
        
            function createXMLHttpRequest(){
		if (window.ActiveXObject)
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		else if (window.XMLHttpRequest)
			xmlHttp = new XMLHttpRequest();
            }
            
            function deleteUser(){
                
                selecItems = document.getElementById("users");
                index = selecItems.selectedIndex;
                var user = selecItems.options[index].value;
                var url = "http://localhost:8080/loginEP/deleteUser.jsp?name=" + user;
                var encodeuri = encodeURI(url);
                createXMLHttpRequest();
                xmlHttp.open("GET", encodeuri, true);
                xmlHttp.onreadystatechange = callback;
                xmlHttp.send(null);
                
            }
            
            function callback() {
		if (xmlHttp.readyState == 4) {
                    if (xmlHttp.status == 200){
                        var name = xmlHttp.responseText;
                        removeOption();
                        alert(name);
                    }
		}
            }
            function removeOption(){
                selecItems.remove(index);
            }
            
        -->
        </script>
    </head>
    <body>
        <%
            String id = ""+(String) session.getAttribute("id");
            if(id.equals("null"))
                response.sendRedirect("index.jsp");
        %>
        <div>
        <jsp:useBean id="conn" class="WAD.dbConnection" scope="session"></jsp:useBean>
        Username : 
        ><!--<select name="userName" id="users" onchange="clearLabel();">-->
            <SEL:SELE>
                clearLabel();
            </SEL:SELE>
        <!--</select>-->
        <br>
        <label for="del" id="label"></label>
        <input type="button" value="Delete" id="del" onclick="deleteUser();" /><br>
        <html:link forward="succes">Home</html:link>
        </div>
    </body>
</html:html>
