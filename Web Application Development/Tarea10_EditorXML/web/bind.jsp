<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="files" class="FILES.Files" scope="session"></jsp:useBean>
        <form action="bindAction.jsp" method="post">
        <% 
            String path = request.getServletContext().getRealPath("/");
            ArrayList<String> dtd = files.getDTDFiles(path);
            ArrayList<String> xml = files.getXMLFiles(path);
            
            if(dtd.isEmpty())
                out.println("Thre are not dtd files to bind");
            else if(xml.isEmpty())
                out.println("Thre are not xml files to bind");
            else{
                out.println("<select name=\"dtd\">");
                for(int i =0; i<dtd.size();i++){
                    out.println("<option name=\""+dtd.get(i)+"\" >"+dtd.get(i) +"</option>");
                }
                out.println("</select>");
                
                out.println("<select name=\"xml\">");
                for(int i =0; i<xml.size();i++){
                    out.println("<option name=\""+xml.get(i)+"\" >"+xml.get(i) +"</option>");
                }
                out.println("</select>");
                out.println("<input type=\"submit\" value=\"Next\"/>");
            }
        %>
        </form>
    </body>
</html>
