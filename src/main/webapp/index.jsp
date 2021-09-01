<%-- 
    Document   : index
    Created on : Aug 25, 2021, 9:27:30 AM
    Author     : George <george.jlpc@gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://fonts.googleapis.com/css2?family=Sofia&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./assets/css/bootstrap.css">
        <link href="assets/css/style.css" rel="stylesheet">
        <title>Fundación Kinal</title>
    </head>
    <body>
        <!-- Cabecera -->
        <jsp:include page="./WEB-INF/paginas/comunes/cabecera.jsp"/>

        <main>
            <section id="contenido">
                <p class="descripcion">Kinal es un Centro Educativo privado, no lucrativo, dirigido a la formación técnica profesional de jóvenes y adultos, de beneficio colectivo y asistencia social en favor de los sectores más necesitados de la comunidad.</p>
                <br>
                <img  id="kinal-img-principal" src="./assets/images/principal.png"> 
                <br>
                <p class="descripcion">Nuestro valor fundamental es enseñar a realizar el trabajo bien hecho, que sea la base de la superación de alumnos y el medio para servir a los demás.</p>

                <br>
                <br>


            </section>
        </main>
        <!-- pie de pagina -->
        <jsp:include page="./WEB-INF/paginas/comunes/pie-pagina.jsp"/>
        
        <!-- javascript -->
        <script src="assets/js/jquery-3.6.0.js"></script>
        <script src="assets/js/bootstrap.bundle.js"></script>
    </body>
</html>
