**Ejercicios de API's**

Enunciado - Obtener datos energéticos usando la API de Red Eléctrica. 


 Descripción: La empresa para la que trabajamos dispone de una base de datos que contiene información sobre el número de personas censadas en las distintas Comunidades Autónomas españolas desde 1998 hasta 2022. El objetivo es enriquecer estos datos con información sobre la generación de energía renovable y no renovable, utilizando la API de REData, la cual proporciona información sobre el mercado energético en España. Puedes encontrar la documentación de la API [aquí](https://www.ree.es/es/apidatos).


**1. Extracción de Datos a Nivel Nacional:**

- Extraer datos de generación de energía renovable y no renovable a nivel nacional desde el 1 de enero de 2011 hasta el 31 de diciembre de 2022. La información debe ser recopilada a nivel mensual. 

- Transformar los datos para incluir una columna nueva que identifique si la energía es renovable o no renovable.

- Almacenar los datos en un DataFrame con la siguiente estructura:
    |   tipo_energia   |   tipo_generacion   |   fecha                       |   valor          |
    |------------------|----------------------|-------------------------------|------------------|
    |   Hidráulica     |   Renovable          |   2011-01-01T00:00:00.000+01:00 |   5.119512e+06   |
    |   Hidráulica     |   Renovable          |   2011-02-01T00:00:00.000+01:00 |   2.998051e+06   |
    |   Hidráulica     |   Renovable          |   2011-03-01T00:00:00.000+01:00 |   3.910363e+06   |
    |   Hidráulica     |   Renovable          |   2011-04-01T00:00:00.000+02:00 |   3.537938e+06   |
    |   Hidráulica     |   Renovable          |   2011-05-01T00:00:00.000+02:00 |   2.797500e+06   |
    |   ...            |   ...                |   ...                         |   ...            |
    |   Generación total|   Generación total   |   2022-08-01T00:00:00.000+02:00 |   2.528779e+07   |
    |   Generación total|   Generación total   |   2022-09-01T00:00:00.000+02:00 |   2.366389e+07   |
    |   Generación total|   Generación total   |   2022-10-01T00:00:00.000+02:00 |   2.195674e+07   |
    |   Generación total|   Generación total   |   2022-11-01T00:00:00.000+01:00 |   2.157244e+07   |
    |   Generación total|   Generación total   |   2022-12-01T00:00:00.000+01:00 |   2.222615e+07   |


**2. Extracción de Datos por Comunidad Autónoma:**

- Extraer datos de generación de energía renovable y no renovable por Comunidad Autónoma.

- Utilizar el diccionario `cod_comunidades` para obtener los códigos de cada comunidad autónoma.

- Transformar los datos para incluir una columna que especifique la comunidad autónoma y su identificador.

- Almacenar los datos en un DataFrame con la siguiente estructura:
    |   tipo_energia   |   tipo_generacion   |   fecha                       |   valor          |   ccaa        |
    |------------------|----------------------|-------------------------------|------------------|---------------|
    |   Motores diésel  |   No-Renovable      |   2011-01-01T00:00:00.000+01:00 |   16727.395      |   Ceuta       |
    |   Motores diésel  |   No-Renovable      |   2011-02-01T00:00:00.000+01:00 |   15216.784      |   Ceuta       |
    |   Motores diésel  |   No-Renovable      |   2011-03-01T00:00:00.000+01:00 |   16429.358      |   Ceuta       |
    |   Motores diésel  |   No-Renovable      |   2011-04-01T00:00:00.000+02:00 |   14974.756      |   Ceuta       |
    |   Motores diésel  |   No-Renovable      |   2011-05-01T00:00:00.000+02:00 |   15951.381      |   Ceuta       |
    |   ...            |   ...                |   ...                         |   ...            |   ...         |
    |   Generación total|   Generación total   |   2022-08-01T00:00:00.000+02:00 |   152284.837    |   La Rioja    |
    |   Generación total|   Generación total   |   2022-09-01T00:00:00.000+02:00 |   214907.540    |   La Rioja    |
    |   Generación total|   Generación total   |   2022-10-01T00:00:00.000+02:00 |   234249.375    |   La Rioja    |
    |   Generación total|   Generación total   |   2022-11-01T00:00:00.000+01:00 |   175403.270    |   La Rioja    |
    |   Generación total|   Generación total   |   2022-12-01T00:00:00.000+01:00 |   217137.242    |   La Rioja    |


- El diccionario de `cod_comunidades` es: 
    ```python
    cod_comunidades = {'Ceuta': 8744,
                        'Melilla': 8745,
                        'Andalucía': 4,
                        'Aragón': 5,
                        'Cantabria': 6,
                        'Castilla - La Mancha': 7,
                        'Castilla y León': 8,
                        'Cataluña': 9,
                        'País Vasco': 10,
                        'Principado de Asturias': 11,
                        'Comunidad de Madrid': 13,
                        'Comunidad Foral de Navarra': 14,
                        'Comunitat Valenciana': 15,
                        'Extremadura': 16,
                        'Galicia': 17,
                        'Illes Balears': 8743,
                        'Canarias': 8742,
                        'Región de Murcia': 21,
                        'La Rioja': 20}
    ```