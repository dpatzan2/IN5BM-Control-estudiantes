/*
 * Copyright (C) 2021 Jorge Luis Pérez Canto
 */


package com.diegopatzan.models.dao;

import com.diegopatzan.db.Conexion;
import com.diegopatzan.models.domain.Estudiante;
import com.diegopatzan.models.idao.IEstudianteDao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author George <george.jlpc@gmail.com>
 * @date Aug 19, 2021
 * @time 11:25:53 AM
 */

public class EstudianteDaoImpl implements IEstudianteDao {
    
    private static final String SQL_SELECT = "SELECT id_estudiante, nombre, apellido, email, telefono, saldo FROM estudiante";
    private static final String SQL_DELETE = "DELETE FROM estudiante WHERE id_estudiante = ?";
    
    private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    private Estudiante estudiante = null;
    private List<Estudiante> listaEstudiantes = new ArrayList<>();  
    
    //Obtener todos los listaEstudiantes
    @Override
    public List<Estudiante> listar() {
        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_SELECT);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {
                int idEstudiante = rs.getInt("id_estudiante");
                String nombre = rs.getString("nombre");
                String apellido = rs.getString("apellido");
                String email = rs.getString("email");
                String telefono = rs.getString("telefono");
                double saldo = rs.getDouble("saldo");
                
                estudiante = new Estudiante(idEstudiante, nombre, apellido, email, telefono, saldo);
                listaEstudiantes.add(estudiante);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(pstmt);
            Conexion.close(conn);
        }
        return listaEstudiantes;
    }
    
    //Obtener un estudiante por el id
    @Override
    public Estudiante encontrar(Estudiante estudiante) {
        // return listaEstudiantes.get(id);
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    // Insertar un estudiante
    @Override
    public int insertar(Estudiante estudiante) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    // Actualizar un estudiante
    @Override
    public int actualizar(Estudiante estudinate) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    // Eliminar un estudiante por el id
    @Override
    public int eliminar(Estudiante estudiante) {
        int rows = 0;
        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_DELETE);
            pstmt.setInt(1, estudiante.getIdEstudiante());
            System.out.println(pstmt.toString());
            rows = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } finally {
            Conexion.close(pstmt);
            Conexion.close(conn);
        }
        return rows;
    }

}