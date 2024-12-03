CREATE DATABASE IF NOT EXISTS gamesplaza;

USE gamesplaza;

-- Crear la tabla de usuarios
CREATE TABLE IF NOT EXISTS usuario (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,  -- ID único para cada usuario
    nombre VARCHAR(255) NOT NULL,       -- Nombre del usuario
    contrasena VARCHAR(255) NOT NULL  -- Contraseña del usuario
);


CREATE TABLE IF NOT EXISTS producto (
    idProducto INT AUTO_INCREMENT PRIMARY KEY,   -- ID único para cada producto
    nombre VARCHAR(255) NOT NULL,  -- Nombre del producto
    descripcion VARCHAR(255) NOT NULL,
    precio FLOAT NOT NULL,        -- Precio del producto (con 2 decimales)
    stock INT NOT NULL,                   -- Cantidad disponible en stock
    categoria VARCHAR(100) NOT NULL,      -- Categoría del producto
    imagen VARCHAR(255) NOT NULL          -- Ruta de la imagen del producto
);

-- insertar juegos
insert into producto (nombre, descripcion, precio, stock, categoria, imagen)
values
('Bloodborne', 'Juego de acción y aventura en un mundo oscuro y misterioso', 490.00, 10, 'Juegos', 'images/Categorias/Juegos/bloodborne.jpg'),
('Capcom Fighter', 'Juego de lucha con los mejores personajes de Capcom', 990.00, 20, 'Juegos', 'images/Categorias/Juegos/capcomfighter.jpg'),
('DB Sparkling', 'Juego de lucha que te lleva al mundo de Dragon Ball', 1390.00, 15, 'Juegos', 'images/Categorias/Juegos/dbSparking.jpg'),
('Death Rising Deluxe Remsater', 'Remake de un clásico juego de acción', 1290.00, 8, 'Juegos', 'images/Categorias/Juegos/DRDR.jpg'),
('Hollow Knight', 'Juego gos', 990.00, 8, 'Juegos', 'images/Categorias/Juegos/hollow.jpg'),
('Luigis Mansion', 'Explora mansiones embrujadas con Luigi en esta aventura', 990, 25, 'Juegos', 'images/Categorias/Juegos/luigisMansion.jpg'),
('Metaphor', 'Juego de rol con un estilo de fantasía épica', 1390.00, 12, 'Juegos', 'images/Categorias/Juegos/metaphor.jpg'),
('MLB 24', 'Juego de béisbol con una jugabilidad realista y actualizada', 990.00, 5, 'Juegos', 'images/Categorias/Juegos/mlb24.jpg'),
('Outer Wilds', 'Juego de exploración espacial con misterios por resolver', 899.99, 18, 'Juegos', 'images/Categorias/Juegos/outerwils.jpg'),
('Pokémon Blanco 2', 'Enfrenta batallas épicas y atrapa todos los Pokémon en un nuevo mundo', 500.00, 20, 'Juegos', 'images/Categorias/Juegos/pokemon.jpg'),
('RDR', 'Juego de acción y aventura en el salvaje oeste', 690.00, 30, 'Juegos', 'images/Categorias/Juegos/RDR.jpg'),
('Silent Hill 2', 'Sobrevive al terror psicológico en la misteriosa ciudad de Silent Hill', 1390.00, 10, 'Juegos', 'images/Categorias/Juegos/SilentHill.jpg'),
('TLOU2', 'Secuela de The Last of Us, un juego de acción y aventura', 900.00, 15, 'Juegos', 'images/Categorias/Juegos/tlou2.jpg'),
('Undisputed', 'Juego de boxeo realista, desafía a los mejores peleadores', 1190.00, 10, 'Juegos', 'images/Categorias/Juegos/undisputed.jpg'),
('Xenoblade', 'RPG de acción con un mundo abierto y exploración profunda', 1190.00, 20, 'Juegos', 'images/Categorias/Juegos/xenoblade.jpg'),
('Zelda', 'Juega como Link en una aventura épica en Hyrule', 1090.00, 15, 'Juegos', 'images/Categorias/Juegos/zelda.jpg');

-- insert consolas
insert into producto (nombre, descripcion, precio, stock, categoria, imagen)
values
('2DS', 'Consola portátil 2DS de Nintendo, ideal para jugar tus títulos favoritos de 3DS', 1999.00, 10, 'Consolas', 'images/Categorias/Consolas/2ds.jpg'),
('GameCube', 'Consola retro de Nintendo, conocida por sus juegos icónicos y diseño compacto', 2499.00, 15, 'Consolas', 'images/Categorias/Consolas/gamecube.jpg');

-- insert accesorios
insert into producto (nombre, descripcion, precio, stock, categoria, imagen)
values
('Control PS5 Antidrift', 'Control inalámbrico para PS5 con tecnología antidrift para una experiencia de juego más precisa', 590.00, 25, 'Accesorios', 'images/Categorias/Accesorios/controlps5antidrift.jpg'),
('Figuras Simpson', 'Set de figuras coleccionables de los personajes de Los Simpson, ideal para los fanáticos de la serie', 350.00, 30, 'Accesorios', 'images/Categorias/Accesorios/figurasSimpson.jpg'),
('Figuras Street Fighters', 'Set de figuras coleccionables de los personajes de Street Fighter, para los amantes de este clásico juego de lucha', 490.00, 20, 'Accesorios', 'images/Categorias/Accesorios/figurasStreetFighters.jpg'),
('Figura Steve', 'Figura coleccionable del personaje Steve del juego Minecraft, para los fans del universo Minecraft', 250.00, 15, 'Accesorios', 'images/Categorias/Accesorios/figuraSteve.jpg'),
('Figuras Zelda', 'Set de figuras coleccionables de personajes de The Legend of Zelda, para los amantes de esta franquicia de Nintendo', 400.00, 10, 'Accesorios', 'images/Categorias/Accesorios/figurasZelda.jpg'),
('Figuras Fortnite', 'Set de figuras coleccionables de personajes del juego Fortnite, para los fanáticos del juego de batalla real', 300.00, 18, 'Accesorios', 'images/Categorias/Accesorios/fortniteFiguras.jpg'),
('MyMelody Gorras', 'Gorras de My Melody, un accesorio de moda para los fans de este personaje', 190.00, 15, 'Accesorios', 'images/Categorias/Accesorios/MymelodiGorras.jpg');