<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<!DOCTYPE html>
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
        </style>
    </head>
    <body style="background-color: #efefef;">
        <% 
            String name = ""+(String) session.getAttribute("id");
            if(name.equals("null"))
                response.sendRedirect("index.jsp");
        %>
        <div>
            <% out.println("<h1>Welcome "+name+"</h1>"); %><br>
            <html:link forward="signup"> Add User </html:link>
            <html:link forward="delete"> Delete User </html:link>
            <html:link forward="modify"> Modify User </html:link>
        </div>
    </body>
</html:html>
