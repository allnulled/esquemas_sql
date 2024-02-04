-- Eliminar tablas en orden inverso
DROP TABLE IF EXISTS comentarios_de_noticias;
DROP TABLE IF EXISTS noticias;
DROP TABLE IF EXISTS categorias;

-- Crear tabla 'categorias'
CREATE TABLE IF NOT EXISTS categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

-- Crear tabla 'noticias'
CREATE TABLE IF NOT EXISTS noticias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    contenido TEXT NOT NULL,
    id_reportero INT,
    id_categoria INT,
    fecha_publicacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_reportero) REFERENCES usuarios(id),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id)
);

-- Crear tabla 'comentarios_de_noticias'
CREATE TABLE IF NOT EXISTS comentarios_de_noticias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    noticia_id INT,
    contenido TEXT NOT NULL,
    fecha_comentario TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (noticia_id) REFERENCES noticias(id)
);

