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
        <h1>Listado estudiantes</h1>

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
                            <a class="btn-secondary" href="${pageContext.request.contextPath}/ServletEstudianteController?accion=eliminar&idEstudiante=${estudiante.idEstudiante}">Eliminar</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>

        <div>
            <h3>Total de estudiantes</h3>
            <h4>${totalEstudiantes}</h4>
        </div>

        <div>
            <h3>Saldo total</h3>
            <h4>${saldoTotal}</h4>
        </div>
        <!-- pie de pagina -->
        <jsp:include page="/WEB-INF/paginas/comunes/pie-pagina.jsp"/>

        <!-- javascript -->
        <script src="../assets/js/jquery-3.6.0.js"></script>
        <script src="../assets/js/bootstrap.bundle.js"></script>
    </body>
</html>
