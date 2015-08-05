
import com.sun.org.apache.xml.internal.security.utils.Base64;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.MessageDigest;

public class Utilidad
{
    public String INICIO, FIN, SAL;
    
    public Utilidad()
    {
        this.INICIO = "<html><head></head><body>";
        this.FIN = "</body></html>";
        this.SAL = "__deviz.mx__";
    }
    public String obtenerHash(String cadena) throws Exception // Avienta errores; feature omitida de la tarea
    {
        MessageDigest x = MessageDigest.getInstance("SHA-256");
        x.update(cadena.getBytes("UTF-8"));
        return new String(x.digest());
    }
    public String codificar(String cd) throws Exception // El método puede lanzar una Exception, por lo que quien la invoque deberá hacerlo mediante bloques try-catch
    {
        // En este caso utilizamos BASE64 para ofuscar el SESSIONID, sin embargo
        // no es el método más seguro ya que alguien con conocimientos en seguridad web
        // podría darse cuenta en pocos intentos que estamos utilizando BASE64
        // y con ello descifrar el SESSIONID. Lo peligroso del asunto es que
        // el atacante puede reemplazar por un nuevo SESSIONID codificado en BASE64
        // y el servidor no se dará cuenta que es el mismo cliente, sino creerá
        // que es otra persona. Además, este tipo de técnica es susceptible al secuestro de sesión (session hijacking)
        // de una manera muy sencilla al hacer peticiones al servidor utilizando un SESSIONID de alguien más
        
        return URLEncoder.encode(Base64.encode(cd.getBytes()), "UTF-8");
    }
    public String decodificar(String cd) throws Exception
    {
        return new String(Base64.decode(URLDecoder.decode(cd, "UTF-8")));
    }
}