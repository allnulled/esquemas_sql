-- Eliminar tablas en orden inverso
DROP TABLE IF EXISTS comentarios_de_propuestas;
DROP TABLE IF EXISTS votaciones;
DROP TABLE IF EXISTS propuestas;
DROP TABLE IF EXISTS miembros;

-- Crear tabla 'miembros'
CREATE TABLE IF NOT EXISTS miembros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios (id)
);

-- Crear tabla 'propuestas'
CREATE TABLE IF NOT EXISTS propuestas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    contenido TEXT NOT NULL,
    autor_id INT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (autor_id) REFERENCES miembros(id)
);

-- Crear tabla 'votaciones'
CREATE TABLE IF NOT EXISTS votaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_propuesta INT,
    resultado ENUM('aprobada', 'rechazada', 'pendiente') DEFAULT 'pendiente',
    fecha_votacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_propuesta) REFERENCES propuestas(id)
);

-- Crear tabla 'comentarios_de_propuestas'
CREATE TABLE IF NOT EXISTS comentarios_de_propuestas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_miembro INT,
    id_propuesta INT,
    contenido TEXT NOT NULL,
    fecha_comentario TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_miembro) REFERENCES miembros(id),
    FOREIGN KEY (id_propuesta) REFERENCES propuestas(id)
);