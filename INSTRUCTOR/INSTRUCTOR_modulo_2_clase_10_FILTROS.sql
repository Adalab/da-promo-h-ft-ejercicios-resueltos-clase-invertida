-- INSTRUCTOR AD Clase 10, modulo 2, FILTROS

USE tienda;

-- -------------------------------------------------------------------------------------------

			                  -- -- /* LIKE - NOT LIKE */ -- --
/*
1)	Las instrucciones LIKE y NOT LIKE en MySQL se utilizan para realizar comparaciones de PATRONES DE CADENA DE TEXTO. 
2)	Son útiles cuando deseas buscar valores que coincidan con un patrón específico en una columna de texto.
*/

-- La sintaxis básica de LIKE es la siguiente:

SELECT * FROM customers
WHERE contact_last_name LIKE 'King'; 

-- PODEMOS USAR UNA LISTA EN LIKE O NOT LIKE? COMO PODEMOS RESOLVERLO?

SELECT * FROM customers
WHERE contact_last_name LIKE 'King' OR contact_last_name LIKE 'Labrune';

-- OTRA FORMA DE HAERLO

SELECT * FROM customers
WHERE contact_last_name IN ('King','Labrune');

-- La sintaxis básica de NOT LIKE es la siguiente:

SELECT * FROM employees
WHERE job_title NOT LIKE 'Sales Rep';

-- PODEMOS INCLUSO USAR ALGO YA CONOCIDO....REGEX!!

-- La sintaxis básica de LIKE CON REGEX es la siguiente:

SELECT * FROM customers
WHERE customer_name LIKE 'A%';

-- La sintaxis básica de NOT LIKE CON REGEX es la siguiente:

SELECT * FROM employees
WHERE job_title NOT LIKE '%Manager%';


-- COMBINANDO LIKE Y NOT LIKE

SELECT * FROM customers
WHERE customer_name LIKE '%Co%' AND country NOT LIKE 'USA';

-- -------------------------------------------------------------------------------------------

			-- -- /* IN(INTERSECT) */ -- --
/*
1)	La sentencia IN en MySQL es un operador que permite comparar un valor con una lista de valores y recuperar filas
 que coincidan con cualquiera de esos valores.
2)	Especialmente útil cuando deseamos filtrar resultados en función de múltiples opciones sin tener que escribir 
 múltiples condiciones OR en el WHERE.
*/


SELECT * FROM customers
WHERE country IN ("Portugal","France") AND customer_name LIKE '%Co%'; -- agregar AND customer_name LIKE '%Co%'


SELECT * FROM customers
WHERE country IN ('USA', 'UK') OR (country = 'France' AND credit_limit > 115000);


SELECT last_name AS Apellidos
FROM employees
WHERE last_name IN (SELECT contact_last_name FROM customers);

-- -------------------------------------------------------------------------------------------

			-- -- /* NOT IN(EXCEPT) */ -- --
/*
1)	La operación NOT IN permite filtrar filas en función de que un valor no esté presente en una lista de valores específica.
2)	Especialmente útil cuando queremos excluir resultados que coincidan con ciertos valores y obtener el resto de las filas
 de una tabla.
*/

SELECT product_line, sum(buy_price) FROM products
WHERE product_line NOT IN ('Classic Cars', 'Motorcycles', 'Planes')
AND buy_price > 60;  -- agregar GROUP BY product_line LIMIT 5


-- -------------------------------------------------------------------------------------------

			-- -- /* UNION */ -- --
/*
1)	UNION es una forma efectiva de combinar los resultados de dos o más consultas en un solo conjunto de resultados. 
2)	UNION no solo se encarga de reunir los datos, sino que también se deshace automáticamente de cualquier duplicado, 
proporcionándonos una vista única y consolidada.
A la hora de usar el UNION tener en cuenta:
		a)	Las consultas que uses con UNION deben tener la misma cantidad de columnas y tipos de datos correspondientes
        en el mismo orden.
        b)	La operación UNION elimina automáticamente las filas duplicadas del conjunto de resultados final.
        c)	El orden de las filas en el conjunto de resultados final se determina por la primera consulta
*/

-- VAMOS A UNIR DOS CONSULTAS 


SELECT customer_name AS NOMBRE
FROM customers
WHERE customer_name LIKE 'A%'

UNION

SELECT CONCAT(first_name, ' ', last_name) AS NOMBRE
FROM employees
WHERE first_name LIKE 'A%' OR last_name LIKE 'A%'
ORDER BY NOMBRE;


-- -------------------------------------------------------------------------------------------

			-- -- /* UNION ALL */ -- --
/*
1)	Utilizada para combinar los resultados de dos o más consultas en un solo conjunto de resultados, permitiendo la 
inclusión de todas las filas, INCLUSO SI HAY DUPLICADOS. 
2)	Conserva todas las filas de cada consulta, independientemente de si se repiten en otras consultas.
*/

SELECT customer_name AS name
FROM customers
WHERE customer_name LIKE 'A%'

UNION ALL

SELECT CONCAT(first_name, ' ', last_name) AS name
FROM employees
WHERE first_name LIKE 'A%' AND office_code = 'US001'
ORDER BY name
LIMIT 5;

-- -------------------------------------------------------------------------------------------

			-- -- /* REGEX */ -- --
/*


1)	Las instrucciones LIKE y NOT LIKE en MySQL se utilizan para realizar comparaciones de patrones en cadenas de texto. 
2)	Son útiles cuando deseas buscar valores que coincidan con un patrón específico en una columna de texto.
*/

-- Seleccionar todos los nombres de los clientes cuyos nombres comienzan con 'A' o 'B':

SELECT * FROM customers
WHERE customer_name REGEXP '^[AB]'
AND country = 'USA'
LIMIT 3;

-- Seleccionar todos los productos cuyo pais contiene la letra 'U' o 'A' en cualquier parte:

SELECT * FROM offices
WHERE country REGEXP '[UA]';

-- Seleccionar todos los pagos cuyo numero de cheque es de tres letras de longitud:

SELECT check_number
FROM payments
WHERE check_number REGEXP '^B.*23$';
