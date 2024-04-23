# **Ejercicios de Clases**


1. En este ejercicio de *pair programming*, vamos a crear una clase para gestionar la información de los empleados de nuestra empresa. Siguiendo las indicaciones del jefe, necesitamos organizar los datos de cada empleado de manera más estructurada. 

    - La clase `Empleados` permite gestionar información relacionada con los empleados de una empresa, con las siguientes características: 

        1. Debes crear una clase llamada "Empleados" que tenga los siguientes atributos: `nombre`, `apellidos`, `edad`, `posicion`, `año` , `vacaciones`(cantidad de días de vacaciones que le quedan al empleado) y `herramientas`.

        2. El constructor `__init__` debe recibir estos atributos como parámetros y asignarlos a los respectivos atributos de la clase.

        3. Los atributos representan la información personal y profesional de un empleado, como su nombre completo, edad, posición en la empresa, año de ingreso, días de vacaciones disponibles y una lista de herramientas que el empleado sabe utilizar.

    - Los métodos que debe recibir esta clase son: 


        1. **Método `descripcion`**: Proporciona una descripción del empleado, incluyendo su nombre, posición en la empresa, y la cantidad de días de vacaciones que le quedan para el año actual. Los pasos para resolver el ejercicio del método `descripcion` son: 

            - **Utilizar F-Strings**: Utiliza f-strings para construir la descripción del empleado de manera legible y eficiente.

            - **Especificar los Atributos a Incluir**: Determina cuáles de los atributos del empleado se deben incluir en la descripción. Los atributos necesarios son `nombre`, `posicion`, `año`, y `vacaciones`.

            - **Concatenar los Atributos**: Usar f-strings para concatenar los atributos seleccionados y crear una descripción coherente.


        2. **Método `cambiando_posicion`**: Verifica las herramientas que el empleado tiene en su lista y devuelve un mensaje específico basado en las herramientas. Puede elogiar al empleado si tiene "Python" en su lista o sugerirle que deje de usar "Excel" y aprenda Python. Los pasos para resolver este ejercicio son:

            - **Iterar a través de las Herramientas**: La función debe recorrer la lista de herramientas (`self.herramientas`) del empleado.

            - **Evaluar Cada Herramienta**: Para cada herramienta en la lista, verifica si es igual a "Python" o "Excel" (en minúsculas).

        3. **Método `calcular_antiguedad`**: Calcula la antigüedad del empleado en años y meses desde el año de ingreso hasta la fecha actual.

            -  **Calcular la Antigüedad en Años y Meses**: Utiliza el módulo `datetime` de Python para obtener el año actual y el mes actual. 

            -  **Generar el Mensaje de Antigüedad**: Usa los valores calculados para años y meses de antigüedad para generar un mensaje descriptivo. Por ejemplo, "Juan lleva 5 años y 3 meses en la empresa".


        4. **Método `solicitar_aumento_vacaciones`**: Permite al empleado solicitar un aumento en la cantidad de días de vacaciones. Si la solicitud es válida (es decir, se solicitan días positivos), actualiza los días de vacaciones del empleado y devuelve un mensaje de confirmación. Recibirá un parámetro `dias_solicitados`, que corresponderá con el número de días de vacaciones que quiere solicitar. 

            - **Validar los Días Solicitados**: Utiliza una estructura de control para verificar si la cantidad de días solicitados (`dias_solicitados`) es mayor que cero. Esto garantiza que solo se procesen solicitudes de aumento válidas.

            -  **Actualizar los Días de Vacaciones**: Si la solicitud es válida, aumenta la cantidad de días de vacaciones del empleado (`self.vacaciones`) sumando la cantidad de días solicitados.

            -  **Generar un Mensaje de Confirmación**: Crea un mensaje informativo que confirme la aprobación de la solicitud y muestre la cantidad actualizada de días de vacaciones del empleado.

            - **Manejar Solicitudes No Válidas**: Si la solicitud no es válida (es decir, `dias_solicitados` es menor o igual a cero), generar un mensaje de error que indique que la solicitud debe ser un número positivo.


        5. **Método `registrar_herramienta`**: Permite al empleado registrar una nueva herramienta en su lista de habilidades. La herramienta se registra si no está registrada previamente en la lista de herramientas del empleado. Recibirá un parámetro que será la nueva herramienta. 

            - **Validar la Nueva Herramienta**: Utiliza una estructura de control  para verificar si la nueva herramienta no está en la lista de herramientas existentes. 

            - **Agregar la Nueva Herramienta**: Si la nueva herramienta no está en la lista existente, agregarla a la lista. 

            - **Generar un Mensaje de Confirmación**: Crea un mensaje informativo que confirme el registro exitoso de la nueva herramienta y muestre el nombre de la herramienta registrada.

            - **Manejar Herramientas Duplicadas**: Si la nueva herramienta ya existe en la lista, genera un mensaje que indique que la herramienta ya ha sido registrada previamente.



        6. **Método `cambiar_posicion`**: Permite al empleado cambiar su posición y salario en la empresa. Actualiza la posición y el salario y devuelve un mensaje de felicitación. Recibirá dos parámetros, la nueva posición y el nuevo salario. 


            - **Actualizar la Posición y el Salario**: Utiliza los parámetros `nueva_posicion` y `nuevo_salario` para actualizar la posición y el salario del empleado. 

            - **Generar un Mensaje de Confirmación**: Crea un mensaje informativo que confirme el cambio de posición y salario del empleado y muestre el nombre del empleado, la nueva posición y el nuevo salario.

        7. **Método `tomar_vacaciones`**: Permite al empleado tomar días de vacaciones, solicitando la cantidad deseada y actualizando los días de vacaciones restantes. Verifica que se solicite al menos un día de vacaciones y que el empleado tenga suficientes días disponibles. No recibe ningún parámetro adicional.

            -  **Solicitar la Cantidad de Días de Vacaciones**: Usar la función `input` para solicitar al usuario la cantidad de días de vacaciones que desea tomar.

            -  **Validar la Cantidad de Días**: Comprueba que la cantidad de días solicitados sea mayor que cero. Si el usuario ingresa un valor no válido (cero o negativo), muestra un mensaje de error y solicita nuevamente la cantidad de días hasta que sea válida.

            -  **Verificar Disponibilidad de Días de Vacaciones**: Comprueba si la cantidad de días solicitados es menor o igual a la cantidad de días de vacaciones disponibles  para el empleado.

            -  **Actualizar Días de Vacaciones**: Si hay suficientes días de vacaciones disponibles, modifica el código para que se modifiquen los días de vacaciones que le quedan. Si no hay suficientes días disponibles, mostrar un mensaje de error.

            -  **Generar un Mensaje de Confirmación o Error**: Dependiendo de si la solicitud se procesó con éxito o no, genera un mensaje que informe al empleado sobre el resultado de su solicitud.


        8. **Método `solicitar_aumento_salario`**: Permite al empleado solicitar un aumento de salario en porcentaje y calcula el nuevo salario. Verifica que el aumento sea un valor positivo o igual a cero. Este método no recibe ningún parámetro.


            - **Solicitar el Porcentaje de Aumento de Salario**: Utiliza la función `input` para solicitar al usuario el porcentaje de aumento de salario que desea. Asegurate de que el valor ingresado sea un número decimal.

            - **Validar el Porcentaje de Aumento**: Utiliza un bucle `while` para garantizar que el porcentaje de aumento sea mayor o igual a cero. Si el usuario ingresa un valor no válido (negativo), muestra un mensaje de error y solicita nuevamente el porcentaje hasta que sea válido.

            - **Calcular el Nuevo Salario**: Calcula el nuevo salario. 

            - **Generar un Mensaje de Confirmación**: Crea un mensaje que informe al empleado sobre el resultado de su solicitud. Incluye el nuevo salario calculado en el mensaje.

            - **Manejar Errores de Entrada**: Utiliza un bloque `try...except` para manejar posibles errores de entrada, como cuando el usuario ingresa un valor que no se puede convertir a un número decimal.


        9. **Método `realizar_evaluacion`**: Permite al empleado recibir una calificación de desempeño, con opciones como "Excelente", "Bueno", "Regular" o "Malo". Verifica que la calificación ingresada sea válida. Este método no recibe ningún parámetro.


            - **Solicitar la Calificación del Desempeño**: Utiliza la función `input` para solicitar al usuario que califique su propio desempeño. Asegurate de que el valor ingresado sea una de las opciones válidas: "excelente", "bueno", "regular" o "malo".

            - **Validar la Calificación**: Utiliza un bucle `while` para garantizar que la calificación ingresada sea una de las opciones válidas. Si el usuario ingresa una calificación no válida, muestra un mensaje de error y solicita nuevamente la calificación hasta que sea válida.

            - **Generar un Mensaje de Retroalimentación**: Crear un mensaje que proporcione retroalimentación al empleado basada en la calificación ingresada.

            - **Retornar el Mensaje Generado**: La función debe incluir una instrucción `return` que devuelva el mensaje generado.


2. En este ejercicio, se te pide crear una herencia de la clase creada en el ejercicio anterior. Esta clase hija se llama "Gerente" que hereda de la clase creada en el ejercicio anterior. Las instrucciones para crear esta clase son:

    - Crea la clase derivada "Gerente" que hereda de la clase "Empleados". Esta clase debe tener los siguientes atributos en su constructor además de los heredados de "Empleados":

        - `departamento` (str): El departamento al que está asignado el gerente.

        - `empleados_a_cargo` (list): Una lista que contiene los nombres de los empleados que están a cargo del gerente.

    -  Implementa los siguientes métodos en la clase "Gerente":
        - `asignar_tareas(tarea, empleado)`: Este método debe recibir el nombre de una tarea y el nombre de un empleado y debe devolver una cadena que indique que el gerente ha asignado la tarea a ese empleado.

        - `revisar_desempeno_empleado(empleado)`: Este método debe recibir el nombre de un empleado y debe devolver una cadena que indique que el gerente está revisando el desempeño de ese empleado.

        - `gestionar_empleados(accion, empleado)`: Este método permite al gerente realizar acciones de contratación o despido de empleados a cargo. Debe recibir una acción ("contratar" o "despedir") y el nombre de un empleado. Si la acción es "contratar", agrega al empleado a la lista de empleados a cargo y devuelve un mensaje indicando que el empleado ha sido contratado por el gerente. Si la acción es "despedir" y el empleado está en la lista de empleados a cargo, lo elimina y devuelve un mensaje de despido. Si la acción no es válida, devuelve un mensaje indicando que la acción no es válida.

