CREATE DATABASE  IF NOT EXISTS control_estudiantes;
USE control_estudiantes;

DROP TABLE IF EXISTS control_estudiantes;

CREATE TABLE estudiante (
  id_estudiante INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(45),
  apellido VARCHAR(45),
  email VARCHAR(45),
  telefono VARCHAR(8),
  saldo DOUBLE,
  PRIMARY KEY (id_estudiante)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO estudiante (nombre, apellido, email, telefono, saldo) VALUES ('Jorge', 'Pérez', 'jorgeluisperez@kinal.edu.gt', '12345678', '500');

INSERT INTO estudiante (nombre, apellido, email, telefono, saldo) VALUES ('Karla ', 'Gomez', 'kgomez@gmail.com', '56879658', '250');