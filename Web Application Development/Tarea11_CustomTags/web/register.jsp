<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html:html lang="true">
    <head>
        
        <title></title>
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
    </head>
    <body>
        <jsp:useBean id="conn" class="WAD.dbConnection" scope="session"></jsp:useBean>
        <div>
        <% 
            String name = request.getParameter("name");
            String password = request.getParameter("pass");
            conn.insertInto("users(name,password)", "\""+name+"\""+",\""+password+"\"");
        %>
        <h1>Succes</h1>
        <br><html:link forward="succes" style="color:#557f8e">Home</html:link>
        </div>
    </body>
</html:html>