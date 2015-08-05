
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Charset extends HttpServlet
{
    protected void doGet(HttpServletRequest peticion, HttpServletResponse respuesta) throws ServletException, IOException
    {
        respuesta.setContentType("text/html; charset=shift-jis"); // Si reemplazamos por ISO-8859-1, entonces los símbolos no aparecen
        PrintWriter p = respuesta.getWriter();
        
        String w = "Hola mundo";
        byte xxx[] = w.getBytes("Shift_JIS"); // Shift Japanese Industrial Standards => Katakana
        
        p.println(xxx.toString());
        p.println("こんにちは世界"); // Vía Google Translate
    }
    protected void doPost(HttpServletRequest peticion, HttpServletResponse respuesta) throws ServletException, IOException
    {
        
    }
}
