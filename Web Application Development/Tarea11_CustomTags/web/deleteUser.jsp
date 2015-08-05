<%@page contentType="java" pageEncoding="UTF-8"%>
<jsp:useBean id="conn" class="WAD.dbConnection" scope="session"></jsp:useBean>
<% 
    String name = request.getParameter("name");
    response.setContentType("text");
    response.setHeader("Cache-Control","no-cache");
    boolean succes = conn.delete("users", name);
    if(succes)
        out.println("done");
    else 
        out.println("error");
    out.close();
%>
