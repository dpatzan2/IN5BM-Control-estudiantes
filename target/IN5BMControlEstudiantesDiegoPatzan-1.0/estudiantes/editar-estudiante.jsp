<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="./assets/css/bootstrap.css">
        <link href="./assets/css/style.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/4374a4437c.js" crossorigin="anonymous"></script>
        <title>Editar estudiante</title>
    </head>
    <body>
        <!-- Cabecera -->
        <jsp:include page="/WEB-INF/paginas/comunes/cabecera.jsp"/>

        <form method="POST" action="${pageContext.request.contextPath}/ServletEstudianteController" class="was-validated">
            <!-- Botones de navegación para Editar -->
            <section id="actions" class="py-4 mb-4 bg-ligth">
                <div class="container">
                    <div class="row">

                        <div class="col-md-3">
                            <a href="estudiantes/estudiante.jsp" class="btn btn-ligth btn-block">
                                <i class="fa fa-arrow-left"></i> Regresar al inicio
                            </a>
                        </div>
                        <div class="col-md-3">
                            <button type="submit" class="btn btn-success btn-block">
                                <i class="fas fa-check"></i> Guardar estudiante
                            </button>
                        </div>

                        <div class="col-md-3">
                            <a href="${pageContext.request.contextPath}/ServletEstudianteController?accion=eliminar&idEstudiante=${estudiante.idEstudiante}" class="btn btn-danger btn-block">
                                <i class="fas fa-trash"></i> Eliminar estudiante
                            </a>
                        </div>
                    </div>
                </div>
            </section>
            <section id="details">
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div class="card">
                                <div class="card-header">
                                    <h4>Editar cliente</h4>
                                </div>
                                <div class="mb-3">
                                    <label for="nombre" class="form-label">Nombre</label>
                                    <input type="text" class="form-control" name="nombre" id="nombre" required value="${estudiante.nombre}">
                                </div>
                                <div class="mb-3">
                                    <label for="apellido" class="form-label">Apellido</label>
                                    <input type="text" class="form-control" name="apellido" id="apellido" required value="${estudiante.apellido}">
                                </div>
                                <div class="mb-3">
                                    <label for="email" class="form-label">E-Mail</label>
                                    <input type="email" class="form-control" name="email" id="email" required value="${estudiante.email}">
                                </div>
                                <div class="mb-3">
                                    <label for="telefono" class="form-label">Teléfono</label>
                                    <input type="tel" class="form-control" name="telefono" id="telefono" required value="${estudiante.telefono}">
                                </div>
                                <div class="mb-3">
                                    <label for="saldo" class="form-label">Saldo</label>
                                    <input type="number" class="form-control" name="saldo" id="saldo" step="any" value="${estudiante.saldo}">
                                </div>
                                <input type="hidden" name="idEstudiante" value="${estudiante.idEstudiante}">
                                <input type="hidden" name="accion" value="actualizar">
                                
                                <div class="row">
                                    <div class="col-12 col-md-6">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                    </div>
                                    <div class="col-12 col-md-6">
                                        <button type="submit" class="btn btn-primary">Guardar</button>
                                    </div>
                                </div>
                                
                                
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
            </section>

        </form>


        <!-- pie de pagina -->
        <jsp:include page="/WEB-INF/paginas/comunes/pie-pagina.jsp"/>

        <!-- javascript -->
        <script src="./assets/js/jquery-3.6.0.js"></script>
        <script src="./assets/js/bootstrap.bundle.js"></script>
    </body>
</html>
