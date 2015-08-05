<%@page import="java.util.ArrayList"%>
<%@page contentType="java" pageEncoding="UTF-8"%>
<jsp:useBean id="conn" class="WAD.dbConnection" scope="session"></jsp:useBean>
<% 
    String name = request.getParameter("name");
    response.setContentType("text");
    response.setHeader("Cache-Control","no-cache");
    ArrayList<String> data = conn.getRow("users", name);
    
    if(data.size() > 0){
        response.setContentType("text/xml");
        response.setHeader("Cache-Control","no-cache");

        out.println("<response>");
        for(String field : data)
           out.println("<field>" +field+"</field>");
        out.println("</response>");
        
        out.close();
        
    }else{
        response.setStatus(HttpServletResponse.SC_NO_CONTENT);
    }
%>
