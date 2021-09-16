/*
 * Copyright (C) 2021 Jorge Luis Pérez Canto
 */
package com.diegopatzan.controllers;

import com.diegopatzan.models.dao.EstudianteDaoImpl;
import com.diegopatzan.models.domain.Estudiante;
import com.diegopatzan.models.dao.EstudianteDaoJPA;
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
    private static final String JSP_EDITAR = "estudiantes/editar-estudiante.jsp";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        request.setCharacterEncoding("UTF-8");
        String accion = request.getParameter("accion");
        if (accion != null) {
            switch (accion) {
                case "insertar":
                    insertarEstudiante(request, response);
                    break;
                case "actualizar":
                    actualizarEstudiante(request, response);
                    break;
            }
        }
    }

    private void actualizarEstudiante(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int idEstudiante = Integer.parseInt(request.getParameter("idEstudiante"));
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");
        String saldoStr = request.getParameter("saldo");

        double saldo = 0;
        if ((saldoStr != null) && (!saldoStr.equals(""))) {
            saldo = Double.parseDouble(request.getParameter("saldo"));
        }
        Estudiante estudiante = new Estudiante(idEstudiante, nombre, apellido, email, telefono, saldo);

        int registrosModificados = new EstudianteDaoImpl().actualizar(estudiante);
        listarEstudiantes(request, response);
    }

    private void insertarEstudiante(HttpServletRequest request, HttpServletResponse response) throws IOException {
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

        int registrosInsertados = new EstudianteDaoImpl().insertar(estudiante);

        listarEstudiantes(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        request.setCharacterEncoding("UTF-8");

        String accion = request.getParameter("accion");

        if (accion != null) {

            switch (accion) {
                case "listar":
                    listarEstudiantes(request, response);
                    break;
                case "editar":
                    editarEstudiante(request, response);
                    break;
                case "eliminar":
                    eliminarEstudiante(request, response);
                    break;
            }

        }
    }

    private void editarEstudiante(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int idEstudiante = Integer.parseInt(request.getParameter("idEstudiante"));

        Estudiante estudiante = new EstudianteDaoImpl().encontrar(new Estudiante(idEstudiante));

        request.setAttribute("estudiante", estudiante);
        request.getRequestDispatcher(JSP_EDITAR).forward(request, response);
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

        //List<Estudiante> listaEstudiante = new EstudianteDaoImpl().listar();
        
        List<Estudiante> listaEstudiante = new EstudianteDaoJPA().listar();

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
