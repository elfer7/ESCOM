
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Prueba2 extends HttpServlet
{
    private Utilidad utilidad;
    
    protected void doGet(HttpServletRequest peticion, HttpServletResponse respuesta) throws ServletException, IOException
    {
        PrintWriter p = respuesta.getWriter();
        Cookie galletas[] = peticion.getCookies();
        
        utilidad = new Utilidad();

        String sesionID = "";
        String ua1 = "", ua2 = "";
        String valCookie = "NO_EXISTE";
        
        try
        {
            sesionID = this.utilidad.decodificar(peticion.getParameter("wwwww"));
            ua1 = this.utilidad.decodificar(peticion.getParameter("zzzzz"));
            ua2 = peticion.getHeader("User-Agent");
        }
        catch(Exception x)
        {
            
        }
        
        p.print(this.utilidad.INICIO);
        
        if(galletas == null)
        {
            p.print("Tienes las cookies deshabilitadas<br/>");
        }
        else
        {
            for(Cookie c: galletas)
            {
                if(c.getName().equals("valorPruebaTarea"))
                    valCookie = c.getValue();
            }
        }
        
        p.print("<h2>Información de depuración</h2>");
        p.print("UA:"+ua1+"<br/>");
        p.print("SESION_ID:"+sesionID+"<br/>");
        p.print("Valor cookie:"+valCookie+"<br/>");
        
        p.print(this.utilidad.FIN);
    }
}
