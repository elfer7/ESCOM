package com.multiaportes.tarea3.control;

import java.io.IOException;
import java.io.PrintWriter;
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
