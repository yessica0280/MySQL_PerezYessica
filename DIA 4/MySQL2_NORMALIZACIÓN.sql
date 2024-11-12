-- La dificultad de hacer una relación adecuada entre dos o más tablas.
-- Hizo que surgiera la utilización de JOINS.

-- JOINS:Se encarga de unir tablas entre si(dos o más).


create database joins_t2;

use joins_t2;

CREATE TABLE departamento (
    codigo INT PRIMARY KEY,
    nombre VARCHAR(50),
    presupuesto DECIMAL(10, 2)
);

CREATE TABLE empleado (
    codigo INT PRIMARY KEY,
    nif VARCHAR(10),
    nombre VARCHAR(50),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    codigo_departamento INT,
    FOREIGN KEY (codigo_departamento) REFERENCES departamento(codigo)
);

INSERT INTO departamento (codigo, nombre, presupuesto) VALUES
(1, 'Desarrollo', 120000),
(2, 'Sistemas', 150000),
(3, 'Recursos Humanos', 280000);

INSERT INTO empleado (codigo, nif, nombre, apellido1, apellido2, codigo_departamento) VALUES
(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1),
(2, 'Y557632D', 'Adela', 'Salas', 'Díaz', 2),
(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);

-- Producto cartesiano de las tablas empleado y departamento. 
select * from empleado,departamento;

-- Operación de intersección.
select *  from empleado, departamento where empleado.codigo_departamento = departamento.codigo;

-- Operación de intersección con INNER JOIN y ON. 
select * from empleado inner join departamento on empleado.codigo_departamento = departamento.codigo;

-- Operación de intersección con INNER JOIN y USING. 
select * from empleado inner join departamento using (codigo);


insert into empleado (codigo, nif, nombre, apellido1, apellido2, codigo_departamento) values
(4, 'R6977642A', 'Luis', 'Henao', 'Flores', null);
insert into departamento (codigo, nombre, presupuesto) values ('4', 'Academico', 12800000);
-- Operación de intersección LEFT y ON. 
select * from empleado left join departamento on empleado.codigo_departamento = departamento.codigo;
select * from empleado right join departamento on empleado.codigo_departamento = departamento.codigo;