/**** INSERTS de USUARIO*****/
insert into roles 
    (Descripcion)
values	
    ('Administrador'),
	('Supervisor'),
    ('Chofer'),
    ('Mecánico')
;

insert into documento_tipos
	(Descripcion)
values
	('DNI'),
	('CUIT'),
	('PASAPORTE'),
	('CDI')
;

insert into usuarios
	(Email, Clave, Rol_ID, Nombre, Apellido, documento_tipo_ID, Documento_Numero)
values
	('admin@naumar.com', MD5('admin604'), 1, 'Administrador', 'Admin', 2, '10-10101010-1')
;

/****** TABLAS de ESTADOS y otras normalizadas ******/

insert into vehiculo_estados
	(Descripcion)
values
	('Activo'),
	('Inactivo - En mantenimiento'),
	('Inactivo - Esperando mantenimiento')
;

insert into vehiculo_tipos
	(Descripcion)
values
	('Vehículo Tractor'),
    ('Acoplado')
;

insert into mantenimiento_tipos
	(Descripcion)
values
	('Revisión anual'),
    ('Revisión 100.000 kms'),
    ('Cambio de aceite'),
    ('Cambio de neumáticos'),
    ('Cambio de batería'),
    ('Amortiguaciones'),
    ('Reparación de aire acondicionado')
;
