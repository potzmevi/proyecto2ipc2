/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.sql.Blob;
import java.time.LocalDate;
import java.time.LocalTime;

/**
 *
 * @author potz
 */
public class Cita_Examen {
    private LocalDate fecha;
    private LocalTime hora;
    private Blob orden_medico;
    private String PACIENTE_codigo;
    private String EXAMEN_codigo;
    private String LABORATORISTA_codigo;

    public Cita_Examen(LocalDate fecha, LocalTime hora, Blob orden_medico, String PACIENTE_codigo, String EXAMEN_codigo, String LABORATORISTA_codigo) {
        this.fecha = fecha;
        this.hora = hora;
        this.orden_medico = orden_medico;
        this.PACIENTE_codigo = PACIENTE_codigo;
        this.EXAMEN_codigo = EXAMEN_codigo;
        this.LABORATORISTA_codigo = LABORATORISTA_codigo;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public LocalTime getHora() {
        return hora;
    }

    public void setHora(LocalTime hora) {
        this.hora = hora;
    }

    public Blob getOrden_medico() {
        return orden_medico;
    }

    public void setOrden_medico(Blob orden_medico) {
        this.orden_medico = orden_medico;
    }

    public String getPACIENTE_codigo() {
        return PACIENTE_codigo;
    }

    public void setPACIENTE_codigo(String PACIENTE_codigo) {
        this.PACIENTE_codigo = PACIENTE_codigo;
    }

    public String getEXAMEN_codigo() {
        return EXAMEN_codigo;
    }

    public void setEXAMEN_codigo(String EXAMEN_codigo) {
        this.EXAMEN_codigo = EXAMEN_codigo;
    }

    public String getLABORATORISTA_codigo() {
        return LABORATORISTA_codigo;
    }

    public void setLABORATORISTA_codigo(String LABORATORISTA_codigo) {
        this.LABORATORISTA_codigo = LABORATORISTA_codigo;
    }
    
    
}
