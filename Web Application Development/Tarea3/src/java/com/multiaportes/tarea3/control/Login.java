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

public class Login extends HttpServlet
{
    protected void doPost(HttpServletRequest peticion, HttpServletResponse respuesta) throws ServletException, IOException
    {
        BaseDatos.obtenerInstancia();
        Utilidad.obtenerInstancia();
        
        PrintWriter escritor = respuesta.getWriter();
        String usr = peticion.getParameter("sr"), pwd = peticion.getParameter("wd");
        
        escritor.print(Utilidad.getCabecera());
        
        if(usr != null && pwd != null)
        {
            if(BaseDatos.checarLogin(usr, pwd))
            {
                HttpSession sesion = peticion.getSession();
                Cookie usuario = new Cookie("usuario", usr);
                
                sesion.setAttribute("usuario", usr);
                usuario.setMaxAge(Utilidad.getTiempoSesion());
                
                respuesta.addCookie(usuario);
                
                respuesta.sendRedirect("Tienda");
                
                // El jodido RequestDispatcher no considera las cookies creadas en este servlet
                // RequestDispatcher despachador = peticion.getRequestDispatcher("Tienda");
                // despachador.forward(peticion, respuesta);
            }
            else
                escritor.print("<h1>Login incorrecto</h1>");
        }
        else
            escritor.print("<h1>Acceso denegado</h1>");
        
        escritor.print(Utilidad.getFooter());
    }
}
