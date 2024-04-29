USE ejemplo_clase;

-- usando una tabla que copie de otra BBDD, en este caso sera la tabla "products"
-- renombrada como "productos".(recuerden que podemos EXPORTAR e IMPORTAR tablas).


-- -- /* SELECCIONANDO LA TABLA Y VIENDO SUS COLUMNAS */ -- --

-- SELECCIONANDO TODAS LAS COLUMNAS
SELECT * FROM productos;

-- SELECCIONANDO UNA O MAS COLUMNAS
SELECT product_line, product_vendor FROM productos; -- el orden de llamada SI IMPORTA

-- -- /* SELECCIONANDO LA TABLA Y VIENDO SUS COLUMNAS UTILIZANDO FILTROS */ -- --
                     -- -- /* ----USO DEL WHERE------ */ -- --

-- UTILIZANDO EL WHERE SIMPLEMENTE
SELECT * FROM productos
WHERE product_vendor = Classic Metal Creations; -- demostrar el uso de las comillas para strings

-- UTILIZANDO EL WHERE CON CONDICIONES VARIAS
-- USO DEL AND
SELECT * FROM productos
WHERE product_vendor = "Classic Metal Creations" AND buy_price > 50; -- AND es inclusivo

-- USO DEL OR
SELECT * FROM productos
WHERE product_vendor = "Classic Metal Creations" OR buy_price > 50; -- OR es exclusivo

-- USO DEL NOT
SELECT * FROM productos
WHERE NOT product_vendor = "Classic Metal Creations" AND buy_price > 45; -- NOT niega lo que sigue despues.

-- OPERADORES DE COMPARACION
-- 1) IGUAL QUE.... =
-- 2) MAYOR QUE ... >
-- 3) MENOR QUE.. <
-- 4) MAYOR E IGUAL QUE ... >=
-- 5) MENOR E IGUAL QUE ... <==
-- 6) DISTINTO DE .... <>

-- USANDO EJEMPLO DE DISTINTO DE (<>)
SELECT * FROM productos
WHERE product_line <> "Planes";

-- QUE PASA SI QUISIERAMOS "NEGAR" VARIAS COLUMNAS? PODRIAMOS CONCATENARLO CON "AND"...POR EJEMPLO
SELECT * FROM productos
WHERE product_line <> "Planes"
AND product_line <> "Classic Cars"
AND product_line <> "Vintage Cars";

-- SIN EMBARGO, HAY UNA FORMA MAS FACIL DE HACER ESTO....
-- USANDO EL "NOT IN" Y PASANDOLE UNA LISTA DE ELEMENTOS QUE QUIERO EVALUAR.
SELECT * FROM productos
WHERE product_line NOT IN ('Planes', 'Classic Cars', 'Vintage Cars'); -- USANDO UNA LISTA PARA FILTRAR.

-- EL USO DEL "IN" HARIA LO CONTRARIO...VEAMOSLO
SELECT * FROM productos
WHERE product_line IN ('Planes', 'Classic Cars', 'Vintage Cars'); -- USANDO UNA LISTA PARA FILTRAR.


-- USANDO EL "IS NULL" Y "NOT NULL" SOBRE VALORES DE UNA COLUMNA
SELECT * FROM productos
WHERE product_scale IS NOT NULL; -- TRAE LOS NO NULOS

SELECT * FROM productos
WHERE product_scale IS NULL; -- TRAE LOS NULOS


              -- -- /* ----USO DEL ORDER BY------ */ -- --
              
SELECT * FROM productos
ORDER BY product_line; -- POR DEFECTO ESTA COMO "ASC"

-- USANDO "ASC" Y "DESC" PARA ORDENAR ASCENDENTE Y DESCENDENTE
-- USANDO ASC
SELECT * FROM productos
ORDER BY product_line ASC;

-- USANDO DESC
SELECT * FROM productos
ORDER BY product_line DESC;  -- SE INVIERTE EL ORDEN

               -- -- /* ----USO DEL DISTINCT----- */ -- --

SELECT DISTINCT product_line FROM productos; -- CONSULTA DE UNA SOLA COLUMNA

SELECT DISTINCT product_line, product_vendor FROM productos; -- CONSULTA DE VARIAS COLUMNA


                -- -- /* ----USO DEL LIMIT Y OFFSET----- */ -- --
-- USANDO SOLAMENTE EL LIMIT
SELECT * FROM productos
WHERE product_line = "Planes"
LIMIT 5;

-- USANDO SOLAMENTE EL LIMIT Y EL OFFSET
SELECT * FROM productos
WHERE product_line = "Planes"
LIMIT 5
OFFSET 3;

			-- -- /* ----USO DEL BEETWEN----- */ -- --

SELECT product_name, product_vendor,buy_price FROM productos   -- sacar columna y demostrar que funciona
WHERE buy_price BETWEEN 25 AND 30;  

-- SERA IGUAL QUE USAR EL WHERE Y EL AND JUNTOS? VEAMOSLO!
SELECT product_name, product_vendor,buy_price FROM productos  
WHERE buy_price > 25 AND  buy_price  < 30;  

			-- -- /* ----USO DEL AS COMO ALIAS----- */ -- --
-- PARA UNA O MAS COLUMNAS
SELECT product_line AS "linea de produto" FROM productos; -- una columna

SELECT product_line AS "linea de produto", product_name AS "nombre de producto" FROM productos; -- una columna

-- PARA LAS TABLAS
SELECT * FROM productos AS elementos;

SELECT * FROM elementos; -- demostrar error 


-- CALCULOS

SELECT product_name, (quantity_in_stock*buy_price) AS Valor_total_almacen
FROM productos   
ORDER BY Valor_total_almacen 
LIMIT 10;

-- -- /* ----ORDEN DE EJECUCION DE LAS CONSULTAS----- */ -- --
FROM
JOIN
WHERE
GROUP BY
HAVING
SELECT
DISTINCT
ORDER BY
OFFSET
LIMIT
