DROP DATABASE IF EXISTS Conquista_Del_Tiempo;
CREATE DATABASE Conquista_Del_Tiempo;
USE Conquista_Del_Tiempo;

-- Tabla Jugadores
CREATE TABLE Jugadores (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL
);

-- Tabla Territorios
CREATE TABLE Territorios (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Numero INT NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Ubicacion VARCHAR(100) NOT NULL
);

-- Tabla CartasAcción
CREATE TABLE Cartas_Accion (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion TEXT NOT NULL
);

-- Tabla CartasJuego
CREATE TABLE Cartas_Juego (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Tipo VARCHAR(50) NOT NULL,
    Daño INT NOT NULL,
    Durabilidad INT NOT NULL
);

-- Tabla Peones
CREATE TABLE Peones (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Tipo VARCHAR(20) NOT NULL,
    Nombre VARCHAR(100) NOT NULL
);
CREATE TABLE Habilidades (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Descripcion VARCHAR(300) NOT NULL
);

-- Tabla Personajes
CREATE TABLE Personajes (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Vida INT NOT NULL,
    Ataque INT NOT NULL,
    Defensa INT NOT NULL,
    Habilidad1 INT NOT NULL,
    Habilidad2 INT NOT NULL,
    Habilidad3 INT NOT NULL,
    FOREIGN KEY (Habilidad1) REFERENCES Habilidades(ID),
    FOREIGN KEY (Habilidad2) REFERENCES Habilidades(ID),
    FOREIGN KEY (Habilidad3) REFERENCES Habilidades(ID),
    Edad VARCHAR(20) NOT NULL
);

-- Tabla Partidas
CREATE TABLE Partidas (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Jugador_ID INT,
    Territorio_ID INT,
    Peon_ID INT,
    CartaAccion_ID INT,
    CartaJuego_ID INT,
    FOREIGN KEY (Jugador_ID) REFERENCES Jugadores(ID),
    FOREIGN KEY (Territorio_ID) REFERENCES Territorios(ID),
    FOREIGN KEY (Peon_ID) REFERENCES Peones(ID),
    FOREIGN KEY (CartaAccion_ID) REFERENCES Cartas_Accion(ID),
    FOREIGN KEY (CartaJuego_ID) REFERENCES Cartas_Juego(ID)
);

-- Tabla Peones_Jugadores
CREATE TABLE Peones_Jugadores (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Jugador_ID INT,
    Peon_ID INT,
    FOREIGN KEY (Jugador_ID) REFERENCES Jugadores(ID),
    FOREIGN KEY (Peon_ID) REFERENCES Peones(ID)
);

-- Tabla Asignacion_Territorios
CREATE TABLE Asignacion_Territorios (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Partida_ID INT,
    Jugador_ID INT,
    Territorio_ID INT,
    FOREIGN KEY (Partida_ID) REFERENCES Partidas(ID),
    FOREIGN KEY (Jugador_ID) REFERENCES Jugadores(ID),
    FOREIGN KEY (Territorio_ID) REFERENCES Territorios(ID)
);