<%-- 
    Document   : tienda
    Created on : 30 nov 2024, 2:43:01 p.m.
    Author     : Gabriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>GamePlaza</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- stylesheet css -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="css/nivo-lightbox.css">
        <link rel="stylesheet" href="css/templatemo-style.css">
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
                    <a href="index.jsp" class="navbar-brand"><img src="images/logo.jpg" class="img-responsive" alt="logo"
                                                                  style="width: 60px; height: auto;"></a>
                    <p style="position:relative;top:-20px;left: 100px;font-size: large;">GAMESPLAZA</p>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right"> 
                        <li><a href="index.jsp"><i class="fa-solid fa-house"></i> Tienda</a></li>
                        <li><a href="tienda.jsp" class="active"><i class="fa-solid fa-store"></i> Inicio</a></li>
                        <li><a href="carrito.jsp"><i class="fa-solid fa-cart-shopping"></i> Carrito</a></li>
                        <li><a href="inicioSesion.jsp"><i class="fa-solid fa-user"></i> Iniciar Sesión</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- portfolio section -->
        <div id="portfolio">
            <div class="container">
                <div class="row">
                    <div class="col-md-offset-2 col-md-8 col-sm-12">
                        <h2>Nuestros Productos</h2>
                        <p>En la tienda se encuentra juegos, consolas, figuras y más.</p>
                    </div>
                </div>

                <!-- Submenú -->
                <div class="row text-center">
                    <button class="btn btn-primary filter-btn" data-category="todos">Todos</button>
                    <button class="btn btn-primary filter-btn" data-category="consolas">Consolas</button>
                    <button class="btn btn-primary filter-btn" data-category="juegos">Juegos</button>
                    <button class="btn btn-primary filter-btn" data-category="figuras">Figuras</button>
                </div>

                <div class="row mt30">
                    <!-- Producto 1: Juegos -->
                    <div class="col-md-3 col-sm-4 col-xs-6 mb-4 product" data-category="juegos">
                        <a href="#" class="product-link" data-name="Combo juegos" data-description="Paquete de juegos clásicos para consolas retro." data-stock="20" data-price="$50 USD">
                            <img src="images/portfolio-img1.jpg" alt="Combo juegos" class="img-fluid" style="object-fit: cover; height: 200px; width: 100%;">
                        </a>
                        <p class="text-center">$50 USD</p>
                    </div>

                    <!-- Producto 2: Figuras -->
                    <div class="col-md-3 col-sm-4 col-xs-6 mb-4 product" data-category="figuras">
                        <a href="#" class="product-link" data-name="Figuras de Ultra Street Fighter 2" data-description="Colección de figuras inspiradas en Ultra Street Fighter 2." data-stock="10" data-price="$25 USD">
                            <img src="images/portfolio-img2.jpg" alt="Figuras de Ultra Street Fighter 2" class="img-fluid" style="object-fit: cover; height: 200px; width: 100%;">
                        </a>
                        <p class="text-center">$25 USD</p>
                    </div>

                    <!-- Producto 3: Accesorios -->
                    <div class="col-md-3 col-sm-4 col-xs-6 mb-4 product" data-category="accesorios">
                        <a href="#" class="product-link" data-name="Control PS4 con sticks anti-drift" data-description="Control inalámbrico para PS4 con tecnología anti-drift." data-stock="15" data-price="$40 USD">
                            <img src="images/portfolio-img3.jpg" alt="Control con sticks anti drift PS4" class="img-fluid" style="object-fit: cover; height: 200px; width: 100%;">
                        </a>
                        <p class="text-center">$40 USD</p>
                    </div>

                    <!-- Producto 4: Figuras -->
                    <div class="col-md-3 col-sm-4 col-xs-6 mb-4 product" data-category="figuras">
                        <a href="#" class="product-link" data-name="The Simpsons Figuras" data-description="Figuras coleccionables de los personajes de Los Simpsons." data-stock="12" data-price="$30 USD">
                            <img src="images/portfolio-img5.jpg" alt="The Simpsons figuras" class="img-fluid" style="object-fit: cover; height: 200px; width: 100%;">
                        </a>
                        <p class="text-center">$30 USD</p>
                    </div>

                    <!-- Producto 5: Figuras -->
                    <div class="col-md-3 col-sm-4 col-xs-6 mb-4 product" data-category="figuras">
                        <a href="#" class="product-link" data-name="Figura de Zelda" data-description="Figura coleccionable de Zelda en alta calidad." data-stock="8" data-price="$35 USD">
                            <img src="images/portfolio-img9.jpg" alt="Figura de Zelda" class="img-fluid" style="object-fit: cover; height: 200px; width: 100%;">
                        </a>
                        <p class="text-center">$35 USD</p>
                    </div>

                    <!-- Producto 6: Consolas -->
                    <div class="col-md-3 col-sm-4 col-xs-6 mb-4 product" data-category="consolas">
                        <a href="#" class="product-link" data-name="Consola GameCube" data-description="Consola GameCube en perfecto estado." data-stock="5" data-price="$60 USD">
                            <img src="images/portfolio-img6.jpg" alt="Consola GameCube" class="img-fluid" style="object-fit: cover; height: 200px; width: 100%;">
                        </a>
                        <p class="text-center">$60 USD</p>
                    </div>

                    <!-- Producto 7: Figuras -->
                    <div class="col-md-3 col-sm-4 col-xs-6 mb-4 product" data-category="figuras">
                        <a href="#" class="product-link" data-name="Figura de Minecraft" data-description="Figura coleccionable de un personaje de Minecraft." data-stock="18" data-price="$20 USD">
                            <img src="images/portfolio-img8.jpg" alt="Figura de Minecraft" class="img-fluid" style="object-fit: cover; height: 200px; width: 100%;">
                        </a>
                        <p class="text-center">$20 USD</p>
                    </div>

                    <!-- Producto 8: Figuras -->
                    <div class="col-md-3 col-sm-4 col-xs-6 mb-4 product" data-category="figuras">
                        <a href="#" class="product-link" data-name="Fortnite Figuras" data-description="Figuras inspiradas en los personajes de Fortnite." data-stock="10" data-price="$30 USD">
                            <img src="images/portfolio-img11.jpg" alt="Fortnite figuras" class="img-fluid" style="object-fit: cover; height: 200px; width: 100%;">
                        </a>
                        <p class="text-center">$30 USD</p>
                    </div>
                </div>
            </div>
        </div>

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
        <!-- Modal -->
        <div id="productModal" class="modal ">
            <div class="modal-content">
                <!-- Botón cerrar -->
                <span class="close-button">&times;</span>
                <div class="modal-body">
                    <!-- Imagen del producto -->
                    <div class="modal-image">
                        <img id="modalImage" src="" alt="Producto" style="width: 100%; height: auto;">
                    </div>
                    <!-- Información del producto -->
                    <div class="modal-info">
                        <h3 id="modalName"></h3>
                        <p id="modalDescription"></p>
                        <p><strong>Precio:</strong> <span id="modalPrice"></span></p>
                        <p><strong>Stock:</strong> <span id="modalStock"></span></p>
                        <button id="addToCartButton">Añadir al carrito</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- javascript js -->
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/modal.js"></script> <!-- Asegúrate de que esta ruta sea correcta -->

    </body>

</html>
