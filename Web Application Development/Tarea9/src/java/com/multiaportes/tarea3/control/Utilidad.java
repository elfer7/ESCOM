package com.multiaportes.tarea3.control;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

public class Utilidad
{
    private static Utilidad ut = null;
    private static int tiempoSesion;
    
    private Utilidad()
    {
        tiempoSesion = 15 * 60;
    }
    public static Utilidad obtenerInstancia()
    {
        if(ut == null)
            ut = new Utilidad();
        return ut;
    }
    public static Cookie obtenerGalleta(Cookie galletas[], String nombreGalleta)
    {
        if(galletas != null)
        {
            for(Cookie galleta : galletas)
                if(galleta.getName().equals(nombreGalleta))
                    return galleta;
        }
        return null;
    }
    public static boolean checarSesionActiva(Cookie galleta, HttpSession sesion)
    {
        return galleta.getValue().equals((String) sesion.getAttribute("usuario"));
    }
    public static String getCabecera()
    {
        return "<!DOCTYPE html><html><head><title>Juegos</title></head><body>";
    }
    public static String getFooter()
    {
        return "</body></html>";
    }
    public static int getTiempoSesion()
    {
        return tiempoSesion;
    }
}
