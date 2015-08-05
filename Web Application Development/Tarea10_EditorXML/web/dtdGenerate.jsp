<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <div>
        <jsp:useBean id="write" scope="session" class="WAD.WriteFile"></jsp:useBean>
        <jsp:useBean id="files" class="FILES.Files" scope="session"></jsp:useBean>
         <% 
            String dtd = request.getParameter("label");
            String xml = (String )session.getAttribute("xml");
            String path = request.getServletContext().getRealPath("/");
            String content = request.getParameter("content");
            write.write(path+"\\"+dtd, content, "dtd");
            files.BindFiles(xml+".xml", dtd+".dtd", path);
            out.println("file "+dtd+".dtd and file "+xml+".xml are now binded");
        %>
        
        <br><html:link forward="welcome"> Home </html:link>
        </div>
    </body>
</html>
