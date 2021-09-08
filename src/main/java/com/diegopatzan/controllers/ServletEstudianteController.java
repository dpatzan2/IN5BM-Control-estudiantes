/*
 * Copyright (C) 2021 Jorge Luis Pérez Canto
 */
package com.diegopatzan.controllers;

import com.diegopatzan.models.dao.EstudianteDaoImpl;
import com.diegopatzan.models.domain.Estudiante;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;

/**
 *
 * @author George <george.jlpc@gmail.com>
 * @date Aug 25, 2021
 * @time 8:24:28 AM
 */
@WebServlet("/ServletEstudianteController")
public class ServletEstudianteController extends HttpServlet {

    private static final String JSP_LISTAR = "estudiantes/estudiante.jsp";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String accion = request.getParameter("accion");
        if (accion != null) {
            switch (accion) {
                case "insertar":
                    insertarEstudiante(request, response);
                    break;
            }
        }
    }

    private void insertarEstudiante(HttpServletRequest request, HttpServletResponse response) {
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");
        String saldoStr = request.getParameter("saldo");
        
        double saldo = 0;
        if ((saldoStr != null) && (!saldoStr.equals(""))) {
            saldo = Double.parseDouble(request.getParameter("saldo"));
        }
        Estudiante estudiante = new Estudiante(nombre, apellido, email, telefono, saldo);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String accion = request.getParameter("accion");

        if (accion != null) {

            switch (accion) {
                case "listar":
                    listarEstudiantes(request, response);
                    break;
                case "insertar":
                    // insertar
                    break;
                case "editar":
                    // Nombre del método a llamar para editar
                    break;
                case "eliminar":
                    eliminarEstudiante(request, response);
                    break;
            }

        }
    }

    private void eliminarEstudiante(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // Recuperamos el id del estudiante
        int idEstudiante = Integer.parseInt(request.getParameter("idEstudiante"));

        // Creamos el objeto de estudiante (modelo)
        Estudiante estudiante = new Estudiante(idEstudiante);

        // Eliminar el objeto de la base de datos
        int registrosEliminados = new EstudianteDaoImpl().eliminar(estudiante);

        System.out.println("Cantidad de registros eliminados: " + registrosEliminados);

        listarEstudiantes(request, response);
    }

    private void listarEstudiantes(HttpServletRequest request, HttpServletResponse response) throws IOException {

        List<Estudiante> listaEstudiante = new EstudianteDaoImpl().listar();

        HttpSession sesion = request.getSession();
        sesion.setAttribute("listadoEstudiante", listaEstudiante);
        sesion.setAttribute("totalEstudiantes", listaEstudiante.size());
        sesion.setAttribute("saldoTotal", calcularSaldoTotal());
        response.sendRedirect(JSP_LISTAR);
    }

    private double calcularSaldoTotal() {
        double saldoTotal = 0;
        List<Estudiante> listaEstudiante = new EstudianteDaoImpl().listar();
        for (Estudiante estudiante : listaEstudiante) {
            saldoTotal = saldoTotal + estudiante.getSaldo();
        }
        return saldoTotal;
    }

}
