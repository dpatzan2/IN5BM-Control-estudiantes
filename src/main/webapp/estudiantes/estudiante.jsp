<%-- 
    Document   : estudiante
    Created on : Aug 25, 2021, 10:44:53 AM
    Author     : George <george.jlpc@gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setLocale value="es_GT" />


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../assets/css/bootstrap.css">
        <link href="../assets/css/style.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/4374a4437c.js" crossorigin="anonymous"></script>
        <title>Listado Estudiantes</title>
    </head>
    <body>

        <!-- Cabecera -->
        <jsp:include page="/WEB-INF/paginas/comunes/cabecera.jsp"/>

        <div id="main-header" class="py-2 bg-light text-dark mt-5">
            <div class="container">
                <div class="row">
                    <di class="col-12">
                        <h1><i class="fas fa-user-cog"></i>Control de Estudiantes</h1>
                    </di>
                </div>
            </div>
        </div>

        <main>
            <!-- Boton para agregar -->
            <section id="accions" class="py-4 mb-4">
                <div class="container">
                    <div class="row">
                        <div class="col-12 col-md-3">
                            <a href="#" class="btn btn-primary btn-block " data-bs-toggle="modal" data-bs-target="#addModal">
                                <i class="fas fa-plus"></i>Agregar estudiante
                            </a>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Modal -->
            <div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header bg-primary text-white">
                            <h5 class="modal-title" id="exampleModalLabel">Agregar un nuevo estudiante</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form method="POST" action="${pageContext.request.contextPath}/ServletEstudianteController" class="was-validated">
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="nombre">Nombre</label>
                                    <input type="text" class="form-control" name="nombre" id="nombre">
                                </div>
                                <div class="form-group">
                                    <label for="apellido">Apellido</label>
                                    <input type="text" class="form-control" name="apellido" id="apellido">
                                </div>
                                <div class="form-group">
                                    <label for="email">E-Mail</label>
                                    <input type="email" class="form-control" name="email" id="email">
                                </div>
                                <div class="form-group">
                                    <label for="telefono">Teléfono</label>
                                    <input type="tel" class="form-control" name="telefono" id="telefono">
                                </div>
                                <div class="form-group">
                                    <label for="saldo">Saldo</label>
                                    <input type="number" class="form-control" name="saldo" id="saldo" step="any">
                                </div>
                                <input type="hidden" name="accion" value="insertar">
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                <button type="submit" class="btn btn-primary">Guardar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <section id = "estudiante">
                <div class="container mt-5 pb-5">
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
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="estudiante" items="${listadoEstudiante}">
                                        <tr>
                                            <td>${estudiante.idEstudiante}</td>
                                            <td>${estudiante.nombre} ${estudiante.apellido}</td>
                                            <td><fmt:formatNumber value="${estudiante.saldo}" type="currency"/></td>
                                            <td>
                                                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/ServletEstudianteController?accion=editar&idEstudiante=${estudiante.idEstudiante}">
                                                    <i class="fas fa-edit"></i>Editar  
                                                </a>
                                            </td>
                                            <td>
                                                <a class="btn btn-danger" href="${pageContext.request.contextPath}/ServletEstudianteController?accion=eliminar&idEstudiante=${estudiante.idEstudiante}"><i class="fas fa-trash-alt"></i>
                                                    Eliminar
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>

                        </div>

                        <div class="col-12 col-md-3">

                            <div class="card text-center bg-success text-white mb-3">
                                <div class="card-body">
                                    <h3>Saldo total</h3>
                                    <h4 class="display-4">
                                        <fmt:formatNumber value="${saldoTotal}" type="currency"/>
                                    </h4>
                                </div>
                            </div>

                            <div class="card text-center bg-primary text-white mb-3">
                                <div class="card-body">
                                    <h3>Total de estudiantes</h3>
                                    <h4 class="display-4">
                                        <i class="fa fa-users"></i>${totalEstudiantes}
                                    </h4>
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
