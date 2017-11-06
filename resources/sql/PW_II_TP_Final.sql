/*
SQLyog Enterprise - MySQL GUI v8.05 
MySQL - 5.5.5-10.1.16-MariaDB : Database - pw_ii_tp_final
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/pw_ii_tp_final /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE pw_ii_tp_final;

SET FOREIGN_KEY_CHECKS=0;

/*Table structure for table cliente */

DROP TABLE IF EXISTS cliente;

CREATE TABLE IF NOT EXISTS cliente (
  ID_Cliente TINYINT(4) NOT NULL,
  PRIMARY KEY (ID_Cliente), 
  CONSTRAINT FK_Cliente_Persona FOREIGN KEY (ID_Cliente) REFERENCES Persona (ID_Persona)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table cliente */

LOCK TABLES cliente WRITE;

UNLOCK TABLES;

/*Table structure for table empleado */

DROP TABLE IF EXISTS empleado;

CREATE TABLE IF NOT EXISTS empleado (
  ID_Empleado TINYINT(4) NOT NULL,
  ID_Usuario TINYINT(4) NOT NULL,
  PRIMARY KEY (ID_Empleado), 
  CONSTRAINT FK_Empleado_Persona FOREIGN KEY (ID_Empleado) REFERENCES Persona (ID_Persona)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table empleado */

LOCK TABLES empleado WRITE;

INSERT  INTO empleado(ID_Empleado,ID_Usuario) VALUES (1,1);

UNLOCK TABLES;

/*Table structure for table permiso */

DROP TABLE IF EXISTS permiso;

CREATE TABLE IF NOT EXISTS permiso (
  ID_Rol TINYINT(4) NOT NULL,
  ID_Recurso TINYINT(4) NOT NULL,
  PRIMARY KEY (ID_Rol,ID_Recurso), 
  CONSTRAINT FK_Permiso_Rol FOREIGN KEY (ID_Rol) REFERENCES Rol (ID_Rol), 
  CONSTRAINT FK_Permiso_Recurso FOREIGN KEY (ID_Recurso) REFERENCES Recurso (ID_Recurso)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table permiso */

LOCK TABLES permiso WRITE;

UNLOCK TABLES;

/*Table structure for table persona */

DROP TABLE IF EXISTS persona;

CREATE TABLE IF NOT EXISTS persona (
  ID_Persona TINYINT(4) NOT NULL AUTO_INCREMENT,
  ID_Tipo_Persona TINYINT(4) NOT NULL,
  ID_Tipo_Documento TINYINT(4) NOT NULL,
  Num_Doc BIGINT(20) NOT NULL,
  Apellido VARCHAR(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  Nombre_RS VARCHAR(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  Direccion VARCHAR(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  Telefono VARCHAR(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  Mail VARCHAR(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (ID_Persona),
  UNIQUE KEY Tipo_Doc (ID_Tipo_Documento,Num_Doc), 
  CONSTRAINT FK_Persona_Tipo_Documento FOREIGN KEY (ID_Tipo_Documento) REFERENCES Tipo_Documento (ID_Tipo_Documento)
) ENGINE=INNODB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table persona */

LOCK TABLES persona WRITE;

INSERT  INTO persona(ID_Persona,ID_Tipo_Persona,ID_Tipo_Documento,Num_Doc,Apellido,Nombre_RS,Direccion,Telefono,Mail) VALUES (1,1,1,26421299,'Caruso','Mariano',NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table persona_tipo */

DROP TABLE IF EXISTS persona_tipo;

CREATE TABLE IF NOT EXISTS persona_tipo (
  ID_Tipo_Persona TINYINT(4) NOT NULL AUTO_INCREMENT,
  Tipo_Persona VARCHAR(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (ID_Tipo_Persona)
) ENGINE=INNODB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table persona_tipo */

LOCK TABLES persona_tipo WRITE;

INSERT  INTO persona_tipo(ID_Tipo_Persona,Tipo_Persona) VALUES (1,'Empleado'),(2,'Cliente'),(3,'Taller_Mecanico');

UNLOCK TABLES;

/*Table structure for table recurso */

DROP TABLE IF EXISTS recurso;

CREATE TABLE IF NOT EXISTS recurso (
  ID_Recurso TINYINT(4) NOT NULL AUTO_INCREMENT,
  Recurso VARCHAR(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (ID_Recurso),
  UNIQUE KEY Recurso (Recurso)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table recurso */

LOCK TABLES recurso WRITE;

UNLOCK TABLES;

/*Table structure for table rol */

DROP TABLE IF EXISTS rol;

CREATE TABLE IF NOT EXISTS rol (
  ID_Rol TINYINT(4) NOT NULL AUTO_INCREMENT,
  Rol VARCHAR(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (ID_Rol)
) ENGINE=INNODB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table rol */

LOCK TABLES rol WRITE;

INSERT  INTO rol(ID_Rol,Rol) VALUES (1,'Supervisor'),(2,'Administrativo'),(3,'Chofer'),(4,'Mecanico');

UNLOCK TABLES;

/*Table structure for table service */

DROP TABLE IF EXISTS service;

CREATE TABLE IF NOT EXISTS service (
  ID_Service TINYINT(4) NOT NULL AUTO_INCREMENT,
  ID_Tipo_Service TINYINT(4) NOT NULL,
  ID_Vehiculo TINYINT(4) NOT NULL,
  ID_Taller TINYINT(4) NOT NULL,
  Fecha_Est_Realizacion DATETIME DEFAULT NULL,
  Fecha_Realizado DATETIME DEFAULT NULL,
  Costo FLOAT DEFAULT NULL,
  Trabajo_Realizado TEXT COLLATE utf8_unicode_ci,
  PRIMARY KEY (ID_Service), 
  CONSTRAINT FK_Service_Service_Tipo FOREIGN KEY (ID_Tipo_Service) REFERENCES Service_Tipo (ID_Tipo_Service), 
  CONSTRAINT FK_Service_Vehiculo FOREIGN KEY (ID_Vehiculo) REFERENCES Vehiculo (ID_Vehiculo), 
  CONSTRAINT FK_Service_Taller FOREIGN KEY (ID_Taller) REFERENCES Taller (ID_Taller)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table service */

LOCK TABLES service WRITE;

UNLOCK TABLES;

/*Table structure for table service_tipo */

DROP TABLE IF EXISTS service_tipo;

CREATE TABLE IF NOT EXISTS service_tipo (
  ID_Tipo_Service TINYINT(4) NOT NULL AUTO_INCREMENT,
  Service VARCHAR(30) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (ID_Tipo_Service)
) ENGINE=INNODB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table service_tipo */

LOCK TABLES service_tipo WRITE;

INSERT  INTO service_tipo(ID_Tipo_Service,Service) VALUES (1,'Mantenimiento Programado'),(2,'Eventual'),(3,'Incidente en Viaje');

UNLOCK TABLES;

/*Table structure for table taller */

DROP TABLE IF EXISTS taller;

CREATE TABLE IF NOT EXISTS taller (
  ID_Taller TINYINT(4) NOT NULL,
  Taller VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (ID_Taller)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table taller */

LOCK TABLES taller WRITE;

UNLOCK TABLES;

/*Table structure for table tipo_documento */

DROP TABLE IF EXISTS tipo_documento;

CREATE TABLE IF NOT EXISTS tipo_documento (
  ID_Tipo_Documento TINYINT(4) NOT NULL AUTO_INCREMENT,
  Tipo_Documento VARCHAR(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (ID_Tipo_Documento)
) ENGINE=INNODB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table tipo_documento */

LOCK TABLES tipo_documento WRITE;

INSERT  INTO tipo_documento(ID_Tipo_Documento,Tipo_Documento) VALUES (1,'DNI'),(2,'CDI'),(3,'Pasaporte'),(4,'CUIT');

UNLOCK TABLES;

/*Table structure for table usuario */

DROP TABLE IF EXISTS usuario;

CREATE TABLE IF NOT EXISTS usuario (
  ID_Usuario TINYINT(4) NOT NULL AUTO_INCREMENT,
  Usuario VARCHAR(10) COLLATE utf8_unicode_ci NOT NULL,
  PassWord VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
  ID_Rol TINYINT(4) NOT NULL,
  PRIMARY KEY (ID_Usuario), 
  CONSTRAINT FK_Usuario_Rol FOREIGN KEY (ID_Rol) REFERENCES Rol (ID_Rol)
) ENGINE=INNODB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table usuario */

LOCK TABLES usuario WRITE;

INSERT  INTO usuario(ID_Usuario,Usuario,PassWord,ID_Rol) VALUES (1,'MCaru','99c2846145e3282a319bdff4f6e0612d',1);

UNLOCK TABLES;

/*Table structure for table vehiculo */

DROP TABLE IF EXISTS vehiculo;

CREATE TABLE IF NOT EXISTS vehiculo (
  ID_Vehiculo TINYINT(4) NOT NULL AUTO_INCREMENT,
  ID_Tipo_Vehiculo TINYINT(4) NOT NULL,
  Marca VARCHAR(10) COLLATE utf8_unicode_ci NOT NULL,
  Modelo VARCHAR(20) COLLATE utf8_unicode_ci NOT NULL,
  Patente VARCHAR(10) COLLATE utf8_unicode_ci NOT NULL,
  Anio TINYINT(4) NOT NULL,
  Kilometraje INT(11) NOT NULL,
  Tara INT(11) NOT NULL,
  Capacidad_Maxima INT(11) NOT NULL,
  PRIMARY KEY (ID_Vehiculo), 
  CONSTRAINT FK_Vehiculo_Vehiculo_Tipo FOREIGN KEY (ID_Tipo_Vehiculo) REFERENCES Vehiculo_Tipo (ID_Tipo_Vehiculo)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table vehiculo */

LOCK TABLES vehiculo WRITE;

UNLOCK TABLES;

/*Table structure for table viaje */

DROP TABLE IF EXISTS viaje;

CREATE TABLE IF NOT EXISTS viaje (
  ID_Viaje INT(11) NOT NULL AUTO_INCREMENT,
  ID_Cliente TINYINT(4) NOT NULL,
  ID_Estado_Viaje TINYINT(4) NOT NULL,
  Tipo_Carga TEXT COLLATE utf8_unicode_ci NOT NULL,
  Fecha_Alta DATETIME NOT NULL,
  Costo FLOAT NOT NULL,
  Fecha_Est_Partida DATETIME NOT NULL,
  Fecha_Est_Llegada DATETIME NOT NULL,
  Fecha_Real_Partida DATETIME DEFAULT NULL,
  Fecha_Real_Llegada DATETIME DEFAULT NULL,
  Direccion_Origen VARCHAR(100) COLLATE utf8_unicode_ci NOT NULL,
  Direccion_Destino VARCHAR(100) COLLATE utf8_unicode_ci NOT NULL,
  Kilometraje_Est FLOAT NOT NULL,
  Kilometraje_Real FLOAT DEFAULT NULL,
  Desviacion_KM FLOAT DEFAULT NULL,
  Duracion_Est INT(11) NOT NULL,
  Duracion_Real INT(11) DEFAULT NULL,
  Desviacion_Duracion INT(11) DEFAULT NULL,
  Combustible_Req_Est FLOAT NOT NULL,
  Conbustible_Req_Real FLOAT DEFAULT NULL,
  Desviacion_Combustible FLOAT DEFAULT NULL,
  Vehiculo_KM_Inicial FLOAT DEFAULT NULL,
  Vehiculo_KM_Final FLOAT DEFAULT NULL,
  PRIMARY KEY (ID_Viaje),
  KEY ID_Cliente (ID_Cliente), 
  CONSTRAINT FK_Viaje_Cliente FOREIGN KEY (ID_Cliente) REFERENCES Cliente (ID_Cliente), 
  CONSTRAINT FK_Viaje_Viaje_Estado FOREIGN KEY (ID_Estado_Viaje) REFERENCES Viaje_Estado (ID_Estado_Viaje)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table viaje */

LOCK TABLES viaje WRITE;

UNLOCK TABLES;

/*Table structure for table viaje_chofer */

DROP TABLE IF EXISTS viaje_chofer;

CREATE TABLE IF NOT EXISTS viaje_chofer (
  ID_Viaje INT(11) NOT NULL,
  ID_Chofer TINYINT(4) NOT NULL,
  PRIMARY KEY (ID_Viaje,ID_Chofer), 
  CONSTRAINT FK_Viaje_Chofer_Viaje FOREIGN KEY (ID_Viaje) REFERENCES Viaje (ID_Viaje), 
  CONSTRAINT FK_Viaje_Chofer_Chofer FOREIGN KEY (ID_Chofer) REFERENCES Chofer (ID_Chofer)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table viaje_chofer */

LOCK TABLES viaje_chofer WRITE;

UNLOCK TABLES;

/*Table structure for table viaje_estado */

DROP TABLE IF EXISTS viaje_estado;

CREATE TABLE IF NOT EXISTS viaje_estado (
  ID_Estado_Viaje TINYINT(4) NOT NULL AUTO_INCREMENT,
  Estado_Viaje VARCHAR(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (ID_Estado_Viaje)
) ENGINE=INNODB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table viaje_estado */

LOCK TABLES viaje_estado WRITE;

INSERT  INTO viaje_estado(ID_Estado_Viaje,Estado_Viaje) VALUES (1,'Presupuestado'),(2,'Aceptado'),(3,'En Itinerancia'),(4,'En Contingencia'),(5,'Finalizado'),(6,'Cancelado'),(7,'Rechazado');

UNLOCK TABLES;

/*Table structure for table viaje_tracking */

DROP TABLE IF EXISTS viaje_tracking;

CREATE TABLE IF NOT EXISTS viaje_tracking (
  ID_Viaje INT(11) NOT NULL,
  ID_Estado_Viaje TINYINT(4) NOT NULL,
  Fecha_Estado DATETIME NOT NULL,
  Ubicacion VARCHAR(50) COLLATE utf8_unicode_ci NOT NULL,
  Kilometraje FLOAT NOT NULL,
  Litros FLOAT DEFAULT NULL,
  Importe FLOAT DEFAULT NULL,
  Observaciones TEXT COLLATE utf8_unicode_ci,
  PRIMARY KEY (ID_Viaje,ID_Estado_Viaje,Fecha_Estado), 
  CONSTRAINT FK_Viaje_Tracking_Viaje FOREIGN KEY (ID_Viaje) REFERENCES Viaje (ID_Viaje), 
  CONSTRAINT FK_Viaje_Tracking_Viaje_Estado FOREIGN KEY (ID_Estado_Viaje) REFERENCES Viaje_Estado (ID_Estado_Viaje)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table viaje_tracking */

LOCK TABLES viaje_tracking WRITE;

UNLOCK TABLES;

/*Table structure for table viaje_vehiculo */

DROP TABLE IF EXISTS viaje_vehiculo;

CREATE TABLE IF NOT EXISTS viaje_vehiculo (
  ID_Viaje INT(11) NOT NULL,
  ID_Vehiculo TINYINT(4) NOT NULL,
  PRIMARY KEY (ID_Viaje,ID_Vehiculo), 
  CONSTRAINT FK_Viaje_Vehiculo_Viaje FOREIGN KEY (ID_Viaje) REFERENCES Viaje (ID_Viaje), 
  CONSTRAINT FK_Viaje_Vehiculo_Vehiculo FOREIGN KEY (ID_Vehiculo) REFERENCES Vehiculo (ID_Vehiculo)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table viaje_vehiculo */

LOCK TABLES viaje_vehiculo WRITE;

UNLOCK TABLES;

SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
