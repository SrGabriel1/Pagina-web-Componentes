<%-- 
    Document   : tienda
    Created on : 30 nov 2024, 2:43:01 p.m.
    Author     : Gabriel
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="controlador.ControladorProducto" %>
<%@ page import="Modelo.Producto" %>

<%
    // Obtener la sesión
    HttpSession objSesion = request.getSession(false);
    String usuario = (String) objSesion.getAttribute("usuario");

    // Crear una instancia del controlador
    ControladorProducto controlador = new ControladorProducto();

    // Llamar al método para obtener los productos (por defecto todos)
    String categoria = request.getParameter("categoria");
    String productosHTML = "";

    if (categoria != null && !categoria.isEmpty()) {
        // Si hay una categoría seleccionada, obtener productos por esa categoría
        productosHTML = controlador.getProductosCategoria(categoria);
    } else {
        // Si no hay categoría, obtener todos los productos
        productosHTML = controlador.getProductos();
    }
%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>GamePlaza - Tienda</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="css/templatemo-style.css">
        <link rel="stylesheet" href="css/nivo-lightbox.css">
        <link rel="stylesheet" href="css/nivo_themes/default/default.css">
    </head>

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
                    <li><a href="tienda.jsp" class="active"><i class="fa-solid fa-store"></i> Tienda</a></li>
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

    <!-- Tienda - Productos -->
    <div id="portfolio">
        <div class="container">
            <div class="row">
                <div class="col-md-offset-2 col-md-8 col-sm-12">
                    <h2>Nuestros Productos</h2>
                    <p>En la tienda se encuentran juegos, consolas, figuras y más.</p>
                </div>
            </div>

            <!-- Submenú -->
            <div class="row text-center">
                <button class="btn btn-primary filter-btn" onclick="window.location.href = 'tienda.jsp?categoria='">Todos</button>
                <button class="btn btn-primary filter-btn" onclick="window.location.href = 'tienda.jsp?categoria=consolas'">Consolas</button>
                <button class="btn btn-primary filter-btn" onclick="window.location.href = 'tienda.jsp?categoria=juegos'">Juegos</button>
                <button class="btn btn-primary filter-btn" onclick="window.location.href = 'tienda.jsp?categoria=accesorios'">Accesorios y figuras</button>
            </div>

            <!-- Productos dinámicos cargados desde el controlador -->
            <div class="row mt30">
                <%= productosHTML%> <!-- Aquí se muestran los productos generados dinámicamente -->
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-6">
                    <p>Nosotros:</p>
                    <ul class="footer-links">
                        <li><a href="acerca.jsp" class="fa-solid fa-users"></a></li>
                        <li><a href="contacto.jsp" class="fa-solid fa-phone"></a></li>
                    </ul>
                </div>

                <div class="col-md-6 col-sm-6">
                    <p>Visítanos:</p>
                    <ul class="social-icons">
                        <li><a href="https://www.facebook.com/gamesplazaobregon/?locale=es_LA" class="fa-brands fa-facebook"></a></li>
                        <li><a href="https://www.instagram.com/gamesplaza/" class="fa-brands fa-instagram"></a></li>
                        <li><a href="https://www.tiktok.com/@gamesplazamx" class="fa-brands fa-tiktok"></a></li>
                    </ul>
                </div>
            </div>
        </div>

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
                       <form action="Carrito" method="POST" onClick="">
                        <!-- Campo oculto para el nombre del producto -->
                        <input type="hidden" id="productName" name="productoNombre">

                        <% if (usuario != null && !usuario.isEmpty()) { %>
                        <!-- Mostrar botón "Añadir al carrito" si el usuario está autenticado -->
                        <button id="botonCarrito" class="btn btn-primary">Añadir al carrito</button>
                        <% }%>
                    </form>

                </div>
            </div>
        </div>
    </div>
    <script>

        // Función para abrir el modal y cargar los detalles del producto
        function openProductModal(name, description, price, stock, imageUrl) {
            console.log("openProductModal invoked", name, description, price, stock, imageUrl); // Agrega esto para depuración
            // Asignar la información al modal
            document.getElementById('modalName').innerText = name;
            document.getElementById('modalDescription').innerText = description;
            document.getElementById('modalPrice').innerText = "$" + price;
            document.getElementById('modalStock').innerText = stock;
            document.getElementById('modalImage').src = imageUrl;
            // Asignar solo el nombre del producto al campo oculto
            document.getElementById('productName').value = name;  // Nombre del producto
        }
    </script>
  
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

</div>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/modal.js"></script>
</body>
</html>
