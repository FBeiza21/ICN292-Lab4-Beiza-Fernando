-- ============================================================
-- 0.CREACION DE AUSTZAL
-- ============================================================
DROP DATABASE IF EXISTS austzal;
CREATE DATABASE austzal
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_0900_ai_ci;
USE austzal;

-- ============================================================
-- 1.TABLAS
-- ============================================================

CREATE TABLE autores (
    id_autor INT AUTO_INCREMENT,
    nombre VARCHAR(80) NOT NULL,
    pais VARCHAR(60) NULL,
    genero ENUM('Cómic', 'Ensayo', 'Infantil', 'Novela', 'Poesía') NOT NULL,
    PRIMARY KEY (id_autor)
);

CREATE TABLE colecciones (
    id_coleccion INT AUTO_INCREMENT,
    titulo VARCHAR(120) NOT NULL,
    fecha_publicacion DATE NOT NULL,
    PRIMARY KEY (id_coleccion)
);

CREATE TABLE libros (
    id_libro INT AUTO_INCREMENT,
    id_autor INT NOT NULL,
    id_coleccion INT NULL,
    titulo VARCHAR(120) NOT NULL,
    paginas INT,
    ejemplares_vendidos INT,
    anio INT,
    PRIMARY KEY (id_libro),
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor),
    FOREIGN KEY (id_coleccion) REFERENCES colecciones(id_coleccion)
);

CREATE TABLE pagos (
    id_pago INT AUTO_INCREMENT,
    id_autor INT NOT NULL,
    fecha_pago DATE NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (id_pago),
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor)
);

-- ============================================================
-- 2. CARGA
-- ============================================================

INSERT INTO autores (nombre, pais, genero) VALUES
('Elena Pizarro', 'Chile', 'Novela'),
('Harold Finch', 'Inglaterra', 'Ensayo'),
('Rodrigo Bahamonde', 'Chile', 'Poesía'),
('Valentina Correa', 'Argentina', 'Infantil'),
('Nora Keller', 'Estados Unidos', 'Novela'),
('Kenji Arakawa', NULL, 'Cómic');

INSERT INTO libros
    (id_autor, id_coleccion, titulo, paginas, ejemplares_vendidos, anio)
VALUES
(1, NULL, 'Cielo de Enero',       210, 1500, 2024),
(1, NULL, 'Marea Baja',           185,  800, 2023),
(1, NULL, 'El Norte',             200, 2200, 2024),
(2, NULL, 'Estrellas que Caen',   240, 3000, 2022),
(2, NULL, 'Máquinas',             215,  450, 2024),
(3, NULL, 'Luz Artificial',       300, 1200, 2024),
(3, NULL, 'Ruido Blanco',         280,  600, 2023),
(4, NULL, 'El Barrio de Lila',    190, 5000, 2024),
(4, NULL, 'Antes del Amanecer',   205, 2700, 2024),
(4, NULL, 'La Calle 8',           175,  900, 2023),
(5, NULL, 'Flor de Hierro',       195, 4100, 2024),
(5, NULL, 'Hora Dorada',          220, 1800, 2022);

-- ============================================================
-- 3. CONSULTAS
-- ============================================================

-- CONSULTA 1
SELECT nombre, genero
FROM autores
WHERE pais <> 'Chile' OR pais IS NULL
ORDER BY nombre;

-- CONSULTA 2
SELECT titulo, paginas
FROM libros
WHERE paginas BETWEEN 190 AND 220
ORDER BY paginas ASC;

-- CONSULTA 3
SELECT
    COUNT(*) AS numero_libros,
    SUM(ejemplares_vendidos) AS total_ejemplares_vendidos,
    AVG(paginas) AS promedio_paginas,
    MIN(anio) AS anio_mas_antiguo,
    MAX(ejemplares_vendidos) AS mayor_venta_libro
FROM libros;

-- CONSULTA 4
SELECT DISTINCT genero
FROM autores
ORDER BY CAST(genero AS CHAR) ASC;

-- CONSULTA 5
SELECT a.nombre, COUNT(*) AS libros_publicados_2024
FROM autores AS a
JOIN libros AS l
    ON a.id_autor = l.id_autor
WHERE l.anio = 2024
GROUP BY a.id_autor, a.nombre
HAVING COUNT(*) > 1
ORDER BY a.nombre;

-- CONSULTA 6
SELECT titulo, ejemplares_vendidos
FROM libros
WHERE anio = 2024
  AND ejemplares_vendidos > 2000
ORDER BY ejemplares_vendidos DESC
LIMIT 3;

-- ============================================================
-- 4. MODIFICACIONES 7 Y 8
-- ============================================================

-- CONSULTA 7: insertar, revisar, eliminar y comprobar
INSERT INTO libros
    (id_autor, id_coleccion, titulo, paginas, ejemplares_vendidos, anio)
VALUES
    (3, NULL, 'Papel Hojado', 260, 50, 2024);

SELECT *
FROM libros
WHERE titulo = 'Papel Hojado';

DELETE FROM libros
WHERE titulo = 'Papel Hojado';

SELECT *
FROM libros
WHERE titulo = 'Papel Hojado';

-- CONSULTA 8: revisar, actualizar y comprobar
SELECT *
FROM libros
WHERE titulo = 'Cielo de Enero';

UPDATE libros
SET ejemplares_vendidos = ejemplares_vendidos + 100
WHERE titulo = 'Cielo de Enero';

SELECT *
FROM libros
WHERE titulo = 'Cielo de Enero';

-- ============================================================
-- 5. DATOS DE PRUEBA, CONSULTAS 9 Y 10
-- ============================================================

-- CONSULTA 9
INSERT INTO colecciones (titulo, fecha_publicacion) VALUES
('Narrativas Australes', '2024-03-15'),
('Horizontes y Descubrimientos', '2024-08-20');


UPDATE libros
SET id_coleccion = 1
WHERE id_libro BETWEEN 1 AND 6;

UPDATE libros
SET id_coleccion = 2
WHERE id_libro BETWEEN 7 AND 12;

SELECT
    l.titulo AS titulo_libro,
    c.titulo AS titulo_coleccion,
    c.fecha_publicacion
FROM libros AS l
JOIN colecciones AS c
    ON l.id_coleccion = c.id_coleccion
ORDER BY l.id_libro;


-- CONSULTA 10
INSERT INTO pagos (id_autor, fecha_pago, monto) VALUES
(1, '2026-09-05', 1250000.00),
(1, '2026-10-05',  875000.00),
(4, '2026-10-15', 2100000.00);

-- 10.A
SELECT
    a.nombre AS autor,
    p.fecha_pago,
    p.monto
FROM pagos AS p
JOIN autores AS a
    ON p.id_autor = a.id_autor
ORDER BY p.fecha_pago, a.nombre;

-- 10.B
SELECTaustzalaustzalViewsViews
    a.nombre AS autor,
    SUM(p.monto) AS total_pagado
FROM autores AS a
JOIN pagos AS p
    ON a.id_autor = p.id_autor
GROUP BY a.id_autor, a.nombre
ORDER BY a.nombre;
