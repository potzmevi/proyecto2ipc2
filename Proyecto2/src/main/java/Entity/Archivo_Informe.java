/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import DataBase.Conexion;
import java.sql.Blob;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.Time;

/**
 *
 * @author potz
 */
public class Archivo_Informe {
    private Blob archivo;
    private String INFORME_EXAMEN_codigo;

    public Archivo_Informe(Blob archivo, String INFORME_EXAMEN_codigo) {
        this.archivo = archivo;
        this.INFORME_EXAMEN_codigo = INFORME_EXAMEN_codigo;
        insertarArchivo_Informe();
    }

    public Blob getArchivo() {
        return archivo;
    }

    public void setArchivo(Blob archivo) {
        this.archivo = archivo;
    }

    public String getINFORME_EXAMEN_codigo() {
        return INFORME_EXAMEN_codigo;
    }

    public void setINFORME_EXAMEN_codigo(String INFORME_EXAMEN_codigo) {
        this.INFORME_EXAMEN_codigo = INFORME_EXAMEN_codigo;
    }
    
    public void insertarArchivo_Informe() {

        String query = "INSERT INTO ARCHIVO_INFORME ("
                + " archivo,"
                + " INFORME_EXAMEN_codigo) VALUES ("
                + " ?, ?)";
        try {
            // set all the preparedstatement parameters
            PreparedStatement st = Conexion.getConnection().prepareStatement(query);
            st.setBlob(1, getArchivo());
            st.setString(2, getINFORME_EXAMEN_codigo());
            // execute the preparedstatement insert
            st.execute();
            st.close();
        } catch (Exception e) {
            // log exception
        }

    }
    
    
}
