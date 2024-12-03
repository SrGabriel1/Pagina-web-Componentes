<%-- 
    Document   : contacto
    Created on : 30 nov 2024, 2:47:36 p.m.
    Author     : Gabriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    HttpSession objSesion = request.getSession(false);
    String usuario = (String) objSesion.getAttribute("usuario");
%>
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
        <link rel="stylesheet" href="css/font-awesome.min.css">
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

        <!-- contact header section -->
        <div id="contact-header">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-sm-12"></div>
                </div>
            </div>
        </div>

        <!-- contact section -->
        <div id="contact">
            <div class="container">
                <div class="row">
                    <div class="col-md-offset-2 col-md-8 col-sm-12">
                        <h2>Contactanos</h2>
                    </div>
                    <div class="col-md-4 col-sm-4 address">
                        <div>
                            <h3>Correo</h3>
                            <p>GamesPlaza@gmail.com</p>
                            <h3>Telefono</h3>
                            <p>644 179 6934 </p>
                        </div>
                    </div>
                    <div class="col-md-8 col-sm-8 mt30">
                        <form action="#" method="post" role="form">
                            <div class="col-md-6 col-sm-6">
                                <label for="name">NAME</label>
                                <input name="name" type="text" class="form-control" id="name">
                                <label for="email">EMAIL</label>
                                <input name="email" type="email" class="form-control" id="email">
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <label for="message">MESSAGE</label>
                                <textarea name="message" rows="6" class="form-control" id="message"></textarea>
                            </div>
                            <div class="col-md-6 col-sm-6">
                                <button type="submit" name="submit" class="btn btn-default">SEND</button>
                            </div>
                        </form>
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