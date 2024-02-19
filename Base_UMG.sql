CREATE DATABASE BaseUmg;

use BaseUMG;
-- Tabla maestra Facultades hecha por Favio
CREATE TABLE Facultades (
    id_facultad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    decano VARCHAR(100)
);

-- Tabla maestra Carreras hecha por Favio
CREATE TABLE Carreras (
    id_carrera INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    id_facultad INT,
    FOREIGN KEY (id_facultad) REFERENCES Facultades(id_facultad)
);
-- tabla maestra hecha por carlos
CREATE TABLE Maestros (
    id_maestro INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    email_maestro VARCHAR(25),
    apellido VARCHAR(100),
    id_facultad INT,
    seccion VARCHAR(25),
    FOREIGN KEY (id_facultad) REFERENCES Facultades(id_facultad)
);
-- Tabla Sedes hecha por Wilber
CREATE TABLE Sedes (
    id_sede INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(255)
);
-- tabla maestra Salones hecha por Carlos
CREATE TABLE Salones (
    id_salón INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    capacidad INT,
    id_sede INT,
    horario_m VARCHAR(50),
    nivel VARCHAR(15),
    FOREIGN KEY (id_sede) REFERENCES Sedes(id_sede)
);

CREATE TABLE Horarios (
    id_horario INT AUTO_INCREMENT PRIMARY KEY,
    dia_semana VARCHAR(20),
    hora_inicio TIME,
    hora_fin TIME
);

CREATE TABLE Bancos (
    id_banco INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(255)
);

-- Tabla Alumnos creada por Wilber
CREATE TABLE Alumnos (
    id_alumno INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    fecha_nacimiento DATE,
    id_carrera INT,
    FOREIGN KEY (id_carrera) REFERENCES Carreras(id_carrera)
);
-- tabla Cursos creada por Wilber
CREATE TABLE Cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    id_maestro INT,
    id_salón INT,
    id_horario INT,
    FOREIGN KEY (id_maestro) REFERENCES Maestros(id_maestro),
    FOREIGN KEY (id_salón) REFERENCES Salones(id_salón),
    FOREIGN KEY (id_horario) REFERENCES Horarios(id_horario)
);

CREATE TABLE Notas (
    id_nota INT AUTO_INCREMENT PRIMARY KEY,
    id_alumno INT,
    id_curso INT,
    nota DECIMAL(4,2),
    FOREIGN KEY (id_alumno) REFERENCES Alumnos(id_alumno),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);

CREATE TABLE Pagos (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_alumno INT,
    id_banco INT,
    monto DECIMAL(10,2),
    fecha_pago DATE,
    FOREIGN KEY (id_alumno) REFERENCES Alumnos(id_alumno),
    FOREIGN KEY (id_banco) REFERENCES Bancos(id_banco)
);
