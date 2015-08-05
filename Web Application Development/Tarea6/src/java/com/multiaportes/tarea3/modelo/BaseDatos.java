package com.multiaportes.tarea3.modelo;

import java.sql.*;
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
    
    private static Connection conectarDB() throws Exception
    {
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost/escom_wad1", "root", "");
    }
    private static void inicializarUsuarios()
    {
        try
        {
            Connection conexion = conectarDB();
            Statement s = conexion.createStatement();
            ResultSet rs = s.executeQuery("SELECT * from usuarios");
            
            while(rs.next())
                usuarios.put(rs.getString("u"), rs.getString("p"));
            
            conexion.close();
        }
        catch(Exception e)
        {
            
        }
    }
    private static void inicializarProductos()
    {
        try
        {
            Connection conexion = conectarDB();
            Statement s = conexion.createStatement();
            ResultSet rs = s.executeQuery("SELECT * from productos");
            
            while(rs.next())
            {
                productos.add(rs.getString("nombre"));
                precios.add(rs.getString("precio"));
            }
            
            conexion.close();
        }
        catch(Exception e)
        {
            
        }
    }
    public static void hacerUpdate(String update)
    {
        try
        {
            Connection conexion = conectarDB();
            PreparedStatement ps = conexion.prepareStatement(update);
            ps.executeUpdate();
            
            conexion.close();
        }
        catch(Exception e)
        {
            
        }
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
