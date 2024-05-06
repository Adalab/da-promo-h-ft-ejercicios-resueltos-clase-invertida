-- Clase 9, modulo 2, JOINS

CREATE SCHEMA JOINS;

USE JOINS;

-- CREANDO LAS TABLAS DE EJEMPLO

CREATE TABLE clientes (
    ID INT,
    Nombre VARCHAR(50),
    Pais VARCHAR(50)
);


CREATE TABLE clientes_nuevo (
    nuevos_ID INT,
    Nombre VARCHAR(50)
);

CREATE TABLE productos (
    ID INT,
    Producto VARCHAR(50),
    Origen VARCHAR(50)
);

CREATE TABLE Ventas (
    ID INT,
    Producto VARCHAR(50),
    vendidos SMALLINT(5)
);

-- INSERTANDO VALORES A ESAS TABLAS DE EJEMPLO
INSERT INTO clientes (ID, Nombre,Pais) VALUES
(1, 'Juan','UK'),
(2, 'María','USA'),
(3, 'Pedro','USA'),
(4, 'Ana','CAN');

INSERT INTO clientes_nuevo (nuevos_ID, Nombre) VALUES
(1, 'Mario'),
(3, 'Nacho'),
(5, 'Agnes'),
(6, 'Thibaut');

INSERT INTO productos (ID, Producto,Origen) VALUES
(1, 'Laptop','USA'),
(4, 'Teléfono','CHN'),
(5, 'Tablet','CHN'),
(7, 'Smartwatch','UK'),
(8, 'PS3','JPN'),
(9, 'Nintendo','JPN');

INSERT INTO Ventas (ID, Producto,vendidos) VALUES
(1, 'Laptop',8),
(2, 'Teléfono',6),
(3, 'Tablet',5),
(4, 'Smartwatch',2),
(5, 'PS3',8),
(6, 'Nintendo',12);

-- -------------------------------------------------------------------------------------------------------

			-- -- /* CROSS JOIN */ -- --
/*
CROSS JOIN en MySQL es un tipo de unión que combina cada fila de la primera tabla con cada fila
 de la segunda tabla, creando un producto cartesiano de ambas tablas. Es decir, cada fila de la 
 primera tabla se combina con todas las filas de la segunda tabla, es decir, crea todas las combinaciones posibles
 de filas entre las tablas involucradas
*/

-- ELIGIENDO NOSOTROS LAS COLUMNAS A COMBINAR

SELECT clientes.Nombre, productos.Producto 
FROM clientes, productos
WHERE clientes.ID = productos.ID; -- RETIRANDO RESULTADOS INDESEADOS, USANDO EL WHERE

-- SI QUEREMOS TODAS LAS COLUMNAS DE AMBAS TABLAS

SELECT * FROM clientes CROSS JOIN productos;



-- -------------------------------------------------------------------------------------------------------

				-- -- /* NATURAL JOIN */ -- --
/*
El NATURAL JOIN es otro tipo de unión en MySQL que combina las filas de dos tablas basándose en 
columnas con el mismo nombre y tipo de datos. Se basa en la igualdad de los nombres de las columnas y esto puede llevar 
a resultados inesperados si los nombres de las columnas no son únicos o si cambian en futuras versiones de las tablas.
*/

-- ELIGIENDO NOSOTROS LAS COLUMNAS A COMBINAR
SELECT clientes.ID, clientes.Nombre, productos.Producto 
FROM clientes, productos
WHERE clientes.ID = productos.ID; -- RETIRANDO RESULTADOS INDESEADOS, USANDO EL WHERE

-- SI QUEREMOS TODAS LAS COLUMNAS DE AMBAS TABLAS
SELECT * FROM clientes NATURAL JOIN productos



-- -------------------------------------------------------------------------------------------------------

					-- -- /* INNER JOIN */ -- --
/*
INNER JOIN es un tipo común de unión en MySQL que combina filas de dos tablas basadas en una condición
 de unión especificada en la cláusula ON. Es decir que nos permite enlazar dos tablas usando columnas que no se llamen igual 
 en ambas tablas a combinar.
*/

-- ELIGIENDO NOSOTROS LAS COLUMNAS A COMBINAR

SELECT clientes_nuevo.Nombre, Ventas.Producto, Ventas.vendidos
FROM clientes_nuevo INNER JOIN Ventas ON clientes_nuevo.nuevos_ID = Ventas.ID;

-- SI QUEREMOS TODAS LAS COLUMNAS DE AMBAS TABLAS
SELECT * FROM clientes_nuevo INNER JOIN ventas ON clientes_nuevo.nuevos_ID = Ventas.ID;

-- UTILIZANDO EL USING
/*
el operador USING en un INNER JOIN es una forma conveniente de unir tablas cuando tienen una o más columnas
 con el mismo nombre en ambas tablas y quieres usar esas columnas para la unión.
*/

-- ELIGIENDO NOSOTROS LAS COLUMNAS A COMBINAR
SELECT clientes.Nombre, Ventas.Producto, Ventas.vendidos
FROM clientes
INNER JOIN Ventas USING(ID);

-- SI QUEREMOS TODAS LAS COLUMNAS DE AMBAS TABLAS
SELECT * FROM clientes INNER JOIN Ventas USING(ID);

/*
el INNER JOIN se realiza utilizando la columna ID en ambas tablas. El operador USING(ID) indica a MySQL 
que debe unir las filas de las tablas clientes y Ventas basándose en la columna ID
*/

-- -------------------------------------------------------------------------------------------------------

					-- -- /* LEFT JOIN */ -- --

/* El LEFT JOIN es una unión en MySQL que devuelve todas las filas de la tabla izquierda y las filas coincidentes de la tabla derecha.

1)	Si no hay coincidencias, devuelve NULL para las columnas de la tabla derecha.
2)	Cuando utilizamos un LEFT JOIN, especificamos una tabla principal (izquierda) y una tabla secundaria (derecha), y la consulta devolverá
 todas las filas de la tabla principal, junto con las filas coincidentes de la tabla secundaria.
*/

-- ELIGIENDO NOSOTROS LAS COLUMNAS A COMBINAR
SELECT clientes.Nombre, productos.Producto
FROM clientes -- ES NUESTRA TABLA DE LA IZQUIERDA
LEFT JOIN productos -- ES NUESTRA TABLA DERECHA
ON clientes.ID = productos.ID;

-- SI QUEREMOS TODAS LAS COLUMNAS DE AMBAS TABLAS
SELECT * FROM clientes
LEFT JOIN productos 
ON clientes.ID = productos.ID;


-- -------------------------------------------------------------------------------------------------------

					-- -- /* RIGHT JOIN */ -- --

/* RIGHT JOIN es similar al LEFT JOIN, pero invierte el orden de las tablas. Mientras que un LEFT JOIN devuelve todas las filas 
de la tabla izquierda (primera tabla en la cláusula FROM) y las filas coincidentes de la tabla derecha (segunda tabla en la cláusula
 LEFT JOIN), un RIGHT JOIN devuelve todas las filas de la tabla derecha y las filas coincidentes de la tabla izquierda.

1)	Si no hay coincidencias, devuelve NULL para las columnas de la tabla izquierda.
2)	Cuando utilizamos un RIGHT JOIN, especificamos una tabla principal (derecha) y una tabla secundaria (izquierda), y la consulta 
devolverá todas las filas de la tabla principal, junto con las filas coincidentes de la tabla secundaria.
*/

-- ELIGIENDO NOSOTROS LAS COLUMNAS A COMBINAR
SELECT clientes.ID, clientes.Nombre, productos.ID,productos.Producto
FROM clientes -- NUESTRA DE LA IZQUIERDA 
RIGHT JOIN productos -- NUESTRA TABLA DE LA DERECHA
ON clientes.ID = productos.ID;


-- SI QUEREMOS TODAS LAS COLUMNAS DE AMBAS TABLAS
SELECT * FROM clientes
RIGHT JOIN productos 
ON clientes.ID = productos.ID;


-- -------------------------------------------------------------------------------------------------------

					-- -- /* FULL JOIN */ -- --

/* El FULL JOIN, también conocido como FULL OUTER JOIN, es un tipo de join que devuelve todas las filas de ambas tablas, uniendo 
las filas donde hay coincidencias en la condición de unión y rellenando con NULL donde no hay coincidencias..

1)	El FULL JOIN devuelve todas las filas de ambas tablas, coincidentes o no. 
2)	Si hay filas en la tabla izquierda que no tienen correspondencia en la tabla derecha, o viceversa, las columnas de la tabla sin 
correspondencia tendrán NULL en el resultado.
*/

-- Utilizando left join para obtener todas las filas de clientes y las coincidencias de clientes_nuevo
SELECT clientes.ID AS ID_clientes, clientes.Nombre AS Nombre_clientes, clientes_nuevo.nuevos_ID AS ID_clientes_nuevo, 
clientes_nuevo.Nombre AS Nombre_clientes_nuevo
FROM clientes
LEFT JOIN clientes_nuevo ON clientes.ID = clientes_nuevo.nuevos_ID

UNION

-- Utilizando right join para obtener todas las filas de clientes_nuevo y las coincidencias de clientes
SELECT clientes.ID AS ID_clientes, clientes.Nombre AS Nombre_clientes, clientes_nuevo.nuevos_ID AS ID_clientes_nuevo, 
clientes_nuevo.Nombre AS Nombre_clientes_nuevo
FROM clientes
RIGHT JOIN clientes_nuevo ON clientes.ID = clientes_nuevo.nuevos_ID;


-- -------------------------------------------------------------------------------------------------------

					-- -- /* SELF JOIN */ -- --

/* SELF JOIN te permite comparar registros dentro de la misma tabla utilizando alias para diferenciar entre las instancias de la tabla
 y estableciendo las condiciones necesarias en la cláusula WHERE. Esto es especialmente útil cuando necesitas analizar relaciones entre 
 datos dentro de una misma entidad.
 
*/

SELECT A.ID AS ID1, A.Producto AS Producto1, A.Origen AS Origen1, B.ID AS ID2, B.Producto AS Producto2, B.Origen AS Origen2
FROM productos AS A, productos AS B
WHERE A.ID <> B.ID
AND A.Origen = B.Origen;

SELECT A.ID AS ID_cliente1, A.Nombre AS Nombre_cliente1, A.Pais AS Pais_cliente1, B.ID AS ID_cliente2, B.Nombre AS Nombre_cliente2, 
B.Pais AS Pais_cliente2
FROM clientes AS A, clientes AS B
WHERE A.ID <> B.ID
AND A.Pais = B.Pais;

