-- Eliminar tablas en orden inverso
DROP TABLE IF EXISTS comentarios_de_publicaciones;
DROP TABLE IF EXISTS publicaciones;

-- Crear tabla 'publicaciones'
CREATE TABLE IF NOT EXISTS publicaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    contenido TEXT NOT NULL,
    fecha_publicacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Crear tabla 'comentarios_de_publicaciones'
CREATE TABLE IF NOT EXISTS comentarios_de_publicaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_publicacion INT NOT NULL,
    id_padre INT,
    nombre_usuario VARCHAR(50) NOT NULL,
    contenido TEXT NOT NULL,
    fecha_comentario TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_publicacion) REFERENCES publicaciones(id) ON DELETE CASCADE,
    FOREIGN KEY (id_padre) REFERENCES comentarios_de_publicaciones(id) ON DELETE CASCADE
);