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
public class EstudianteDaoJPA implements IEstudianteDao {

    private ConexionPU conn = ConexionPU.getInstance();

    @Override
    public List<Estudiante> listar() {
        return conn.getEntityManager().createNamedQuery("Estudiante.findAll").getResultList();
    }

    @Override
    public Estudiante encontrar(Estudiante estudiante) {
        return (Estudiante) conn.getEntityManager().createNamedQuery("Estudiante.find").setParameter("id", estudiante.getIdEstudiante()).getSingleResult();
    }

    @Override
    public int insertar(Estudiante estudiante) {
        int rows = 0;
        try {
            conn.getEntityManager().getTransaction().begin();
            conn.getEntityManager().persist(estudiante);
            conn.getEntityManager().getTransaction().commit();
            rows = 1;
        } catch (Exception e) {
            e.printStackTrace(System.out);
            conn.getEntityManager().getTransaction().rollback();
        }
        return rows;

    }

    @Override
    public int actualizar(Estudiante estudiante) {
        int rows = 0;
        try {
            conn.getEntityManager().getTransaction().begin();
            conn.getEntityManager().merge(estudiante);
            conn.getEntityManager().getTransaction().commit();
            rows = 1;
        } catch (Exception e) {
            e.printStackTrace(System.out);
            conn.getEntityManager().getTransaction().rollback();
        }
        return rows;
    }

    @Override
    public int eliminar(Estudiante estudiante) {
        int rows = 0;
        try {
            conn.getEntityManager().getTransaction().begin();
            conn.getEntityManager().remove(estudiante);
            conn.getEntityManager().getTransaction().commit();
            rows = 1;
        } catch (Exception e) {
            e.printStackTrace(System.out);
            conn.getEntityManager().getTransaction().rollback();
        }
        return rows;
    }

}
