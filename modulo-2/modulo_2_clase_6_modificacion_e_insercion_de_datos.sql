CREATE SCHEMA ejemplo_clase;

USE ejemplo_clase;

-- creando mi tabla de ejemplo

CREATE TABLE IF NOT EXISTS nueva_tabla (
    id INT AUTO_INCREMENT,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    edad INT,
    email VARCHAR(100),
	PRIMARY KEY (id)
);


-- -- -- -- /* RENOMBRADO TABLAS  */-- -- -- --

RENAME TABLE nueva_tabla TO ejemplo_tabla;

-- CASO MULTIPLES TABLAS
-- RENAME TABLE tabla1 TO nueva_tabla1, tabla2 TO nueva_tabla2, tabla3 TO nueva_tabla3;

-- -- -- -- /* HACER CAMBIOS EN COLUMNAS  */-- -- -- -- 

-- AGREGANDO COLUMNAS
ALTER TABLE ejemplo_tabla 
ADD COLUMN telefono VARCHAR(15);


-- ELIMINANDO COLUMNAS
ALTER TABLE ejemplo_tabla 
DROP COLUMN TeleFONO;  -- ESTO FUNCIONARA???


-- MODIFICANDO TABLAS
ALTER TABLE ejemplo_tabla 
MODIFY COLUMN edad INT UNSIGNED;


-- RENOMBRANDO COLUMNAS
ALTER TABLE ejemplo_tabla 
RENAME COLUMN nombre TO primer_nombre;


-- RENOMBRANDO....PERO CON CHANGE! QUE ME DEJA CAMBIAR EL TIPO DE DATO!
ALTER TABLE ejemplo_tabla 
CHANGE apellido apellido_usuario VARCHAR(50);

-- -- -- -- /* ELIMINANDO TABLAS */-- -- -- -- 

-- ELIMINANDO VARIAS TABLAS
DROP TABLE IF EXISTS tabla1, tabla2, tabla3; -- IF EXISTS PARA QUE?


-- -- -- -- /* INSERTANDO DATOS!! */-- -- -- -- 

INSERT INTO ejemplo_tabla (primer_nombre, apellido_usuario, edad)
VALUES ('pepe', 'García', 25),
       ('Pedro', 'Martínez', 35),
       ('Ana', 'López', 28);

-- CASO DE PK INCREMENTAL

INSERT INTO ejemplo_tabla (id, primer_nombre, apellido_usuario)
VALUES (1001, 'Juan', 'Pérez'); -- TOMARA EL 1001 Y CONTINUA DESDE AHI CON EL VALOR MAXIMO

INSERT INTO ejemplo_tabla (primer_nombre, apellido_usuario)
VALUES ('Juan', 'Pérez');

-- INGRESANDO VALORES EN TODAS LAS COLUMNAS

INSERT INTO ejemplo_tabla
VALUES(25,'Nacho','lara ceballos',52,'nacho@gmail.com');


-- -- -- -- /* ACTUALIZANDO DATOS!! */-- -- -- --

UPDATE ejemplo_tabla
SET primer_nombre = 'Pedro', email = 'pgarcia@example.com'
WHERE id = 1; -- SUPER IMPORTANTE EL WHERE!!!! USAR UNA CONDICION DE ACTUALIZACION

UPDATE ejemplo_tabla
SET apellido_usuario = 'lara ceballos';

UPDATE ejemplo_tabla
SET apellido_usuario = 'jamon'
WHERE id > 100; 


-- -- -- -- /* ELIMINANDO DATOS */-- -- -- --

DELETE FROM ejemplo_tabla
WHERE edad >= 30;

CREATE TABLE IF NOT EXISTS customers_mod 
SELECT * 
FROM ejemplo_tabla;
