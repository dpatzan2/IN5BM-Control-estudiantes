/*
 * Copyright (C) 2021 Jorge Luis Pérez Canto
 */


package com.diegopatzan.models.idao;

import com.diegopatzan.models.domain.Estudiante;
import java.util.List;

/**
 *
 * @author George <george.jlpc@gmail.com>
 * @date Aug 19, 2021
 * @time 11:27:38 AM
 */

public interface IEstudianteDao {
    // Declaración de los métodos para acceder a la base de datos.
    public List<Estudiante> listar(); // getAllEstudiante
    public Estudiante encontrar(Estudiante estudiante); // getEstudianteByID
    public int insertar(Estudiante estudiante); // insert save add  
    public int actualizar(Estudiante estudinate); // update
    public int eliminar(Estudiante estudiante); // delete
}
