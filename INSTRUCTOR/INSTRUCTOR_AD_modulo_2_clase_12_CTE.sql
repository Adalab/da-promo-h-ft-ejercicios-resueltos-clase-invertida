-- INSTRUCTOR modulo 2, clase 12 CTE

USE tienda;

/*
sintaxis de una CTE

WITH "NOMBRE_CTE" ("COLUMNA","OTRA_COLUMNA") AS(
											CONSULTA)
*/

SELECT *
FROM customers;

-- -----

WITH clientes AS (
				SELECT *
				FROM customers
)

SELECT * FROM clientes;

-- ----

WITH clientes AS (
				SELECT *
				FROM customers
)

SELECT customer_number, customer_name
FROM clientes;


-- --

WITH clientes AS (
				SELECT customer_number, customer_name
				FROM customers
)

SELECT *
FROM clientes;



------

-- NECESITO OBTENER EN UNA CONSULTA LOS PRODUCTOS (TODOS SUS DATOS) Y EL PRECIO MEDIO POR CATEGORIA DE CADA UNO DE ELLOS

-- MOSTRAR LO SIGUIENTE
SELECT *
FROM products;


-- PASO A PASO BUSQUEMOS EL PRECIO MEDIO

SELECT product_line , AVG(buy_price)
FROM products
GROUP BY product_line  -- MOSTRAR ESO

-- PODEMOS CONVERTIR LO ANTERIOR EN UNA CTE???

WITH media_cat AS(
		SELECT product_line , AVG(buy_price) AS media
		FROM products
		GROUP BY product_line
)


SELECT * 
FROM products AS p
INNER JOIN media_cat AS m
WHERE p.product_line = m.product_line

--

-- queremos las empleadas de mi bbdd y a quienes reportan (osea sus respectuvas jefes)

SELECT *
FROM employees 


-- creando tabla jefas

WITH jefas AS(
			SELECT employee_number, CONCAT(first_name,' ', last_name) AS nombre_jefa, job_title 
            FROM employees)

SELECT E.employee_number, E.first_name, E.last_name, E.job_title, E.reports_to, J.*
FROM employees AS E
INNER JOIN jefas AS J
ON E.reports_to = J.employee_number


--
WITH tabla AS(
			WITH jefas AS(
			SELECT employee_number, first_name AS nombre_jefa, last_name AS apellido_jefa -
            FROM employees)

SELECT E.first_name, E.last_name, E.job_title, E.reports_to, J.*
FROM employees AS E
INNER JOIN jefas AS J
ON E.reports_to = J.employee_number
)
SELECT *
FROM employees
WHERE first_name NOT IN (SELECT DISTINCT nombre_jefa
from tabla)



--
-- 	queremos sacar los clientes que esten en las ciudades de mas de 3 clientes

SELECT *
FROM customers;

--

SELECT city, COUNT(*)
FROM customers
GROUP BY city;

--

SELECT city, COUNT(*)
FROM customers
GROUP BY city
HAVING COUNT(*) > 3;

--

WITH ciudades AS (
				SELECT city, COUNT(*)
				FROM customers
				GROUP BY city
				HAVING COUNT(*) > 3
)

SELECT customer_name, A.city
FROM customers AS A
INNER JOIN ciudades AS B
ON A.city = B.city
ORDER BY B.city ASC;

-- otra forma de resolverlo

WITH ciudades AS (
				SELECT city, COUNT(*)
				FROM customers
				GROUP BY city
				HAVING COUNT(*) > 3
)

SELECT customer_name, city
FROM customers 
WHERE city IN (SELECT city FROM ciudades)
ORDER BY city ASC;



-- 	queremos sacar las oficinas que esten en las ciudades de mas de 3 clientes.

WITH ciudades AS (
				SELECT city, COUNT(*)
				FROM customers
				GROUP BY city
				HAVING COUNT(*) > 3
)

SELECT *
FROM offices 
WHERE city IN (SELECT city FROM ciudades)
ORDER BY city ASC;



--

-- queremos el numero de oficina y nombre del cliente de las ciudades con mas de 3 clientes.

WITH ciudades AS (
				SELECT city, COUNT(*)
				FROM customers
				GROUP BY city
				HAVING COUNT(*) > 3
)

SELECT customer_name
FROM customers 
WHERE city IN (SELECT city FROM ciudades)

UNION

SELECT office_code
FROM offices 
WHERE city IN (SELECT city FROM ciudades);


-- forma de subconsulta

SELECT customer_name
FROM customers 
WHERE city IN (SELECT city
				FROM customers
				GROUP BY city
				HAVING COUNT(*) > 3)
 UNION
 
SELECT office_code
FROM offices 
WHERE city IN (SELECT city
				FROM customers
				GROUP BY city
				HAVING COUNT(*) > 3)









