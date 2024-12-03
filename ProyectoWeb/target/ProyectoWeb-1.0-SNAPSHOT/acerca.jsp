<%-- 
    Document   : acerca
    Created on : 30 nov 2024, 2:48:34 p.m.
    Author     : Gabriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession objSesion = request.getSession(false);
    String usuario = (String) objSesion.getAttribute("usuario");
%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>GamePlaza</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- 
        OneTel Template
        http://www.templatemo.com/tm-468-onetel
        -->
        <!-- stylesheet css -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="css/nivo-lightbox.css">
        <link rel="stylesheet" href="css/nivo_themes/default/default.css">
        <link rel="stylesheet" href="css/templatemo-style.css">
        <!-- google web font css -->
        <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>

    </head>

    <body>

        <!-- navigation -->
        <div class="container">
            <div class="navbar navbar-default navbar-static-top" role="navigation">
                <div class="navbar-header">
                    <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon icon-bar"></span>
                        <span class="icon icon-bar"></span>
                        <span class="icon icon-bar"></span>
                    </button>
                    <a href="index.jsp" class="navbar-brand">
                        <img src="images/logo.jpg" class="img-responsive" alt="logo" style="width: 60px; height: auto;">
                    </a>
                    <p style="position:relative;top:-20px;left: 100px;font-size: large;">GAMESPLAZA</p>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                         <li><a href="index.jsp"><i class="fa-solid fa-house"></i> Inicio</a></li>
                        <li><a href="tienda.jsp"><i class="fa-solid fa-store"></i> Tienda</a></li>
                            <%
                                if (usuario == null || usuario.isEmpty()) {
                            %>
                        <li><a href="inicioSesion.jsp"><i class="fa-solid fa-user"></i> Iniciar Sesión</a></li>
                            <%
                            } else {
                            %>
                        <li><a href="Carrito"><i class="fa-solid fa-cart-shopping"></i> Carrito</a></li>
                        <li><a href="CerrarSesion"><i class="fa-solid fa-user"></i> Cerrar Sesión</a></li>
                            <%
                                }
                            %>
                    </ul>
                </div>
            </div>
        </div>


        <!-- about header section -->
        <div id="about">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-sm-12">
                        <img src="images/about-img.jpg" class="img-responsive" alt="about img">
                    </div>
                    <div class="col-md-6 col-sm-12 about-des">
                        <h2>Que somos?</h2>
                        <p>Somos una tienda que se encarga de distribuir juegos fisicos para los aficionados al mundo de los
                            videojuegos al igual que si quieres comenzar tambien tenemos consolas donde jugar los juegos que
                            tengas o figuras para coleccionar, tambien se cuenta con servicios de reparacion </p>

                    </div>
                </div>
            </div>
        </div>

        <!-- team section -->
        <div id="team">
            <div class="container">
                <div class="row">
                    <div class="col-md-offset-2 col-md-8 col-sm-12">
                        <h2>Horarios</h2>
                        <p>Conoce nuestro horario para saber a qué hora y qué días puedes visitarnos.</p>
                    </div>
                </div>

                <div class="row mt30">
                    <div class="col-md-4 col-sm-4 col-xs-9">
                        <div class="team-wrapper">
                            <h3>Lunes</h3>
                            <h4>10 a.m. – 7:30 p.m.</h4>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-9">
                        <div class="team-wrapper">
                            <h3>Martes</h3>
                            <h4>10 a.m. – 7:30 p.m.</h4>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-9">
                        <div class="team-wrapper">
                            <h3>Miércoles</h3>
                            <h4>10 a.m. – 7:30 p.m.</h4>
                        </div>
                    </div>
                </div>

                <div class="row mt30">
                    <div class="col-md-4 col-sm-4 col-xs-9">
                        <div class="team-wrapper">
                            <h3>Jueves</h3>
                            <h4>10 a.m. – 7:30 p.m.</h4>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-9">
                        <div class="team-wrapper">
                            <h3>Viernes</h3>
                            <h4>10 a.m. – 7:30 p.m.</h4>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-9">
                        <div class="team-wrapper">
                            <h3>Sábado</h3>
                            <h4>10 a.m. – 7:30 p.m.</h4>
                        </div>
                    </div>
                </div>

                <div class="row mt30">
                    <div class="col-md-4 col-sm-4 col-xs-9">
                        <div class="team-wrapper">
                            <h3>Domingo</h3>
                            <h4>Cerrado</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="ubicacion">
            <div class="container">
                <div class="row">
                    <div class="col-md-offset-2 col-md-8 col-sm-12">
                        <h2 style="text-align: center;">¿Dónde nos ubicamos?</h2>
                        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d14156.583502564472!2d-109.9343273!3d27.4958384!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x86c815ec2fefbe8d%3A0x13184f15cf86f324!2sGames%20Plaza!5e0!3m2!1ses-419!2smx!4v1730789692462!5m2!1ses-419!2smx" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                </div>

            </div>
        </div>

        <!-- footer section -->
        <footer>
            <div class="container">
                <div class="row">

                    <!-- Sección de texto "Nosotros" y "Contacto" -->
                    <div class="col-md-6 col-sm-6">
                        <p>Nosotros:</p>
                        <ul class="footer-links">
                            <li><a href="acerca.jsp" class="fa-solid fa-users"></a></li>
                            <li><a href="contacto.jsp" class="fa-solid fa-phone"></a></li>
                        </ul>
                    </div>

                    <!-- Sección de redes sociales -->
                    <div class="col-md-6 col-sm-6">
                        <p>Visítanos:</p> <!-- Texto encima de las redes -->
                        <ul class="social-icons">
                            <li><a href="https://www.facebook.com/gamesplazaobregon/?locale=es_LA" class="fa-brands fa-facebook"></a></li>    
                            <li><a href="https://www.instagram.com/gamesplaza/" class="fa-brands fa-instagram"></a></li>    
                            <li><a href="https://www.tiktok.com/@gamesplazamx" class="fa-brands fa-tiktok"></a></li>        
                        </ul>
                    </div>

                </div>
            </div>

            <!-- Sección de Copyright -->
            <div class="copyright">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <p>Copyright © 2024 GamesPlaza</p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>

        <!-- javascript js -->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/nivo-lightbox.min.js"></script>
        <script src="js/custom.js"></script>

    </body>

</html>