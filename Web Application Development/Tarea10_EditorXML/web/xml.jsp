<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Succes</title>
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
        <jsp:useBean id="write" scope="session" class="WAD.WriteFile"></jsp:useBean>
        <div>
            
        <% 
            String label = request.getParameter("label");
            String path = request.getServletContext().getRealPath("/");
            String content = request.getParameter("content");
            write.write(path+"\\"+label, content, "xml");
            out.println("File : "+label+".xml created on "+path);
        %>
        
        <br><html:link forward="welcome"> Home </html:link>
        
        </div>
    </body>
</html>
