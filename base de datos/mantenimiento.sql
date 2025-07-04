-- Tabla: Usuarios 
CREATE TABLE Usuario (
    Id_Usuario INT AUTO_INCREMENT PRIMARY KEY,
    Usu_Nombre VARCHAR(100) NOT NULL,
    Usu_Cargo VARCHAR(50)
);

-- Tabla: Área o Servicio 
CREATE TABLE Area_Servicio (
    Id_Area INT AUTO_INCREMENT PRIMARY KEY,
    Nombre_Area VARCHAR(100) NOT NULL
);

-- Tabla: Equipos
CREATE TABLE Equipo (
    Id_Equipo INT AUTO_INCREMENT PRIMARY KEY,
    Equ_Placa_Serie VARCHAR(100) NOT NULL,
    Equ_Ubicacion VARCHAR(100),
    Id_Area INT,
    FOREIGN KEY (Id_Area) REFERENCES Area_Servicio(Id_Area)
);

-- Tabla: Chequeos
CREATE TABLE Chequeo (
    Id_Chequeo INT AUTO_INCREMENT PRIMARY KEY,
    Id_Usuario INT,
    Id_Equipo INT,
    Che_Fecha_Chequeo DATE NOT NULL,
    Che_Observaciones TEXT,
    FOREIGN KEY (Id_Usuario) REFERENCES Usuario(Id_Usuario),
    FOREIGN KEY (Id_Equipo) REFERENCES Equipo(Id_Equipo)
);

-- Tabla: Software
CREATE TABLE Software (
    Id_Software INT AUTO_INCREMENT PRIMARY KEY,
    Soft_Nombre VARCHAR(100) NOT NULL,
    Soft_Tipo VARCHAR(50)
);

-- Tabla Intermedia:Relación N:N entre Equipo y Software
CREATE TABLE Equipo_Software (
    Id_Equipo INT,
    Id_Software INT,
    PRIMARY KEY (Id_Equipo, Id_Software),
    FOREIGN KEY (Id_Equipo) REFERENCES Equipo(Id_Equipo),
    FOREIGN KEY (Id_Software) REFERENCES Software(id_Software)
);

-- Tabla: Especificaciones técnicas del equipo
CREATE TABLE Especificaciones_Equipo (
    Id_Especificacion INT AUTO_INCREMENT PRIMARY KEY,
    Id_Equipo INT UNIQUE,
    Esp_Procesador VARCHAR(100),
    Esp_Disco_Duro VARCHAR(100),
    Esp_Tipo_Disco VARCHAR(10),
    Esp_Sistema_Operativo VARCHAR(100),
    Esp_Version_SO VARCHAR(50),
    Esp_Licencia_SO VARCHAR(50),
    Esp_Memoria_RAM VARCHAR(50),
    Esp_Tarjeta_Video VARCHAR(100),
    Esp_Conectividad_Red VARCHAR(50),
    Esp_Estado_Bateria VARCHAR(50),
    Esp_Puertos_Disponibles TEXT,
    FOREIGN KEY (Id_Equipo) REFERENCES Equipo(Id_Equipo)
);
