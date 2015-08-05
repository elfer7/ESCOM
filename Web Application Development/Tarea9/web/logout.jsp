<%@ page import="com.multiaportes.tarea3.modelo.BaseDatos, com.multiaportes.tarea3.control.Utilidad" %>
<%!
    HttpSession sesion;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Finalizar sesión</title>
    </head>
    <body>
        <%
            sesion = request.getSession();
            sesion.invalidate();
            for(Cookie c: request.getCookies())
            {
                c.setMaxAge(0);
                response.addCookie(c);
            }
        %>
        <a href="index.jsp">Volver al inicio</a>
    </body>
</html>
