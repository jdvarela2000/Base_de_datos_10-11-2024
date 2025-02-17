-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS grupo41;

-- Seleccionar la base de datos
USE grupo41;

CREATE TABLE IF NOT EXISTS Participante (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Organizacion VARCHAR(100),
    Cargo VARCHAR(50),
    NumeroPasaporte VARCHAR(20),
    FechaNacimiento DATE,
    Nacionalidad VARCHAR(50),
    Direccion VARCHAR(255),
    Ciudad VARCHAR(50),
    Pais VARCHAR(50),
    Telefono VARCHAR(20),
    Fax VARCHAR(20),
    Email VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Hotel (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100),
    TipoHabitacion ENUM('Standard', 'Classic', 'Grand Deluxe'),
    PrecioSingleUSD DECIMAL(10, 2),
    PrecioDobleUSD DECIMAL(10, 2),
    PrecioTwinUSD DECIMAL(10, 2)
);

CREATE TABLE IF NOT EXISTS Reserva (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ID_Participante INT,
    ID_Hotel INT,
    FechaArribo DATE,
    FechaSalida DATE,
    NumeroNoches INT,
    EarlyCheckIn BOOLEAN,
    FOREIGN KEY (ID_Participante) REFERENCES Participante(ID) ON DELETE CASCADE,
    FOREIGN KEY (ID_Hotel) REFERENCES Hotel(ID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Pago (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ID_Reserva INT,
    TipoTarjeta ENUM('AMEX', 'VISA', 'Mastercard', 'Diners'),
    NumeroTarjeta VARCHAR(20),
    FechaVencimiento DATE,
    NombreTitular VARCHAR(100),
    FirmaTitular TEXT,
    FOREIGN KEY (ID_Reserva) REFERENCES Reserva(ID) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS ContactoParaReservas (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ID_Hotel INT,
    NombreContacto VARCHAR(100),
    Cargo VARCHAR(50),
    Telefono VARCHAR(20),
    Fax VARCHAR(20),
    Email VARCHAR(100),
    FOREIGN KEY (ID_Hotel) REFERENCES Hotel(ID) ON DELETE CASCADE
);

