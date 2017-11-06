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