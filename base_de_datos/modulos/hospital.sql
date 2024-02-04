-- Eliminar tablas en orden inverso
DROP TABLE IF EXISTS medicamentos_recetados;
DROP TABLE IF EXISTS recetas;
DROP TABLE IF EXISTS citas;
DROP TABLE IF EXISTS historias_clinicas;
DROP TABLE IF EXISTS pacientes;
DROP TABLE IF EXISTS medicos;
DROP TABLE IF EXISTS departamentos;

-- Crear tabla 'departamentos'
CREATE TABLE IF NOT EXISTS departamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

-- Crear tabla 'medicos'
CREATE TABLE IF NOT EXISTS medicos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    especialidad VARCHAR(255),
    departamento_id INT,
    FOREIGN KEY (departamento_id) REFERENCES departamentos(id)
);

-- Crear tabla 'pacientes'
CREATE TABLE IF NOT EXISTS pacientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    fecha_nacimiento DATE,
    genero ENUM('masculino', 'femenino', 'otro'),
    direccion VARCHAR(255),
    telefono VARCHAR(15)
);

-- Crear tabla 'historias_clinicas'
CREATE TABLE IF NOT EXISTS historias_clinicas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    paciente_id INT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (paciente_id) REFERENCES pacientes(id)
);

-- Crear tabla 'citas'
CREATE TABLE IF NOT EXISTS citas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    paciente_id INT,
    medico_id INT,
    fecha_cita DATETIME,
    motivo VARCHAR(255),
    FOREIGN KEY (paciente_id) REFERENCES pacientes(id),
    FOREIGN KEY (medico_id) REFERENCES medicos(id)
);

-- Crear tabla 'recetas'
CREATE TABLE IF NOT EXISTS recetas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    medico_id INT,
    paciente_id INT,
    fecha_receta TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (medico_id) REFERENCES medicos(id),
    FOREIGN KEY (paciente_id) REFERENCES pacientes(id)
);

-- Crear tabla 'medicamentos_recetados'
CREATE TABLE IF NOT EXISTS medicamentos_recetados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    receta_id INT,
    nombre_medicamento VARCHAR(255),
    dosis VARCHAR(50),
    frecuencia VARCHAR(50),
    FOREIGN KEY (receta_id) REFERENCES recetas(id)
);
