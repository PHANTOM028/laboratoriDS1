/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.util.Date;


public class viewModelReserva {
    private int idReserva;
    private int idCliente;
    private int idRecepcionista;
    private int idPaquete;
    private Date fecha;

    // Getter para idReserva
    public int getIdReserva() {
        return idReserva;
    }

    // Setter para idReserva
    public void setIdReserva(int idReserva) {
        this.idReserva = idReserva;
    }

    // Getter para idCliente
    public int getIdCliente() {
        return idCliente;
    }

    // Setter para idCliente
    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    // Getter para idRecepcionista
    public int getIdRecepcionista() {
        return idRecepcionista;
    }

    // Setter para idRecepcionista
    public void setIdRecepcionista(int idRecepcionista) {
        this.idRecepcionista = idRecepcionista;
    }

    // Getter para idPaquete
    public int getIdPaquete() {
        return idPaquete;
    }

    // Setter para idPaquete
    public void setIdPaquete(int idPaquete) {
        this.idPaquete = idPaquete;
    }

    // Getter para fecha
    public Date getFecha() {
        return fecha;
    }

    // Setter para fecha
    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
}