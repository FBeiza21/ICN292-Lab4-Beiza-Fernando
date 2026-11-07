# ICN292-Lab4-Beiza-Fernando
# Laboratorio 4 — Reconstrucción y consultas en MySQL

**Asignatura:** ICN292 Sistemas de Información para la Gestión  
**Estudiante:** Fernando Beiza  
**Caso:** Austral Editores

## Descripción

Este repositorio contiene la solución del Laboratorio 4. Se reconstruye la base de datos `austzal` en MySQL, con información de autores, libros, colecciones y pagos. El script carga los datos iniciales y ejecuta las diez consultas y operaciones solicitadas. El informe explica el procedimiento, interpreta los resultados e incluye las capturas de MySQL Workbench.

## Archivos
-ICN292-Lab4-Beiza-Fernando.sql`: Creación de la base y las tablas, carga de datos, consultas 1 a 10 y verificaciones.
-ICN292-Lab4-Beiza-Fernando-Informe.pdf`:Informe final con introducción, desarrollo, resultados, evidencias y conclusiones. 
-ICN292-Lab4-Beiza-Fernando-Informe.docx`:Versión editable del informe. 

## Requisitos

- MySQL 8.0 o posterior, por la intercalación `utf8mb4_0900_ai_ci` utilizada en el script.
- MySQL Workbench u otro cliente SQL compatible.
- Permisos para crear y eliminar bases de datos.

## Cómo reproducir los resultados

1. Conectarse a un servidor MySQL 8 desde MySQL Workbench.
2. Abrir `ICN292-Lab4-Beiza-Fernando.sql` con **File → Open SQL Script**.
3. Ejecutar el archivo completo, desde la primera línea y en el orden indicado.
4. Revisar los resultados de las consultas y compararlos con las capturas incorporadas en el PDF.

**Importante:** el script comienza con `DROP DATABASE IF EXISTS austzal;`. Si ya existe una base con ese nombre, se eliminará junto con su contenido antes de reconstruirla. Respáldala previamente si contiene datos que deban conservarse.

## Estructura del script

1. Creación de la base `austzal` y de las tablas `autores`, `colecciones`, `libros` y `pagos`.
2. Carga inicial de seis autores y doce libros.
3. Consultas 1 a 6 sobre el catálogo inicial: filtros, ordenamiento, agregaciones, valores distintos y uniones.
4. Consultas 7 y 8: inserción y eliminación de un libro temporal; actualización y verificación de ejemplares vendidos.
5. Consultas 9 y 10: asignación de libros a colecciones y registro y resumen de pagos a autores.

Al ejecutar el script completo desde una base nueva, la consulta 7 elimina el libro temporal que inserta, mientras que la consulta 8 aumenta de 1.500 a 1.600 los ejemplares vendidos de *Cielo de Enero*. Las consultas 1 a 6 corresponden al catálogo **antes** de esas modificaciones.
