CREATE DATABASE IF NOT EXISTS tp_pw_ii_naumar;

USE tp_pw_ii_naumar;

/*********************************************************/

CREATE TABLE IF NOT EXISTS Roles(
    -- CAMPOS 
    ID_Rol int NOT NULL AUTO_INCREMENT,
    Descripcion varchar(255) NOT NULL,
    -- CLAVES
    PRIMARY KEY (ID_Rol)
);

CREATE TABLE IF NOT EXISTS Documento_Tipos(
    -- CAMPOS
    ID_Documento_Tipo int NOT NULL AUTO_INCREMENT,
    Descripcion varchar(255),
    -- CLAVES
    PRIMARY KEY (ID_Documento_Tipo)
);

CREATE TABLE IF NOT EXISTS Clientes(
    -- CAMPOS
    ID_Cliente int NOT NULL AUTO_INCREMENT,
    Nombre_RS varchar(255) NOT NULL,
    Apellido varchar(50),
    Documento_Tipo_ID int NOT NULL,
    Documento_Numero varchar(50) NOT NULL,
    Direccion varchar(255),
    Telefono varchar(50),
    Email varchar(255),
    -- CLAVES
    PRIMARY KEY (ID_Cliente),
    FOREIGN KEY (Documento_Tipo_ID) REFERENCES Documento_Tipos(ID_Documento_Tipo)
);

CREATE TABLE IF NOT EXISTS Usuarios (
    -- CAMPOS 
    ID_Usuario int NOT NULL AUTO_INCREMENT,
    Email varchar(255) NOT NULL,
    Clave varchar(255) NOT NULL,
    Rol_ID int NOT NULL,
    Nombre varchar(50) NOT NULL,
    Apellido varchar(50) NOT NULL,
    Documento_Tipo_ID int NOT NULL,
    Documento_Numero varchar(50) NOT NULL,
    Direccion varchar(255),
    Telefono varchar(50),
    -- CLAVES
    PRIMARY KEY (ID_Usuario),
    FOREIGN KEY (Rol_ID) REFERENCES Roles(ID_Rol),
    FOREIGN KEY (Documento_Tipo_ID) REFERENCES Documento_Tipos(ID_Documento_Tipo)
);

/*********************************************************/

CREATE TABLE IF NOT EXISTS Vehiculo_Tipos(
    -- CAMPOS
    ID_Vehiculo_Tipo int NOT NULL AUTO_INCREMENT,
    Descripcion varchar(255) NOT NULL,
    -- CLAVES
    PRIMARY KEY (ID_Vehiculo_Tipo)
);

CREATE TABLE IF NOT EXISTS Vehiculo_Estados(
    -- CAMPOS
    ID_Vehiculo_Estado int NOT NULL AUTO_INCREMENT,
    Descripcion varchar(255) NOT NULL,
    -- CLAVES
    PRIMARY KEY (ID_Vehiculo_Estado)
);

CREATE TABLE IF NOT EXISTS Vehiculos(
    -- CAMPOS
    ID_Vehiculo int NOT NULL AUTO_INCREMENT,
    Patente varchar(10),
    Vehiculo_Tipo_ID int NOT NULL,
    Vehiculo_Estado_ID int NOT NULL,
    Marca varchar(50) NOT NULL,
    Modelo varchar(50) NOT NULL,
    Anio int,
    Kilometraje int,
    Tara int,
    Capacidad_Maxima int,
    Fecha_Compra DATETIME,
    -- CLAVES
    PRIMARY KEY (ID_Vehiculo),
    FOREIGN KEY (Vehiculo_Tipo_ID) REFERENCES Vehiculo_Tipos(ID_Vehiculo_Tipo),
    FOREIGN KEY (Vehiculo_Estado_ID) REFERENCES Vehiculo_Estados(ID_Vehiculo_Estado)
);

/*********************************************************/

CREATE TABLE IF NOT EXISTS Repuestos(
    -- CAMPOS
    ID_Repuesto int NOT NULL AUTO_INCREMENT,
    Descripcion varchar(255) NOT NULL,
    Cantidad int NOT NULL,
    Precio int NOT NULL,
    -- CLAVES
    PRIMARY KEY (ID_Repuesto)
);

CREATE TABLE IF NOT EXISTS Mantenimiento_Tipos(
    -- CAMPOS
    ID_Mantenimiento_Tipo int NOT NULL AUTO_INCREMENT,
    Descripcion varchar(255) NOT NULL,
    -- CLAVES
    PRIMARY KEY (ID_Mantenimiento_Tipo)
);

CREATE TABLE IF NOT EXISTS Mantenimientos(
    -- CAMPOS
    ID_Mantenimiento int NOT NULL AUTO_INCREMENT,
    Empleado_ID int NOT NULL,
    Vehiculo_ID int NOT NULL,
    Mantenimiento_Tipo_ID int NOT NULL,
    Fecha_Ingreso DATETIME,
    Fecha_Egreso DATETIME,
    Kms_Vehiculo int,
    Costo int,
    -- CLAVES
    PRIMARY KEY (ID_Mantenimiento),
    FOREIGN KEY (Empleado_ID) REFERENCES Usuarios(ID_Usuario),
    FOREIGN KEY (Vehiculo_ID) REFERENCES Vehiculos(ID_Vehiculo),
    FOREIGN KEY (Mantenimiento_Tipo_ID) REFERENCES Mantenimiento_Tipos(ID_Mantenimiento_Tipo)
);

CREATE TABLE IF NOT EXISTS Mantenimiento_Repuestos(
    -- CAMPOS
    ID_Mantenimiento_Repuesto int NOT NULL AUTO_INCREMENT,
    Mantenimiento_ID int NOT NULL,
    Repuesto_ID int NOT NULL,
    Cantidad int,
    -- CLAVES
    PRIMARY KEY (ID_Mantenimiento_Repuesto),
    FOREIGN KEY (Mantenimiento_ID) REFERENCES Mantenimientos(ID_Mantenimiento),
    FOREIGN KEY (Repuesto_ID) REFERENCES Repuestos(ID_Repuesto)
);

/*********************************************************/

CREATE TABLE IF NOT EXISTS Viaje_Estados(
    -- CAMPOS
    ID_Viaje_Estado int NOT NULL AUTO_INCREMENT,
    Descripcion varchar(255) NOT NULL,
    -- CLAVES
    PRIMARY KEY (ID_Viaje_Estado)
);

CREATE TABLE IF NOT EXISTS Carga_Tipos(
    -- CAMPOS
    ID_Carga_Tipo int NOT NULL AUTO_INCREMENT,
    Descripcion varchar(255) NOT NULL,
    -- CLAVES
    PRIMARY KEY (ID_Carga_Tipo)
);

CREATE TABLE IF NOT EXISTS Viajes(
    -- CAMPOS
    ID_Viaje int NOT NULL AUTO_INCREMENT,
    Cliente_ID int NOT NULL,
    Viaje_Estado_ID int NOT NULL,
    Carga_Tipo_ID int NOT NULL,
    Costo int,
    Fecha_Alta DATETIME,
    Direccion_Origen varchar(255),
    Direccion_Destino  varchar(255),
    Est_Fecha_Partida DATETIME,
    Est_Fecha_Llegada DATETIME,
    Est_Kilometraje int,
    Est_Duracion_Hs int,
    Est_Cantidad_Combustible int,
    Real_Fecha_Partida DATETIME,
    Real_Fecha_Llegada DATETIME,
    Real_Kilometraje int,
    Real_Duracion_Hs int,
    Real_Cantidad_Combustible int,
    Desviacion_Hs int,
    Desviacion_Km int,
    Desviacion_Combustible int,
    -- CLAVES
    PRIMARY KEY (ID_Viaje),
    FOREIGN KEY (Cliente_ID) REFERENCES Clientes(ID_Cliente),
    FOREIGN KEY (Viaje_Estado_ID) REFERENCES Viaje_Estados(ID_Viaje_Estado),
    FOREIGN KEY (Carga_Tipo_ID) REFERENCES Carga_Tipos(ID_Carga_Tipo)
);

CREATE TABLE IF NOT EXISTS Viaje_Choferes(
    -- CAMPOS
    ID_Viaje_Chofer int NOT NULL AUTO_INCREMENT,
    Viaje_ID int NOT NULL,
    Chofer_ID int NOT NULL,
    Fecha_Inicio DATETIME,
    Fecha_Fin DATETIME,
    Observacion varchar(255),
    -- CLAVES
    PRIMARY KEY (ID_Viaje_Chofer),
    FOREIGN KEY (Viaje_ID) REFERENCES Viajes(ID_Viaje),
    FOREIGN KEY (Chofer_ID) REFERENCES Usuarios(ID_Usuario),
    CONSTRAINT UQ_Viaje_Chofer UNIQUE (Viaje_ID, Chofer_ID)
);

CREATE TABLE IF NOT EXISTS Viaje_Vehiculos(
    -- CAMPOS
    ID_Viaje_Vehiculo int NOT NULL AUTO_INCREMENT,
    Viaje_ID int NOT NULL,
    Vehiculo_ID int NOT NULL,
    Vehiculo_Kms_Inicial int,
    Vehiculo_Kms_Final int,
    Fecha_Inicio DATETIME,
    Fecha_Fin DATETIME,
    Observacion varchar(255),
    -- CLAVES
    PRIMARY KEY (ID_Viaje_Vehiculo),
    FOREIGN KEY (Viaje_ID) REFERENCES Viajes(ID_Viaje),
    FOREIGN KEY (Vehiculo_ID) REFERENCES Vehiculos(ID_Vehiculo),
    CONSTRAINT UQ_Viaje_Vehiculo UNIQUE (Viaje_ID, Vehiculo_ID)
);

/*
CREATE TABLE IF NOT EXISTS table(
    -- CAMPOS
    ID_table int NOT NULL AUTO_INCREMENT,
    -- CLAVES
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES table(id)
);
*/