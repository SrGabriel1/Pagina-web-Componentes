/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controlador;

import Modelo.Producto;
import jakarta.servlet.http.HttpSession;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author abelc
 */
public class Consultas extends Conexion {

 
    public boolean autenticacion(String usuario, String clave) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            System.out.println("usuario:" + usuario + "clave:" + clave);
            String consulta = "select * from usuario where nombre=? and contrasena=?";
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
        ResultSet rs = null;
        try {
            // Verificar si ya existe un usuario con el mismo nombre
            String consultaExistente = "SELECT * FROM usuario WHERE nombre = ?";
            pst = getConexion().prepareStatement(consultaExistente);
            pst.setString(1, usuario);
            rs = pst.executeQuery();

            // Si el usuario ya existe, devolver false
            if (rs.next()) {
                return false; // Usuario ya existe
            }

            // Si no existe, proceder con la inserción
            String consultaInsertar = "INSERT INTO usuario(nombre, contrasena) VALUES(?, ?)";
            pst = getConexion().prepareStatement(consultaInsertar);
            pst.setString(1, usuario);
            pst.setString(2, clave);

            if (pst.executeUpdate() == 1) {
                return true; // Registro exitoso
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
    


}
