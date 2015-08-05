package mx.deviz.wad1;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServlet;

public class Validador extends HttpServlet
{
    private PrintWriter escritor;
    
    public Validador()
    {
        this.escritor = null;
    }

    /*
        La solucion para el applet fue copiar el sourcecode del mismo a la carpeta /web del proyecto y allí mismo compilar manualmente
        dicho código. Así, se accede mediante su ruta absoluta dentro del Servlet para mostrarlo en la web.
    */
    protected void doGet(HttpServletRequest peticion, HttpServletResponse respuesta) throws ServletException, IOException
    {
        String nombre = (peticion.getParameter("t1n").equals("") || peticion.getParameter("t1n") == null)? "SinNombre": peticion.getParameter("t1n");
        String cuerpo = "<applet code='TareaUno' source='http://localhost:8080/Tarea1/TareaUno.class' width='640' height='480'><param name='nombreApp' value='"+nombre+"'></applet>";
        
        PrintWriter escritor = respuesta.getWriter();
        this.escritor = escritor;
        escritor = null;
        
        respuesta.setContentType("text/html;charset=UTF-8"); // Establecido mediante las HTTP Headers
        
        this.escritor.println("<!DOCTYPE html><html><head></head><body>"+cuerpo+"</body></html>");
        //processRequest(request, response);
    }
}
