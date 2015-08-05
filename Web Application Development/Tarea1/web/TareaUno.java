import java.applet.Applet;
import java.awt.Color;
import java.awt.Graphics;

public class TareaUno extends Applet
{
    public void init()
    {
        this.setBackground(Color.GREEN);
    }
    public void paint(Graphics xD)
    {
    	xD.setColor(Color.RED);
    	xD.drawString("Saludos, "+this.getParameter("nombreApp"), 100, 70);
    }
}
