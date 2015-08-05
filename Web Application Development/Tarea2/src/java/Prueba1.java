import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Prueba1 extends HttpServlet
{
    private Utilidad utilidad;
    
    protected void doGet(HttpServletRequest peticion, HttpServletResponse respuesta) throws ServletException, IOException
    {
        PrintWriter p = respuesta.getWriter();
        HttpSession sesion = peticion.getSession();
        Cookie galleta;
        
        utilidad = new Utilidad();
        
        String sesionID = sesion.getId();
        String ua = peticion.getHeader("User-Agent");
        String uri = peticion.getScheme()+"://"+peticion.getServerName()+":"+peticion.getServerPort()+peticion.getContextPath();
        
        p.print(utilidad.INICIO);
        
        galleta = new Cookie("valorPruebaTarea", "666");
        respuesta.addCookie(galleta);
        
        try
        {
            respuesta.sendRedirect(uri+"/Prueba2?wwwww="+this.utilidad.codificar(sesionID)+"&zzzzz="+this.utilidad.codificar(ua));
        }
        catch(Exception x)
        {
            p.print("He intentado codificar tu sesión y fallé...");
        }
        
        p.print(utilidad.FIN);
    }
}
