package com.multiaportes.tarea3.control;

import com.multiaportes.tarea3.modelo.BaseDatos;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckOut extends HttpServlet
{
    protected void doPost(HttpServletRequest peticion, HttpServletResponse respuesta) throws ServletException, IOException
    {
        BaseDatos.obtenerInstancia();
        Utilidad.obtenerInstancia();
        
        PrintWriter p = respuesta.getWriter();
        HttpSession sesion = peticion.getSession();
        Cookie usuario = Utilidad.obtenerGalleta(peticion.getCookies(), "usuario"), temporal;
        int tamanio = BaseDatos.getTamanioArticulos();
        
        try
        {
            if(Utilidad.checarSesionActiva(usuario, sesion))
            {
                for(int i = 0; i < tamanio; i++)
                {
                    String arti = peticion.getParameter("art"+i);

                    Cookie temporal2 = new Cookie("carro_videojuego"+i, (arti != null)? arti : "0");
                    temporal2.setMaxAge(Utilidad.getTiempoSesion());
                    respuesta.addCookie(temporal2);
                }
                p.print(Utilidad.getCabecera());
                p.print("Carro actualizado. Puedes <a href='Tienda'>agregar más productos</a> o <a href='Logout'>finalizar tu sesión</a>.");
                p.print(Utilidad.getFooter());
            }
        }
        catch(NullPointerException np)
        {
            p.print("<h1>Fallo de autenticación en el servidor</h1>");
        }
    }
}
