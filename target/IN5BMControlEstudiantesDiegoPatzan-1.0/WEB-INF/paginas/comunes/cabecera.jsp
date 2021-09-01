<header id="kinal-header">
    <h1>Centro Educativo y Técnico Laboral Fundación Kinal</h1>
</header>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
                <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/index.jsp">Inicio</a>
                <a class="nav-link" href="${pageContext.request.contextPath}/ServletEstudianteController?accion=listar">Estudiante</a>
                <a class="nav-link" href="#">Materia</a>
                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Inscripciones</a>
            </div>
        </div>
    </div>
</nav>
