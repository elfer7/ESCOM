
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Subida extends HttpServlet
{
    protected void doGet(HttpServletRequest peticion, HttpServletResponse respuesta) throws ServletException, IOException
    {
        this.imprimirResultado(peticion, respuesta);
    }
    protected void doPost(HttpServletRequest peticion, HttpServletResponse respuesta) throws ServletException, IOException
    {
        this.imprimirResultado(peticion, respuesta);
    }
    private void imprimirResultado(HttpServletRequest peticion, HttpServletResponse respuesta)
    {
        try
        {
            PrintWriter p = respuesta.getWriter();
            p.println("Valor: "+peticion.getContentLength()+" bytes :)");
            this.getServletContext().log("He recibido "+peticion.getContentLength()+" bytes...");
        }
        catch(IOException x)
        {
            
        }
    }
}
