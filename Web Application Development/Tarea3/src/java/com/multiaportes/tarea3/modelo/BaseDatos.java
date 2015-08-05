package com.multiaportes.tarea3.modelo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class BaseDatos
{
    private static BaseDatos db = null;
    private static Map<String, String> usuarios;
    private static ArrayList productos, precios;
    
    private BaseDatos()
    {
        usuarios = new HashMap<String, String>();
        productos = new ArrayList();
        precios = new ArrayList();
        
        this.inicializarUsuarios();
        this.inicializarProductos();
    }
    
    private void inicializarUsuarios()
    {
        usuarios.put("nooberto", "x_yz");
        usuarios.put("nullencia", "teclado");
        usuarios.put("cafeconleche", "chupiicsa");
    }
    private void inicializarProductos()
    {
        productos.add("Grand Theft Auto V: Complete Collection");
        precios.add("799.90");
        productos.add("Far Cry 4: Gold Edition");
        precios.add("689.99");
        productos.add("Watch Dogs II: Season Pass");
        precios.add("550.00");
        productos.add("The Forest");
        precios.add("149.90");
        productos.add("Counter Strike GO");
        precios.add("299.90");
    }
    public static BaseDatos obtenerInstancia()
    {
        if(db == null)
            db = new BaseDatos();
        return db;
    }
    public static boolean checarLogin(String u, String p)
    {
        if(usuarios.get(u) != null) // Si el usuario existe
            return (usuarios.get(u).equals(p)); // Si la contraseña coincide
        return false;
    }
    public static Producto getProducto(int indice)
    {
        return new Producto((String) productos.get(indice), Float.parseFloat((String) precios.get(indice)));
    }
    public static int getTamanioArticulos()
    {
        return productos.size();
    }
}
