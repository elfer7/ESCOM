package com.multiaportes.tarea3.control;

import com.multiaportes.tarea3.modelo.BaseDatos;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Logout extends HttpServlet
{
    protected void doGet(HttpServletRequest peticion, HttpServletResponse respuesta) throws ServletException, IOException
    {
        Cookie temporal;
        int tamanio = BaseDatos.getTamanioArticulos();
        PrintWriter p = respuesta.getWriter();
        
        String timestamp = Calendar.getInstance().getTime().toString(), usr = Utilidad.obtenerGalleta(peticion.getCookies(), "usuario").getValue();
        
        BaseDatos.hacerUpdate("INSERT INTO carroscompra VALUES ('"+timestamp+"', '"+usr+"')");
        
        for(int i = 0; i < tamanio; i++)
        {
            try
            {
                temporal = Utilidad.obtenerGalleta(peticion.getCookies(), "carro_videojuego"+i);
                
                if(Integer.parseInt(temporal.getValue()) > 0)
                    BaseDatos.hacerUpdate("INSERT INTO compras VALUES('"+timestamp+"', "+Integer.toString(i+1)+", "+temporal.getValue()+")");
            }
            catch(NullPointerException np)
            {
                
            }
        }
        
        // Destruir posibles sesiones existentes y cookies
        HttpSession sesionAntigua = peticion.getSession();
        sesionAntigua.invalidate();
        for(Cookie g: peticion.getCookies())
        {
            g.setMaxAge(0);
            respuesta.addCookie(g);
        }
        respuesta.sendRedirect("index.jsp");
        
    }
    protected void doPost(HttpServletRequest peticion, HttpServletResponse respuesta) throws ServletException, IOException
    {
        
    }
}
