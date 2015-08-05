package com.multiaportes.tarea3.modelo;

public class Producto
{
    private String nombre;
    private Float precio;
    
    public Producto(String nombre, Float precio)
    {
        this.nombre = nombre;
        this.precio = precio;
    }
    public String getNombre()
    {
        return this.nombre;
    }
    public Float getPrecio()
    {
        return this.precio;
    }
}
