/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author Erick
 */
public class viewModelcliente {
      private int idCliente;
    private String nombre;
    private String apellido;
    private String identificacion;
    private String telefono;

    // Getter para idCliente
    public int getIdCliente() {
        return idCliente;
    }

    // Setter para idCliente
    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    // Getter para nombre
    public String getNombre() {
        return nombre;
    }

    // Setter para nombre
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    // Getter para apellido
    public String getApellido() {
        return apellido;
    }

    // Setter para apellido
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    // Getter para identificacion
    public String getIdentificacion() {
        return identificacion;
    }

    // Setter para identificacion
    public void setIdentificacion(String identificacion) {
        this.identificacion = identificacion;
    }

    // Getter para telefono
    public String getTelefono() {
        return telefono;
    }

    // Setter para telefono
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
}

