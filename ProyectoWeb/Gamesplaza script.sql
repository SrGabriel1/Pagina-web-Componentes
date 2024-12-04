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

CREATE TABLE IF NOT EXISTS carrito (
    idCarrito INT AUTO_INCREMENT PRIMARY KEY,   -- ID único del carrito
    id_usuario INT NOT NULL,             -- Relación con el usuario
    FOREIGN KEY (id_usuario) REFERENCES usuario(idUsuario) -- Relación con la tabla usuarios
);

-- Crear la tabla de productos en el carrito
CREATE TABLE IF NOT EXISTS carrito_productos (
    idCarritoProductos INT AUTO_INCREMENT PRIMARY KEY,   -- ID único de la relación
    id_carrito INT NOT NULL,              -- Relación con el carrito
    id_producto INT NOT NULL,             -- Relación con el producto
    cantidad INT NOT NULL,                -- Cantidad del producto en el carrito
    FOREIGN KEY (id_carrito) REFERENCES carrito(idCarrito),   -- Relación con el carrito
    FOREIGN KEY (id_producto) REFERENCES producto(idProducto) 
);

DELIMITER $$

CREATE TRIGGER after_user_insert
AFTER INSERT ON usuario
FOR EACH ROW
BEGIN
    INSERT INTO carrito (id_usuario) VALUES (NEW.idUsuario);
END $$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE obtener_todos_los_productos()
BEGIN
    SELECT * FROM producto;
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE obtener_productos_por_categoria(IN categoria_param VARCHAR(100))
BEGIN
    SELECT * FROM producto
    WHERE categoria = categoria_param;
END $$

DELIMITER 
DELIMITER $$

DELIMITER $$

CREATE PROCEDURE obtener_productos_carrito_usuario(IN nombre_usuario VARCHAR(255))
BEGIN
    -- Declarar una variable para el ID del usuario
    DECLARE id_usuario INT;

    -- Obtener el id_usuario de la tabla usuario con el nombre proporcionado
    SELECT idUsuario INTO id_usuario
    FROM usuario
    WHERE nombre = nombre_usuario
    LIMIT 1;

    -- Verificar si el id_usuario fue encontrado
    IF id_usuario IS NOT NULL THEN
        -- Obtener productos en el carrito del usuario con idCarritoProductos
        SELECT 
            p.idProducto, 
            p.precio, 
            cp.cantidad, 
            cp.idCarritoProductos
        FROM carrito c
        JOIN carrito_productos cp ON c.idCarrito = cp.id_carrito
        JOIN producto p ON cp.id_producto = p.idProducto
        WHERE c.id_usuario = id_usuario;
    ELSE
        -- Si el usuario no existe, devolver un conjunto vacío
        SELECT NULL AS idProducto, NULL AS precio, NULL AS cantidad, NULL AS idCarritoProductos;
    END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE agregarProductoAlCarrito(
    IN p_idProducto INT,
    IN p_usuario VARCHAR(255)
)
BEGIN
    DECLARE v_idCarrito INT;
    DECLARE v_existeProducto INT;

    -- Obtener el id del carrito del usuario
    SELECT idCarrito INTO v_idCarrito
    FROM carrito
    WHERE id_usuario = (SELECT idUsuario FROM usuario WHERE nombre = p_usuario LIMIT 1);

    -- Si el carrito no existe, lo creamos
    IF v_idCarrito IS NULL THEN
        INSERT INTO carrito (id_usuario)
        VALUES ((SELECT idUsuario FROM usuario WHERE nombre = p_usuario LIMIT 1));
        SET v_idCarrito = LAST_INSERT_ID();
    END IF;

    -- Verificar si el producto ya existe en el carrito
    SELECT COUNT(*) INTO v_existeProducto
    FROM carrito_productos
    WHERE id_carrito = v_idCarrito AND id_producto = p_idProducto;

    -- Si el producto ya existe en el carrito, aumentamos la cantidad
    IF v_existeProducto > 0 THEN
        UPDATE carrito_productos
        SET cantidad = cantidad + 1
        WHERE id_carrito = v_idCarrito AND id_producto = p_idProducto;
    ELSE
        -- Si no existe el producto, lo insertamos con cantidad 1
        INSERT INTO carrito_productos (id_carrito, id_producto, cantidad)
        VALUES (v_idCarrito, p_idProducto, 1);
    END IF;
END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE eliminarProductoDelCarrito(
    IN p_idProducto INT,
    IN p_usuario VARCHAR(255)
)
BEGIN
    DECLARE v_idCarrito INT;
    DECLARE v_existeProducto INT;
    
    -- Obtener el id del carrito del usuario
    SELECT idCarrito INTO v_idCarrito
    FROM carrito
    WHERE id_usuario = (SELECT idUsuario FROM usuario WHERE nombre = p_usuario)
    LIMIT 1;
    
    -- Verificar si el producto existe en el carrito
    SELECT COUNT(*) INTO v_existeProducto
    FROM carrito_productos
    WHERE id_carrito = v_idCarrito AND id_producto = p_idProducto;
    
    -- Si el producto existe en el carrito, lo eliminamos
    IF v_existeProducto > 0 THEN
        DELETE FROM carrito_productos
        WHERE id_carrito = v_idCarrito AND id_producto = p_idProducto;
    ELSE
        -- Si el producto no está en el carrito, podemos lanzar un mensaje de error o simplemente no hacer nada
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El producto no está en el carrito.';
    END IF;
END $$

DELIMITER ;




-- insertar juegos
insert into producto (nombre, descripcion, precio, stock, categoria, imagen)
values
('Bloodborne', 'Juego de acción y aventura en un mundo oscuro y misterioso', 490.00, 10, 'Juegos', 'images/Categorias/Juegos/bloodborne.jpg'),
('Capcom Fighter', 'Juego de lucha con los mejores personajes de Capcom', 990.00, 20, 'Juegos', 'images/Categorias/Juegos/capcomfighter.jpg'),
('DB Sparking', 'Juego de lucha que te lleva al mundo de Dragon Ball', 1390.00, 15, 'Juegos', 'images/Categorias/Juegos/dbSparking.jpg'),
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
('GameCube', 'Consola retro de Nintendo, conocida por sus juegos icónicos y diseño compacto', 2499.00, 15, 'Consolas', 'images/Categorias/Consolas/gamecube.jpg'),
('DSi', 'Consola  portatil Dsi de Nintendo, conocida por sus juegos y lo compacta que es', 3100.00, 10, 'Consolas', 'images/Categorias/Consolas/dsi.png'),
('DSLite', 'Consola  portatil DsLite  de Nintendo, conocida por sus juegos y mas barata que la Dsi', 2500.00, 5, 'Consolas', 'images/Categorias/Consolas/dsLite.png'),
('Switch Oled', 'Consola  portatil   de Nintendo, conocida por sus nuevos graficos y los juegos inovadores que tiene', 5500.00, 5, 'Consolas', 'images/Categorias/Consolas/SwitchOled.png'),
('PlayStation 5', 'Consola de sony, consola que es de la nueva generacion de consolas por la potencia', 7400.00, 5, 'Consolas', 'images/Categorias/Consolas/play5.png');

-- insert accesorios
insert into producto (nombre, descripcion, precio, stock, categoria, imagen)
values
('Control PS5 Antidrift', 'Control inalámbrico para PS5 con tecnología antidrift para una experiencia de juego más precisa', 590.00, 25, 'Accesorios', 'images/Categorias/Accesorios/controlps5antidrift.jpg'),
('Figuras Simpson', 'Set de figuras coleccionables de los personajes de Los Simpson, ideal para los fanáticos de la serie', 350.00, 30, 'Accesorios', 'images/Categorias/Accesorios/figurasSimpson.jpg'),
('Figuras Street Fighters', 'Set de figuras coleccionables de los personajes de Street Fighter, para los amantes de este clásico juego de lucha', 490.00, 20, 'Accesorios', 'images/Categorias/Accesorios/figurasStreetFighters.jpg'),
('Figura Steve', 'Figura coleccionable del personaje Steve del juego Minecraft, para los fans del universo Minecraft', 250.00, 15, 'Accesorios', 'images/Categorias/Accesorios/figuraSteve.jpg'),
('Figuras Zelda', 'Set de figuras coleccionables de personajes de The Legend of Zelda, para los amantes de esta franquicia de Nintendo', 400.00, 10, 'Accesorios', 'images/Categorias/Accesorios/figurasZelda.jpg'),
('Figuras Fortnite', 'Set de figuras coleccionables de personajes del juego Fortnite, para los fanáticos del juego de batalla real', 300.00, 18, 'Accesorios', 'images/Categorias/Accesorios/fortniteFiguras.jpg'),
('Amiibo aldeano', 'Amiibo de un aldeano de animal crossing para jugar en el smash bros', 790.00, 18, 'Accesorios', 'images/Categorias/Accesorios/amiibo.png'),
('Hello kitty', 'Muñeco de Hello kitty vestida de Cinnamoroll', 190.00, 10, 'Accesorios', 'images/Categorias/Accesorios/muñeco.png'),
('Hello kitty', 'Muñeco de Hello kitty vestida de una rana', 190.00, 5, 'Accesorios', 'images/Categorias/Accesorios/helloKitty.png'),
('onikuma k18', 'Audifonos para jugar videojuegos', 350.00, 10, 'Accesorios', 'images/Categorias/Accesorios/Audifonos.png'),
('Pochita', 'Pochita del  anime chainsaw man', 330.00, 2, 'Accesorios', 'images/Categorias/Accesorios/pochita.png'),
('Llaveros Pokemon', 'Llaveros Pokemon impresos 3d', 100.00, 12, 'Accesorios', 'images/Categorias/Accesorios/Llaveros.png'),
('MyMelody Gorras', 'Gorras de My Melody, un accesorio de moda para los fans de este personaje', 190.00, 15, 'Accesorios', 'images/Categorias/Accesorios/MymelodiGorras.jpg');