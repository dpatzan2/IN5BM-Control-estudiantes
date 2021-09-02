<%-- 
    Document   : estudiante
    Created on : Aug 25, 2021, 10:44:53 AM
    Author     : George <george.jlpc@gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../assets/css/bootstrap.css">
        <link href="../assets/css/style.css" rel="stylesheet">
        <title>Listado Estudiantes</title>
    </head>
    <body>

        <!-- Cabecera -->
        <jsp:include page="/WEB-INF/paginas/comunes/cabecera.jsp"/>

        <div id="main-header" class="py-2 bg-light text-dark mt-5">
            <div class="container">
                <div class="row">
                    <di class="col-12">
                        <h1>Control de Estudiantes</h1>
                    </di>
                </div>
            </div>
        </div>

        <main>
            <section id = "estudiante">
                <div class="container mt-5">
                    <div class="row">

                        <div class="col-12 col-md-9">

                            <div class="card">
                                <div class="card-header">
                                    <h4>Listado de estudiantes</h4>
                                </div>
                            </div>

                            <table class="table table-striped">
                                <thead class="table-dark">
                                    <tr>
                                        <th>#</th>
                                        <th>Nombre</th>
                                        <th>Saldo</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="estudiante" items="${listadoEstudiante}">
                                        <tr>
                                            <td>${estudiante.idEstudiante}</td>
                                            <td>${estudiante.nombre} ${estudiante.apellido}</td>
                                            <td>${estudiante.saldo}</td>
                                            <td>
                                                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/ServletEstudianteController?accion=eliminar&idEstudiante=${estudiante.idEstudiante}">Eliminar</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                        </div>

                        <div class="col-12 col-md-3">

                            <div class="card text-center bg-danger text-white mb-3">
                                <div class="card-body">
                                    <h3>Saldo total</h3>
                                    <h4>${saldoTotal}</h4>
                                </div>
                            </div>

                            <div class="card text-center bg-warning text-white mb-3">
                                <div class="card-body">
                                    <h3>Total de estudiantes</h3>
                                    <h4>${totalEstudiantes}</h4>
                                </div>
                            </div>

                        </div>

                    </div>
                </div>
            </section>
        </main>


        <div class="col-md-3">
            <label for="validationDefault04" class="form-label">Estudiante</label>
            <select class="form-select" id="validationDefault04" required>
                <c:forEach var="estudiante" items="${listadoEstudiante}">
                    <option>${estudiante.nombre} | ${estudiante.apellido}</option>
                </c:forEach>
            </select>
        </div>


        <!-- pie de pagina -->
        <jsp:include page="/WEB-INF/paginas/comunes/pie-pagina.jsp"/>

        <!-- javascript -->
        <script src="../assets/js/jquery-3.6.0.js"></script>
        <script src="../assets/js/bootstrap.bundle.js"></script>
    </body>
</html>
