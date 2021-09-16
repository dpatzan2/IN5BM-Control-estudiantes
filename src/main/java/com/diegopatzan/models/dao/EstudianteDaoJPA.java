/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diegopatzan.models.dao;

import com.diegopatzan.db.ConexionPU;
import com.diegopatzan.models.domain.Estudiante;
import com.diegopatzan.models.idao.IEstudianteDao;
import java.util.List;

/**
 *
 * @author Windows 10
 */
public class EstudianteDaoJPA implements IEstudianteDao{

    private ConexionPU conn = ConexionPU.getInstance();
    
    @Override
    public List<Estudiante> listar() {
        return conn.getEntityManager().createNamedQuery("Estudiante.findAll").getResultList();
    }

    @Override
    public Estudiante encontrar(Estudiante estudiante) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int insertar(Estudiante estudiante) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int actualizar(Estudiante estudiante) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int eliminar(Estudiante estudiante) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
