<%@page contentType="java" pageEncoding="UTF-8"%>
<jsp:useBean id="conn" class="WAD.dbConnection" scope="session"></jsp:useBean>
<% 
    String  username = request.getParameter("username");
    String name = request.getParameter("name");
    String pass = request.getParameter("pass");
    String id = request.getParameter("id");
    
    response.setContentType("text");
    response.setHeader("Cache-Control","no-cache");
    boolean succes = conn.updateValues("users", "name=\""+name+"\",password=\""+pass+"\",ID="+id+"", username);
    
    if(succes)
        out.println("Done");
    else 
        out.println("ERROR");
    out.close();
%>
