-- Eliminar tablas en orden inverso
DROP TABLE IF EXISTS lecciones;
DROP TABLE IF EXISTS inscripciones;
DROP TABLE IF EXISTS cursos;

-- Crear tabla 'cursos'
CREATE TABLE IF NOT EXISTS cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    id_profesor INT,
    FOREIGN KEY (id_profesor) REFERENCES usuarios(id)
);

-- Crear tabla 'inscripciones'
CREATE TABLE IF NOT EXISTS inscripciones (
    estudiante_id INT,
    curso_id INT,
    fecha_inscripcion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (estudiante_id, curso_id),
    FOREIGN KEY (estudiante_id) REFERENCES usuarios(id),
    FOREIGN KEY (curso_id) REFERENCES cursos(id)
);

-- Crear tabla 'lecciones'
CREATE TABLE IF NOT EXISTS lecciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    curso_id INT,
    titulo VARCHAR(255) NOT NULL,
    contenido TEXT,
    fecha_publicacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (curso_id) REFERENCES cursos(id)
);