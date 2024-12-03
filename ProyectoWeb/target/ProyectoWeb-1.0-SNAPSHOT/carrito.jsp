<%@page import="java.util.List"%>
<%@page import="Modelo.Producto"%>
<%@page import="Modelo.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession objSesion = request.getSession(false);
    String usuario = (String) objSesion.getAttribute("usuario");
    List<Producto> carrito = (List<Producto>) session.getAttribute("carrito");

%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>GamePlaza</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="keywords" content="">
        <meta name="description" content="">

        <!-- CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/inicioSesion.css">
        <link rel="stylesheet" href="css/templatemo-style.css">
        <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
        <style>
            .table-dark th,
            .table-dark td {
                vertical-align: middle;
            }

            .product-image {
                max-width: 100px;
            }
        </style>
    </head>

    <body>
        <!-- Navigation Bar -->
        <div class="container">
            <div class="navbar navbar-default navbar-static-top" role="navigation">
                <div class="navbar-header">
                    <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon icon-bar"></span>
                        <span class="icon icon-bar"></span>
                        <span class="icon icon-bar"></span>
                    </button>
                    <a href="index.jsp" class="navbar-brand"><img src="images/logo.jpg" class="img-responsive" alt="logo" style="width: 60px; height: auto;"></a>
                    <p style="position:relative;top:-20px;left: 100px;font-size: large;">GAMESPLAZA</p>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="index.jsp"><i class="fa-solid fa-house"></i> Tienda</a></li>
                        <li><a href="tienda.jsp"><i class="fa-solid fa-store"></i> Inicio</a></li>
                            <%                        if (usuario == null || usuario.isEmpty()) {
                            %>
                        <li><a href="inicioSesion.jsp"><i class="fa-solid fa-user"></i> Iniciar Sesión</a></li>
                            <%
                            } else {
                            %>
                        <li><a href="carrito.jsp" class="active"><i class="fa-solid fa-cart-shopping"></i> Carrito</a></li>
                        <li><a href="CerrarSesion"><i class="fa-solid fa-user"></i> Cerrar Sesión</a></li>
                            <%
                                }
                            %>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Carrito -->
        <div class="container my-5">
            <h1 class="mb-4">Carrito de Compras</h1>
            <table class="table table-dark table-bordered text-center align-middle">
                <thead>
                    <tr>
                        <th>Imagen</th>
                        <th>Descripción del producto</th>
                        <th>Cantidad</th>
                        <th>Precio unitario</th>
                        <th>Eliminar</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <img src="https://via.placeholder.com/100" alt="Producto" class="product-image">
                        </td>
                        <td>
                            <p class="mb-1 fw-bold">MONITOR GAMER GIGABYTE G27FC</p>
                            <p class="mb-0">27" / 180HZ / 1080P / 1920x1080</p>
                            <p class="mb-0">VA / 1500R / 1MS / FreeSync Premium</p>
                            <small class="text-muted">Código: mg-g034</small>
                        </td>
                        <td>
                            <form action="actualizarCarrito.jsp" method="post">
                                <input type="number" name="cantidad" class="form-control w-50 mx-auto" min="1" value="1">
                                <button type="submit" class="btn btn-success btn-sm mt-2">Actualizar</button>
                            </form>
                        </td>
                        <td>$3,199.00</td>
                        <td>
                            <button class="btn btn-danger btn-sm">
                                <i class="fa fa-trash"></i> Eliminar
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>

            <!-- Total -->
            <div class="text-end">
                <h3>Total: $3,199.00</h3>
                <button class="btn btn-primary">Proceder a Pagar</button>
            </div>
        </div>

        <!-- Footer -->
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
                        <p>Visítanos:</p>
                        <ul class="social-icons">
                            <li><a href="https://www.facebook.com/gamesplazaobregon/?locale=es_LA" class="fa-brands fa-facebook"></a></li>
                            <li><a href="https://www.instagram.com/gamesplaza/" class="fa-brands fa-instagram"></a></li>
                            <li><a href="https://www.tiktok.com/@gamesplazamx" class="fa-brands fa-tiktok"></a></li>
                        </ul>
                    </div>

                </div>
            </div>

            <!-- Copyright -->
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

        <!-- JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>

</html>
