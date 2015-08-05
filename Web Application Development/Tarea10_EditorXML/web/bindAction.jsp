<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <jsp:useBean id="files" class="FILES.Files" scope="session"></jsp:useBean>
    <body>
        <%
            String dir = request.getServletContext().getRealPath("/");
            String xml = request.getParameter("xml");
            String dtd = request.getParameter("dtd");
            files.BindFiles(xml, dtd, dir);
            response.sendRedirect("home.jsp");
        %>
    </body>
</html>
