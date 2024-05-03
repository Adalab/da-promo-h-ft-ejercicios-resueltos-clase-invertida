-- Clase 8, modulo 2, CONSULTAS AVANZADAS

USE ejemplo_clase;

-- usando una tabla que copie de otra BBDD, en este caso sera la tabla "products"
-- renombrada como "productos".(recuerden que podemos EXPORTAR e IMPORTAR tablas).

-- -- /* USANDO MIN, MAX, SUM, AVG y COUNT */ -- --

/* 
1) MIN y MAX, encontraremos los valores mínimo y máximo en una columna.
2) SUM, obtendrás la suma de valores numéricos. 
3) AVG te permitirá calcular el promedio.
4) COUNT contará el número de registros en un conjunto.
*/

-- USANDO MIN
SELECT MIN(buy_price) FROM productos;

-- EJEMPLO COMBINADO
SELECT product_name, buy_price AS totales FROM productos
WHERE buy_price = (SELECT MIN(buy_price) FROM productos);


-- USAN MAX
SELECT MAX(buy_price) FROM productos;

-- EJEMPLO COMBINADO
SELECT product_name, buy_price AS totales  FROM productos
WHERE buy_price = (SELECT MAX(buy_price) FROM productos);

-- USANDO SUM

SELECT SUM(buy_price) AS totales FROM productos;

-- COMBINADO ---SPOILER ALERT!!!! SE VIENE EL GROUP BY!!!
SELECT product_name, SUM(buy_price) AS totales FROM productos 
GROUP BY product_name;

-- USANDO AVG
SELECT AVG(buy_price) AS promedio FROM productos;

-- USANDO COUNT
SELECT COUNT(product_name) FROM productos
WHERE buy_price > 50;


-- -- /* USANDO EL GROUP BY */ -- --
/*
1)  "GROUP BY" en SQL se usa para agrupar filas que tienen el mismo valor en una columna específica. 
2) Después de agrupar, puedes aplicar funciones de agregación como "SUM", "COUNT" o "AVG" para calcular resúmenes o totales para cada grupo.
3) Por ejemplo, si tienes una tabla de ventas y quieres saber cuánto se vendió de cada producto, puedes usar "GROUP BY" en la columna del producto 
y luego sumar las cantidades vendidas para cada producto.

ESTRUCTUA:

SELECT columna_agrupada, función_agregación(columna_calculo)
FROM tabla
GROUP BY columna_agrupada;

*	columna_agrupada: Es la columna por la cual deseas agrupar tus datos.

*	función_agregación: Es una función de agregación como SUM, AVG, MIN, MAX o COUNT que aplicarás a una columna para obtener un resultado agregado.

*	columna_calculo: Es la columna a la cual aplicarás la función de agregación.
*/

SELECT product_line, COUNT(*) AS total_productos FROM productos
GROUP BY product_line;

-- EJEMPLO CON VENDEDOR
SELECT product_vendor, SUM(buy_price) AS total_compra FROM productos
GROUP BY product_vendor;

-- HAVING 
/*
 "HAVING" se utiliza en combinación con "GROUP BY" para filtrar grupos basados en condiciones de agregación.
 Es el WHERE pero utilizado para el GOUP BY
*/

SELECT product_line, SUM(quantity_in_stock) AS total_stock
FROM productos
GROUP BY product_line
HAVING SUM(quantity_in_stock) > 100;


-- OTRO EJEMPLO
SELECT product_vendor, AVG(buy_price) AS avg_price
FROM productos
GROUP BY product_vendor
HAVING AVG(buy_price) > 50;

-- -- /* USANDO EL CASE */ -- --

/*
1) La expresión CASE permite aplicar lógica condicional dentro de consultas SQL. 
2) Funciona de manera similar a un "if" en Python. 
3) Con CASE, puedes establecer condiciones y definir valores o expresiones según estas condiciones. 
4) Te permite realizar transformaciones de datos y cálculos personalizados en tus resultados.
*/

-- EJEMPLO CON PRECIOS
SELECT buy_price as precios,  
CASE 
    WHEN buy_price < 20 THEN "Bajo"   
    WHEN buy_price > 40 THEN "Alto"  
    ELSE "Medio"   
END AS rango_precios 
FROM productos;  
