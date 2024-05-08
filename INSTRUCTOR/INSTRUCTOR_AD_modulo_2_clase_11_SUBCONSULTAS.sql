-- Clase AD 11, modulo 2, SUBCONSULTAS

USE tienda;

-- -------------------------------------------------------------------------------------------------------

							-- -- /* SUBCONSULTAS */ -- --
/*
Nos centraremos en las subconsultas utilizadas en la cláusula WHERE.

1)	Son como preguntas dentro de preguntas, una consulta dentro de otra consulta.
2)	Las subconsultas son como herramientas especializadas. No las usamos en cualquier lugar, sino donde tiene sentido.
3)	Principalmente, las empleamos en las cláusulas WHERE y HAVING. Estas cláusulas son donde buscamos registros 
que cumplan ciertas condiciones.
4)	Las empleamos cuando los datos que deseamos ver están en una tabla, pero para seleccionar las filas de esa tabla, 
necesitamos información que reside en otra tabla.

IMPORTANTE!
Cuando incluimos una subconsulta en una condición WHERE, la subconsulta se ejecuta una vez por cada fila de la consulta
 principal. Esto puede tener un impacto en el tiempo total de ejecución, especialmente en bases de datos grandes.
*/

-- EJEMPLO CON CUSTOMERS Y REDIT_LIMIT.

SELECT *
FROM customers
WHERE credit_limit > (
    SELECT AVG(credit_limit)
    FROM customers
    WHERE country = 'UK'
);


-- UTILIZANDO EL IN...QUE YA HABIAMOS VISTO!! QUIERO VER A QUIEN HACE REFERENCIA (ES DECIR EL NOMBRE)

SELECT customer_number, customer_name
FROM customers
WHERE customer_number IN (131);


-- COMPLEJIZANDO UN POCO MAS....

SELECT customer_number, customer_name,city
FROM customers
WHERE customer_number IN (
    SELECT customer_number
    FROM orders
    WHERE status = 'Shipped'
);

-- -------------------------------------------------------------------------------------------------------

									-- -- /* IN */ -- --
/*
IN en subconsultas:
El operador IN nos permite seleccionar registros de la consulta principal cuando algún atributo de la tabla principal 
coincide con uno o más valores dentro de un conjunto de valores devueltos por la subconsulta. 
*/

-- SELECCIONANDO LOS NOMBRES COMPLETOS (NOMBRE Y APELLIDO) DE LOS EMPLEDADOS, QUE ESTAN ASIGNADOS A TERRITORIOS EN 'NA'.
-- SPOILERT ALERT! USEMOS LAS TABLAS employees Y office_code


SELECT CONCAT(first_name, ' ', last_name) AS full_name, job_title, office_code
FROM employees
WHERE office_code IN (
    SELECT office_code
    FROM offices
    WHERE territory = 'NA'
);


-- -------------------------------------------------------------------------------------------------------

									-- -- /* NOT IN */ -- --
/*
1)	Se utiliza para recuperar registros de la consulta principal para los cuales no existe ningún registro en la
 subconsulta que tenga un valor coincidente.
2)	Este operador nos permite identificar registros que no tienen un equivalente en la subconsulta. 
*/


-- SELECCIONAR LOS NOMBRES DE LOS CLIENTES QUE NO TENGAN PEDIDOS CON ESTADO 'Cancelled'
-- SPOILERT ALERT!! USAREMOS LAS TABLAS customers Y orders


SELECT customer_number,customer_name, credit_limit
FROM customers
WHERE customer_number NOT IN (
    SELECT DISTINCT customer_number
    FROM orders
    WHERE status = 'Cancelled'
);

-- -------------------------------------------------------------------------------------------------------

			-- -- /* ANY, ALL y EXISTS en subconsultas */ -- --

/*
ANY:
Con el operador ANY seleccionamos registros basados en multiples comparaciones. Esto nos permite recuperar registros
 de una consulta principal cuando satisfacen una condición establecida para al menos uno de los valores especificados. 
 
En términos simples:
1)	Se establece una condición en la consulta principal para uno de los atributos de la tabla.

2)	Se compara el valor de ese atributo con cada uno de los valores dentro de la cláusula ANY.

3)	Si la condición es verdadera para al menos uno de los valores en la cláusula ANY, se considera válida y se selecciona
 el registro correspondiente. En otras palabras, la condición debe ser verdadera para al menos una tupla.
 
RESUMIENDO:
ANY se utiliza para comparar un valor con una lista de valores y devuelve true si el valor coincide con AL MENOS UNO de los valores de la lista.
*/


SELECT customer_number, customer_name, credit_limit,country
FROM customers AS E1
WHERE credit_limit > ANY (
    SELECT credit_limit
    FROM customers AS E2
    WHERE E2.country = E1.country
);


/*
1)	SELECT: Esta palabra clave indica que estamos seleccionando datos de la base de datos.
2)	FROM customers AS E1: Indica que estamos seleccionando datos de la tabla customers y la estamos aliasando como E1. 
El alias E1 se puede utilizar para referirse a esta tabla en otras partes de la consulta.
3)	WHERE credit_limit > ANY (...): Esta parte de la consulta es interesante. 
Aquí estamos filtrando las filas de la tabla customers para devolver solo aquellas en las que el credit_limit es mayor que cualquier 
valor de credit_limit devuelto por una subconsulta.
4)	SELECT credit_limit FROM customers AS E2 WHERE E2.country = E1.country: Esta es la subconsulta. Selecciona el credit_limit de la tabla customers,
 que también es aliasada como E2. La condición WHERE E2.country = E1.country asegura que solo seleccionemos los credit_limit de 
 los clientes del mismo país que el cliente actual en la tabla principal (E1).

*/


/*ALL
ALL se utiliza para comparar un valor con una lista de valores y devuelve true si el valor coincide CON TODOS los valores de la lista.

*/


SELECT customer_number, customer_name, credit_limit, country
FROM customers AS E1
WHERE credit_limit = ALL (
    SELECT credit_limit
    FROM customers AS E2
    WHERE E2.country = E1.country
);

/* EXIST
En términos simples, "EXISTS" se usa para verificar la existencia de algún dato en una subconsulta. Es útil cuando quieres filtrar registros
 en función de si una condición se cumple en otra tabla.
*/

SELECT *
FROM orders AS o
WHERE EXISTS (
    SELECT *
    FROM customers AS c
    WHERE c.customer_number = o.customer_number
    AND c.credit_limit > 150000
);

-- -------------------------------------------------------------------------------------------------------

			-- -- /* SUBCONSULTAS CORRELACIONADAS */ -- --                       

/*                     
 En las subconsultas correlacionadas,los resultados de la consulta externa se utilizan para obtener los resultados finales
 de la subconsulta. En otras palabras, las subconsultas correlacionadas no pueden evaluarse de manera independiente, ya que
 dependen de los valores de la consulta principal para evaluar sus condiciones.
 */
                        
                        
SELECT product_name, 
        product_line,
        quantity_in_stock,
        buy_price
FROM products AS e1  
WHERE e1.buy_price >= (
    SELECT AVG(e2.buy_price)  
    FROM products AS e2  
    WHERE e1.product_line = e2.product_line)  
ORDER BY product_line;                       
                        
                        
