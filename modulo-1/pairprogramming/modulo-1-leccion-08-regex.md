# **Ejercicios de Regex**

1.  Validar un número de teléfono.
   - Descripción: Verificar si una cadena representa un número de teléfono válido en el formato (XXX) XXX-XXXX.
   - Probad para cada uno de los teléfonos que tenemos en la siguiente lista:

      ```python
      telefonos = ["(123) 456-7890", "178 1890-733", "(555) 238-1987", "(123) 4560-7890", "(ABC) 098-1111"]
      ```

2.  Buscar todas las direcciones de correo electrónico en un texto.
   - Descripción: Encontrar todas las direcciones de correo electrónico presentes en una cadena de texto.
   - Probad con el siguiente *string*:


      ```python
      texto = "Mi correo es user@example.com. Contacta conmigo en john.doe@email.com"
      ```

3.  Validar un código postal.
   - Descripción: Verificar si una cadena representa un código postal válido de 5 dígitos.
   - Probad para cada uno de los códigos postales que tenemos en la siguiente lista: 

      
      ```python
      codigos_postales = ["12345", "190037", "78409", "986449", "19305"]
      ```


4.  Encontrar todas las palabras que comienzan con una vocal en un texto.
   - Descripción: Encontrar todas las palabras en un texto que comienzan con una vocal (a, e, i, o, u).
   - Probad con el siguiente *string*: 

      ```python
      texto = "El perro está ladrando. Ana tiene una manzana. La casa es grande."
      ```


5.  Extraer todos los hashtags de un texto.
   - Descripción: Extraer todos los hashtags (#) presentes en una cadena de texto.
   - Probad con el siguiente *string*: 


     ```python
     texto = "Me encanta el #deporte. #FelizViernes a todos. Estoy en la conferencia #Tech2022."
     ```


6.  Buscar todos los números decimales en una cadena de texto.
   - Descripción: Encontrar todos los números decimales presentes en una cadena de texto.
   - Probad con el siguiente *string*: 


     ```python
     texto = "El precio es $19.99. La temperatura es 25.5°C. El índice de inflación es del 2.5%."     
     ```

7.  Validar un nombre de usuario.
   - Descripción: Verificar si una cadena representa un nombre de usuario válido, que contiene solo letras minúsculas, números y guiones bajos (_).
   - Probad con la siguiente lista de usuarios: 


     ```python
     lista_usuarios = ["juan_doe123", "lola_12", "Aurora_23", "12marta_lopez"]
     ```

8.  Encontrar todas las fechas en formato "dd/mm/aaaa" en un texto.
    - Descripción: Encontrar todas las fechas válidas en formato "dd/mm/aaaa" presentes en una cadena de texto.
    - Probad con el siguiente *string*: 

      ```python
      texto = "La fecha límite es el 31/12/2022. Hoy es 01/01/2023. Cumpleaños: 15/05/1990."
      ```

9.  Remover caracteres especiales.
   - Descripción: Dada una cadena de texto, remover cualquier carácter especial, como signos de puntuación y símbolos.
   - Probad con el siguiente *string*:

     ```python
     texto = '¡Hola, cómo estás? ¿Todo bien?'
     ```

10. BONUS: Enmascarar información personal. 
    - Descripción: Dada una cadena de texto que contiene información personal, como nombres y direcciones, enmascarar esta información reemplazándola con asteriscos (`*`).
    - Probad con este *string*:

      ```python
      texto = 'El nombre del cliente es John Doe y su dirección es 123 Main Street.'
      ```
