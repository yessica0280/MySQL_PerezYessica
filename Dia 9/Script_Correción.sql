CREATE DATABASE ventas_t2;

USE ventas_t2;

CREATE TABLE cliente (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  ciudad VARCHAR(100),
  categoria INT UNSIGNED
);

CREATE TABLE comercial (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  comision FLOAT
);

CREATE TABLE pedido (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  total DOUBLE NOT NULL,
  fecha DATE,
  id_cliente INT UNSIGNED NOT NULL,
  id_comercial INT UNSIGNED NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES cliente(id),
  FOREIGN KEY (id_comercial) REFERENCES comercial(id)
);

INSERT INTO cliente (id, nombre, apellido1, apellido2, ciudad, categoria) VALUES
(1, 'Carlos', 'Martínez', 'González', 'Madrid', 100),
(2, 'Lucía', 'Pérez', 'Fernández', 'Barcelona', 200),
(3, 'Ricardo', 'Gómez', 'López', 'Valencia', NULL),
(4, 'Ana', 'Díaz', 'Sánchez', 'Sevilla', 300),
(5, 'Sofía', 'Ramírez', 'Moreno', 'Zaragoza', 200),
(6, 'Juan', 'López', 'García', 'Bilbao', 100),
(7, 'Beatriz', 'González', 'Rodríguez', 'Málaga', 300),
(8, 'David', 'Martínez', 'Hernández', 'Alicante', 200),
(9, 'Pedro', 'Ruiz', 'Santos', 'Palma de Mallorca', 225),
(10, 'Laura', 'Vázquez', 'Pérez', 'Murcia', 125);

INSERT INTO comercial (id, nombre, apellido1, apellido2, comision) VALUES
(1, 'Antonio', 'Vega', 'Pérez', 0.18),
(2, 'Isabel', 'Moreno', 'Sánchez', 0.15),
(3, 'Javier', 'Fernández', 'Martín', 0.14),
(4, 'Elena', 'Hernández', 'Díaz', 0.13),
(5, 'Ricardo', 'Martínez', 'Gómez', 0.12),
(6, 'Laura', 'Sánchez', 'López', 0.10),
(7, 'Marta', 'Rodríguez', 'García', 0.11),
(8, 'Francisco', 'Gómez', 'Ruiz', 0.09);

INSERT INTO pedido (id, total, fecha, id_cliente, id_comercial) VALUES
(1, 350.75, '2024-02-15', 5, 2),
(2, 1200.50, '2024-03-01', 1, 5),
(3, 530.10, '2024-01-22', 2, 1),
(4, 800.20, '2023-12-14', 8, 3),
(5, 5000.00, '2023-11-30', 5, 2),
(6, 2200.99, '2023-10-25', 7, 1),
(7, 6000.50, '2023-09-10', 2, 1),
(8, 1900.30, '2023-08-21', 4, 6),
(9, 2300.45, '2023-07-10', 8, 3),
(10, 280.95, '2023-06-15', 8, 2),
(11, 150.60, '2023-05-17', 3, 7),
(12, 2500.99, '2024-04-05', 2, 1),
(13, 550.80, '2023-11-18', 6, 1),
(14, 135.75, '2023-10-25', 6, 1),
(15, 480.45, '2024-05-12', 1, 5),
(16, 1200.60, '2024-06-03', 1, 5);

-- Consultas. 
-- 1. Obtener el total de pedidos realizados por un cliente. 
select * from pedido;

delimiter //
create function total_pedidos(cliente_id int) 
returns int deterministic
begin
    declare total int;
    select count(pedido.id_cliente) into total from pedido inner join cliente on pedido.id_cliente = cliente.id where pedido.id_cliente = cliente_id;
    return total;
end //
delimiter ;
select total_pedidos(1) as total_pedidos;

-- 2. Calcular la comisión total ganada por un comercial. 
select * from comercial;
delimiter //
create function comision_total(comercial_id int) 
returns int deterministic
begin
    declare comision_total int;
    select sum(p.total * c.comision) into comision_total from pedido p inner join comercial c on p.id_comercial = c.id 
    where p.id_comercial = comercial_id;
    return comision_total;
end //
delimiter ;
select comision_total(1) as comision_total_comercial;

-- 3. Obtener el cliente con mayor total en pedidos.
select * from cliente;
select * from pedido;
-- drop function cliente_mayor_total;
delimiter //
create function cliente_mayor_total()
returns varchar(50) deterministic
begin
    declare cliente_id varchar(50);
    select cliente.nombre into cliente_id from pedido inner join cliente on cliente.id = pedido.id_cliente order by pedido.total desc limit 1;
    return cliente_id;
end //
delimiter ;
select cliente_mayor_total() as cliente_mayor_total;

-- 4. Contar la cantidad de pedidos realizados en un año específico. 
select * from pedido;
describe pedido;
delimiter // 
create function pedidos_por_ano(fechas int) 
returns int deterministic
begin
    declare cantidad_pedidos int;
    select count(*) into cantidad_pedidos from pedido where year(fecha) = fechas;
    return cantidad_pedidos;
end //
delimiter ;
select pedidos_por_ano(2024) as cantidad_pedidos;

-- 5. Obtener el promedio de total de pedidos por clientes.
select * from pedido;
-- drop function promedio_pedidos_cliente;
delimiter //
create function promedio_pedidos_cliente( promedio_cliente decimal(10, 2))
returns decimal(10, 2) deterministic
begin
    declare promedio decimal(10,2);
    set promedio = avg(promedio_cliente);
    return promedio;
end //
delimiter ;
select cliente.nombre, sum(pedido.total) as pedido_total from pedido inner join cliente on cliente.id = pedido.id_cliente group by 1;