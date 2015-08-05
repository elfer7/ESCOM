package com.multiaportes.tarea3.control;

import com.multiaportes.tarea3.modelo.BaseDatos;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Tienda extends HttpServlet
{
    protected void doGet(HttpServletRequest peticion, HttpServletResponse respuesta) throws ServletException, IOException
    {
        Utilidad.obtenerInstancia();
        BaseDatos.obtenerInstancia();
        
        PrintWriter p = respuesta.getWriter();
        HttpSession sesion = peticion.getSession();
        Cookie usuario = Utilidad.obtenerGalleta(peticion.getCookies(), "usuario"), temporal;
        ArrayList articulosExistentes = new ArrayList();
        int tamanio = BaseDatos.getTamanioArticulos();
        
        try
        {
            if(Utilidad.checarSesionActiva(usuario, sesion))
            {
                String asdfg = "<input type='number' name='art";
                
                // Checar si ya existen artículos ordenados previamente: cookie => "carro_videojuegoX" -> cantidad donde X es el índice
                for(int i = 0; i < tamanio; i++)
                {
                    try
                    {
                        temporal = Utilidad.obtenerGalleta(peticion.getCookies(), "carro_videojuego"+i);
                        articulosExistentes.add(i, temporal.getValue());
                    }
                    catch(NullPointerException np)
                    {
                        articulosExistentes.add(i, 0);
                    }
                }
                                
                p.print(Utilidad.getCabecera());
                p.print("<h1>Lista de videojuegos</h1>");
                p.print("<form action='CheckOut' method='post'>");
                
                for(int i = 0; i < tamanio; i++)
                {
                    p.print(BaseDatos.getProducto(i).getNombre() + " | $" + BaseDatos.getProducto(i).getPrecio() + " MXN " + asdfg + i + "' value='" + articulosExistentes.get(i) + "'><br/>");
                }
                p.print("<input type='submit' value='Añadir al carro'>");
                
                p.print("</form>");
                p.print(Utilidad.getFooter());
            }
        }
        catch(NullPointerException np)
        {
            p.print("<h1>Fallo de autenticación en el servidor</h1>");
        }
    }
}
