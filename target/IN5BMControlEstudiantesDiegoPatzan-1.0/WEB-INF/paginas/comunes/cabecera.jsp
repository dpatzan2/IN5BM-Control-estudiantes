<header id="kinal-header">
    <h1>Centro Educativo y T�cnico Laboral Fundaci�n Kinal</h1>
</header>

<nav class="navbar navbar-expand-lg navbar-dark bg-black">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">Fundaci�n Kinal</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-center" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/index.jsp">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/ServletEstudianteController?accion=listar">Estudiante</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Materia</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Inscripci�n</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
