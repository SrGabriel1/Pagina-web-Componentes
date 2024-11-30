<%-- 
    Document   : index
    Created on : 30 nov 2024, 2:45:28 p.m.
    Author     : Gabriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
				<a href="#" class="navbar-brand"><img src="images/logo.jpg" class="img-responsive" alt="logo"
						style="width: 60px; height: auto;"></a>
						<p style="position:relative;top:-20px;left: 100px;font-size: large;">GAMESPLAZA</p>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="index.jsp" class="active">Inicio</a></li>
					<li><a href="acerca.jsp">Sobre Nosotros</a></li>
					<li><a href="tienda.jsp">Tienda</a></li>
					<li><a href="contacto.jsp">Contacto</a></li>
				</ul>
			</div>
		</div>
	</div>

	<!-- home section -->
	<div id="home">
		<div class="container">
			<div class="row">
				<div class="col-md-5 col-sm-3"></div>
				<div class="col-md-7 col-sm-9">
				</div>
			</div>
		</div>
	</div>

	<!-- divider section -->
	<div class="divider">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-sm-6">
					<div class="divider-wrapper divider-one">
						<i class="fa fa-gamepad"></i>
						<h2>Venta VideoJuegos</h2>
						<p>Encuentra los últimos títulos para todas las consolas. Contamos con un amplio catálogo de
							juegos nuevos y seminuevos al gusto del cliente.</p>
					</div>
				</div>
				<div class="col-md-4 col-sm-6">
					<div class="divider-wrapper divider-two">
						<i class="fa fa-laptop"></i>
						<h2>Reparacion de electronicos</h2>
						<p>Servicio técnico especializado en consola al igual que en sus perifericos, tambien se cuenta
							con el "Desbloqueo de consola" para jugar mas juegos . </p>
					</div>
				</div>
				<div class="col-md-4 col-sm-12">
					<div class="divider-wrapper divider-three">
						<i class="fa fa-usd"></i>
						<h2>Venta de Consolas</h2>
						<p>Se encuentran varias consolas de las principales marcas como Xbox, PlayStation, Nintendo y
							más.
							Consolas nuevas o ya semiusadas ademas de consolas "Desbloqueadas".</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- about section -->
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
					<a href="about.html" class="btn btn-default">Mas informacion</a>
				</div>
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
        <div class="row mt30">

            <!-- Producto 1 -->
            <div class="col-md-3 col-sm-4 col-xs-6 mb-4">
                <a href="images/portfolio-img1.jpg" data-lightbox-gallery="portfolio-gallery">
                    <img src="images/portfolio-img1.jpg" alt="Romancing Saga 2" class="img-fluid" style="object-fit: cover; height: 200px; width: 100%;">
                </a>
            </div>

            <!-- Producto 2 -->
            <div class="col-md-3 col-sm-4 col-xs-6 mb-4">
                <a href="images/portfolio-img2.jpg" data-lightbox-gallery="portfolio-gallery">
                    <img src="images/portfolio-img2.jpg" alt="Figuras de Ultra Street Fighter 2" class="img-fluid" style="object-fit: cover; height: 200px; width: 100%;">
                </a>
            </div>

            <!-- Producto 3 -->
            <div class="col-md-3 col-sm-4 col-xs-6 mb-4">
                <a href="images/portfolio-img3.jpg" data-lightbox-gallery="portfolio-gallery">
                    <img src="images/portfolio-img3.jpg" alt="Control con sticks anti drift PS4" class="img-fluid" style="object-fit: cover; height: 200px; width: 100%;">
                </a>
            </div>

            <!-- Producto 4 -->
            <div class="col-md-3 col-sm-4 col-xs-6 mb-4">
                <a href="images/portfolio-img5.jpg" data-lightbox-gallery="portfolio-gallery">
                    <img src="images/portfolio-img5.jpg" alt="The Simpsons figuras" class="img-fluid" style="object-fit: cover; height: 200px; width: 100%;">
                </a>
            </div>

            <!-- Producto 5 -->
            <div class="col-md-3 col-sm-4 col-xs-6 mb-4">
                <a href="images/portfolio-img9.jpg" data-lightbox-gallery="portfolio-gallery">
                    <img src="images/portfolio-img9.jpg" alt="Imagen adicional 3" class="img-fluid" style="object-fit: cover; height: 200px; width: 100%;">
                </a>
            </div>

            <!-- Producto 6 -->
            <div class="col-md-3 col-sm-4 col-xs-6 mb-4">
                <a href="images/portfolio-img6.jpg" data-lightbox-gallery="portfolio-gallery">
                    <img src="images/portfolio-img6.jpg" alt="Consola GameCube" class="img-fluid" style="object-fit: cover; height: 200px; width: 100%;">
                </a>
            </div>

            <!-- Producto 7 -->
            <div class="col-md-3 col-sm-4 col-xs-6 mb-4">
                <a href="images/portfolio-img8.jpg" data-lightbox-gallery="portfolio-gallery">
                    <img src="images/portfolio-img8.jpg" alt="Imagen adicional 2" class="img-fluid" style="object-fit: cover; height: 200px; width: 100%;">
                </a>
            </div>

            <!-- Producto 8 -->
            <div class="col-md-3 col-sm-4 col-xs-6 mb-4">
                <a href="images/portfolio-img11.jpg" data-lightbox-gallery="portfolio-gallery">
                    <img src="images/portfolio-img11.jpg" alt="Fortnite figuras" class="img-fluid" style="object-fit: cover; height: 200px; width: 100%;">
                </a>
            </div>
        </div>
    </div>
	</div>

	<!-- footer section -->
	<footer>
		<!-- copyright section -->
		<div class="copyright">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<p>Copyright © 2024 GamesPlaza</p>
					</div>
					<div class="col-md-6 col-sm-6">
						<ul class="social-icons">
							<li><a href="https://www.facebook.com/gamesplazaobregon/?locale=es_LA" class="fa-brands fa-facebook"></a></li>    
							<li><a href="https://www.instagram.com/gamesplaza/" class="fa-brands fa-instagram"></a></li>    
							<li><a href="https://www.tiktok.com/@gamesplazamx" class="fa-brands fa-tiktok"></a></li>        
						</ul>
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