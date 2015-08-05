
import java.awt.Color;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Binario extends HttpServlet
{
    protected void doGet(HttpServletRequest peticion, HttpServletResponse respuesta) throws ServletException, IOException
    {
        try
        {
            /*
                MODELOS DE COLOR: 
                - RGB se usa para desplegar en la pantalla
                - CMYK se usa para las impresiones
            
                GIF
                - 256 colores
                - Animados
                - Fondos transparentes
            */
            respuesta.setContentType("image/jpeg");
            
            BufferedImage bi = new BufferedImage(200, 200, BufferedImage.TYPE_INT_RGB);
            Graphics g = bi.getGraphics();
            g.setColor(Color.BLUE);
            g.fillOval(0, 0, 199, 199);
            
            g.dispose();
            
            ImageIO.write(bi, "jpg", respuesta.getOutputStream());
        }
        catch(IOException e)
        {
            
        }
    }
    protected void doPost(HttpServletRequest peticion, HttpServletResponse respuesta) throws ServletException, IOException
    {
        
    }
}
