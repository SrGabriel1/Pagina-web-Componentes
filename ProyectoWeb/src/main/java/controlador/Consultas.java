/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlador;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author abelc
 */
public class Consultas extends Conexion {

    public boolean autenticacion(String usuario, String clave) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String consulta = "select * from usuarios where nombre=? and contrasena=?";
            System.out.println("Consulta es " + consulta);
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, usuario);
            pst.setString(2, clave);
            rs = pst.executeQuery();

            // Si hay al menos un resultado
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("Error en " + e);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (getConexion() != null) {
                    getConexion().close();
                }
            } catch (Exception e) {
                System.out.println("Error en " + e);
            }
        }
        return false;
    }

    
    public boolean registrar(String usuario, String clave) {
        PreparedStatement pst = null;
        try {
            String consulta = "insert into usuarios(nombre,contrasena) values(?,?)";
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, usuario);
            pst.setString(2, clave);
            if (pst.executeUpdate() == 1) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("Error en " + e);
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
            } catch (Exception e) {
                System.out.println("Error en " + e);
            }
        }
        return false;
    }
}
