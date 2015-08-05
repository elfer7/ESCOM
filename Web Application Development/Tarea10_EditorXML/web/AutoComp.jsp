<%@page import="WAD.ServicioComparador"%>
<%@page import="java.util.ArrayList"%>
<%@page import="WAD.XMLRead"%>
<%@page contentType="java" pageEncoding="UTF-8"%> 
<jsp:useBean id="read" class="WAD.XMLRead" scope="session"></jsp:useBean>
<%  
    String prefijo = request.getParameter("names");
    String path = request.getServletContext().getRealPath("/");
    ArrayList palabras=read.cargarXml(path+"\\att.xml");
    ServicioComparador comparator = ServicioComparador.obtInstancia(palabras);
    ArrayList similares = comparator.buscarPalabras(prefijo);
        if(similares.size() > 0){
                response.setContentType("text/xml");
                response.setHeader("Cache-Control","no-cache");
                out.println("<response>");

                for(int i = 0; i < similares.size(); i++){
                        String palabra = (String)similares.get(i);
                        out.println("<name>" + palabra + "</name>");	
                }

                out.println("</response>");

                //sa.cerrarConexion();
                palabras = null;
                similares = null;
                comparator = null;

                out.close();	
        }else{
                response.setStatus(HttpServletResponse.SC_NO_CONTENT);
        }
%>
    