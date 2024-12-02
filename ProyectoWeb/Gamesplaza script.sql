CREATE DATABASE IF NOT EXISTS gamesplaza;

USE gamesplaza;

-- Crear la tabla de usuarios
CREATE TABLE IF NOT EXISTS usuario (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,  -- ID único para cada usuario
    nombre VARCHAR(255) NOT NULL,       -- Nombre del usuario
    contrasena VARCHAR(255) NOT NULL  -- Contraseña del usuario
);
