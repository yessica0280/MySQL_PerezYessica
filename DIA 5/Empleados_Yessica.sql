create database funcione_t2;

use funcione_t2;

-- ¿Que es una función detarerministica y una función no deterministica?
-- Función deterministica: Siempre devuelven el mismo resultado para los mismos valores de entrada.
-- Función no deterministica: Producen resultados diferentes incluso con los mismos valores de entrada. 
-- Crear una función para calcular el area de un circulo. 
delimiter // 
create function areacirculo(radio double)
returns double deterministic
begin
    declare area double;  -- Crea una variable interna
    set area = 3.14 * radio*radio;
    return area;
end // 
delimiter ;

-- Utilizar una función.
select areacirculo(3);


-- Tabla de experimentos.
create table productos (
id int auto_increment,
nombre varchar(100),
precio decimal(10,2),
primary key (id)
);

INSERT INTO productos (nombre, precio) VALUES
('Laptop', 899.99),
('Smartphone', 499.99),
('Tablet', 299.99),
('Smartwatch', 199.99),
('Auriculares', 59.99),
('Cámara digital', 349.99),
('Televisor', 749.99),
('Refrigerador', 599.99),
('Microondas', 99.99),
('Lavadora', 499.99),
('Secadora', 450.00),
('Cafetera', 69.99),
('Licuadora', 45.99),
('Batidora', 35.99),
('Estufa', 249.99),
('Plancha', 29.99),
('Ventilador', 39.99),
('Aspiradora', 120.00),
('Bicicleta', 220.00),
('Coche eléctrico', 15000.00),
('Mochila', 40.00),
('Maletín de viaje', 89.99),
('Reloj de pulsera', 120.00),
('Zapatos deportivos', 70.00),
('Camiseta', 19.99),
('Pantalón de mezclilla', 39.99),
('Chaqueta', 59.99),
('Gorra', 14.99),
('Bufanda', 18.99),
('Guantes', 12.99),
('Pantalones cortos', 24.99),
('Sombrero', 22.00),
('Botas', 80.00),
('Silla ergonómica', 150.00),
('Escritorio', 199.99),
('Estante para libros', 30.00),
('Lámpara de escritorio', 25.99),
('Espejo', 45.00),
('Cama', 350.00),
('Colchón', 250.00),
('Almohada', 19.99),
('Edredón', 60.00),
('Ropa de cama', 39.99),
('Toalla', 9.99),
('Jabón', 2.99),
('Champú', 4.99),
('Pasta de dientes', 1.99),
('Cepillo de dientes', 3.99),
('Desodorante', 3.49),
('Crema corporal', 6.99),
('Reloj despertador', 25.00),
('Termo', 14.99),
('Manta', 40.00),
('Cortinas', 29.99),
('Alfombra', 79.99),
('Papel higiénico', 1.99),
('Tetera', 29.00),
('Horno eléctrico', 99.99),
('Cuchillos de cocina', 39.99),
('Tenedor', 3.99),
('Cucharas', 2.99),
('Plato', 4.50),
('Vaso', 1.99),
('Copa de vino', 5.00),
('Set de té', 18.99),
('Reloj de pared', 45.00),
('Foto enmarcada', 19.99),
('Adorno de mesa', 15.00),
('Cuadro decorativo', 39.99),
('Planta artificial', 12.00),
('Vaso decorativo', 8.50),
('Cojín', 15.99),
('Lámpara de pie', 80.00),
('Sofá', 500.00),
('Mesa de comedor', 250.00),
('Sillas de comedor', 100.00),
('Cafetera espresso', 159.99),
('Freidora de aire', 99.99),
('Cocina de inducción', 129.00),
('Set de cuchillos', 75.00),
('Termómetro digital', 12.00),
('Báscula', 30.00),
('Secador de cabello', 24.99),
('Plancha de pelo', 19.99),
('Pañuelo', 6.99),
('Cinta métrica', 3.00),
('Destornillador', 5.00),
('Martillo', 10.00),
('Llave inglesa', 7.99),
('Alicate', 6.00),
('Caja de herramientas', 50.00),
('Pistola de silicona', 8.00),
('Pegamento', 1.50),
('Cinta adhesiva', 2.00),
('Gafas de sol', 15.00),
('Lentes de sol', 12.00),
('Mochila escolar', 30.00),
('Carpeta', 3.50),
('Lápiz', 1.00),
('Bolígrafo', 2.00),
('Marcador', 1.99),
('Resaltadores', 4.00),
('Agenda', 9.99),
('Cuaderno', 2.50),
('Papel para impresora', 3.99),
('Cartuchos de tinta', 20.00),
('Calculadora', 12.00),
('Impresora', 89.99),
('Escáner', 70.00),
('Webcam', 35.00),
('Microfono', 40.00),
('Parlantes', 50.00),
('Teclado inalámbrico', 25.00),
('Ratón inalámbrico', 18.00),
('Mochila para laptop', 40.00),
('Cargador portátil', 15.00),
('Cable USB', 3.00),
('Adaptador HDMI', 10.00),
('Alimentador para laptop', 25.00),
('Batería externa', 20.00),
('Funda para celular', 9.99),
('Pantalla táctil', 99.99),
('Soporte para celular', 7.99),
('Peluche', 15.00),
('Juguete para niños', 10.00),
('Puzzles', 8.00),
('Muñeca', 18.99),
('Triciclo', 40.00),
('Patinete', 60.00),
('Bicicross', 150.00),
('Pelota', 9.99),
('Raqueta de tenis', 29.99),
('Bola de fútbol', 19.99),
('Balón de baloncesto', 22.00),
('Equipo de golf', 99.00),
('Bate de béisbol', 19.99),
('Guantes de béisbol', 18.00),
('Pelota de béisbol', 5.00),
('Casco de ciclismo', 29.99),
('Guantes de ciclismo', 14.99),
('Chaleco reflectante', 19.00),
('Gafas de ciclismo', 9.99),
('Camiseta de ciclismo', 25.00),
('Pantalones de ciclismo', 30.00),
('Sillín de bicicleta', 45.00);

-- Función que calcule el iva de los productos. 
delimiter //
create function totaliva(precio decimal(10,2), tasaiva decimal(5,2))
returns decimal(10,2) deterministic
begin
    return precio+ (precio*tasaiva);
end //
delimiter ;

select nombre, totaliva(precio,0.19) as precioconiva from productos;
-- drop function if exists totaliva;

-- Función que calcule el iva de los productos (no deterministica). 
delimiter //
create function totalivarand(precio decimal(10,2))
returns decimal(10,2) deterministic
begin
    return precio+ (precio*rand());
end //
delimiter ;

select totalivarand(12);

CREATE TABLE ordenes (
    id INT auto_increment,
    cliente_id INT,
    precio DECIMAL(10,2),
    categoria_cliente VARCHAR(10),
    PRIMARY KEY (id)
);


INSERT INTO ordenes (cliente_id, precio, categoria_cliente) VALUES
(1, 120.99, 'Normal'),
(2, 540.50, 'Premium'),
(3, 320.75, 'Normal'),
(4, 15.99, 'Normal'),
(10, 799.90, 'Premium'),
(6, 29.99, 'Normal'),
(7, 45.50, 'Normal'),
(8, 1025.00, 'VIP'),
(9, 220.00, 'Normal'),
(10, 145.50, 'Premium'),
(11, 690.00, 'VIP'),
(10, 420.75, 'Premium'),
(13, 15.50, 'Normal'),
(14, 100.00, 'Normal'),
(15, 567.80, 'VIP'),
(16, 99.99, 'Normal'),
(17, 399.99, 'Premium'),
(18, 30.00, 'Normal'),
(19, 890.00, 'VIP'),
(20, 135.40, 'Premium'),
(21, 250.00, 'Normal'),
(22, 50.25, 'Normal'),
(23, 980.50, 'VIP'),
(24, 765.90, 'Premium'),
(25, 205.60, 'Normal'),
(26, 610.10, 'VIP'),
(27, 145.25, 'Normal'),
(28, 33.10, 'Normal'),
(29, 499.99, 'Premium'),
(30, 789.99, 'VIP'),
(31, 105.75, 'Normal'),
(32, 450.00, 'Premium'),
(33, 15.00, 'Normal'),
(34, 879.99, 'VIP'),
(35, 155.20, 'Normal'),
(36, 369.00, 'Premium'),
(37, 240.40, 'Normal'),
(38, 1325.50, 'VIP'),
(39, 67.89, 'Normal'),
(40, 799.95, 'Premium'),
(41, 215.75, 'Normal'),
(42, 940.80, 'VIP'),
(43, 55.00, 'Normal'),
(44, 520.00, 'Premium'),
(45, 820.60, 'VIP'),
(46, 80.99, 'Normal'),
(47, 275.45, 'Premium'),
(48, 1320.00, 'VIP'),
(49, 99.95, 'Normal'),
(50, 629.90, 'Premium'),
(51, 555.00, 'VIP'),
(52, 399.00, 'Normal'),
(53, 123.45, 'Premium'),
(54, 215.00, 'Normal'),
(55, 870.25, 'VIP'),
(56, 249.99, 'Normal'),
(57, 339.60, 'Premium'),
(58, 125.20, 'Normal'),
(59, 725.30, 'VIP'),
(60, 899.00, 'Premium'),
(61, 25.50, 'Normal'),
(62, 540.70, 'Premium'),
(63, 156.50, 'Normal'),
(64, 950.00, 'VIP'),
(65, 640.40, 'Premium'),
(66, 185.70, 'Normal'),
(67, 550.99, 'Premium'),
(68, 720.00, 'VIP'),
(69, 1000.00, 'Premium'),
(70, 400.00, 'Normal'),
(71, 705.10, 'VIP'),
(72, 110.50, 'Normal'),
(73, 890.25, 'Premium'),
(74, 167.99, 'Normal'),
(75, 315.80, 'Premium'),
(76, 120.00, 'VIP'),
(77, 630.50, 'Premium'),
(78, 50.00, 'Normal'),
(79, 300.00, 'Premium'),
(80, 755.00, 'VIP'),
(81, 130.20, 'Normal'),
(82, 430.00, 'Premium'),
(83, 175.60, 'Normal'),
(84, 325.90, 'Premium'),
(85, 950.50, 'VIP'),
(86, 255.75, 'Normal'),
(87, 550.20, 'Premium'),
(88, 770.00, 'VIP'),
(89, 300.00, 'Normal'),
(90, 400.00, 'Premium'),
(91, 580.00, 'VIP'),
(92, 670.00, 'Normal'),
(93, 745.00, 'Premium'),
(94, 890.90, 'VIP'),
(95, 270.50, 'Normal'),
(96, 369.80, 'Premium'),
(97, 455.60, 'Normal'),
(98, 510.00, 'VIP'),
(99, 165.00, 'Normal'),
(100, 720.00, 'Premium');





delimiter //
create function ingreso_promedio_cliente (cliente_id_interno int)
returns decimal(10,2)
deterministic
begin
    declare ingreso decimal(10,2);
    select avg(precio) into ingreso from ordenes where cliente_id_interno = cliente_id;
    return ingreso;
end //
delimiter ;

select ingreso_promedio_cliente (10);

-- Trabajo.
CREATE TABLE departamento (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
presupuesto DOUBLE UNSIGNED NOT NULL,
gastos DOUBLE UNSIGNED NOT NULL
); 

CREATE TABLE empleado (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nif VARCHAR(9) NOT NULL UNIQUE,
nombre VARCHAR(100) NOT NULL,
apellido1 VARCHAR(100) NOT NULL,
apellido2 VARCHAR(100),
id_departamento INT UNSIGNED,
FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);

INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero', NULL);


-- 1. Lista el primer apellido de todos los empleados.
select apellido1 from empleado;

-- 2. Lista el primer apellido de los empleados eliminando los apellidos que estén repetidos.
select distinct apellido1 from empleado;

-- 3. Lista todas las columnas de la tabla empleado.
select * from empleado;

-- 4. Lista el nombre y los apellidos de todos los empleados.
select nombre, apellido1, apellido2 from empleado;

-- 5. Lista el identificador de los departamentos de los empleados que aparecen
-- en la tabla empleado.
select id_departamento from empleado;

-- 6. Lista el identificador de los departamentos de los empleados que aparecen
-- en la tabla empleado, eliminando los identificadores que aparecen repetidos.
select distinct id_departamento from empleado;

-- 7. Lista el nombre y apellidos de los empleados en una única columna.
select concat(nombre, ' ', apellido1, ' ', coalesce(`apellido2`, '')) from empleado;

-- 8. Lista el nombre y apellidos de los empleados en una única columna,
-- convirtiendo todos los caracteres en mayúscula.
select upper(concat(nombre, ' ', apellido1, ' ', coalesce(`apellido2`, ''))) as Nombre_apellidos from empleado;

-- 9. Lista el nombre y apellidos de los empleados en una única columna,
-- convirtiendo todos los caracteres en minúscula.
select lower(concat(nombre, ' ', apellido1, ' ', coalesce(`apellido2`, ''))) as nombre_apellido from empleado;

-- 10. Lista el identificador de los empleados junto al nif, pero el nif deberá
-- aparecer en dos columnas, una mostrará únicamente los dígitos del nif y la
-- otra la letra.
select id, substring(nif, 1, 8) as nif_numero, substring(nif, 9, 1) as nif_letra from empleado;
select id, regexp_replace(nif, '[^A-Z]','') as letras, regexp_replace(nif, '[^0-9]','') from empleado; 

-- 11. Lista el nombre de cada departamento y el valor del presupuesto actual del
-- que dispone. Para calcular este dato tendrá que restar al valor del
-- presupuesto inicial (columna presupuesto) los gastos que se han generado
-- (columna gastos). Tenga en cuenta que en algunos casos pueden existir
-- valores negativos. Utilice un alias apropiado para la nueva columna columna
-- que está calculando.
delimiter //
create function calcular_presupuesto_actual(id_departamento int) 
returns double
deterministic
begin
    declare presupuesto_inicial double;
    declare gastos double;
    select  presupuesto, gastos
    into presupuesto_inicial, gastos;
    return (presupuesto_inicial - gastos);
end //
delimiter ;

select nombre as departamento,(presupuesto - gastos) as presupuesto_actual from departamento;

-- 12. Lista el nombre de los departamentos y el valor del presupuesto actual
-- ordenado de forma ascendente.
select nombre, presupuesto as presupesto_actual from departamento order by presupesto_actual asc;

-- 13. Lista el nombre de todos los departamentos ordenados de forma
-- ascendente.
select nombre from departamento order by 1 asc;

-- 14. Lista el nombre de todos los departamentos ordenados de forma
-- descendente.
select nombre from departamento order by 1 desc;

-- 15. Lista los apellidos y el nombre de todos los empleados, ordenados de forma
-- alfabética tendiendo en cuenta en primer lugar sus apellidos y luego su nombre.
select apellido1, apellido2, nombre from empleado order by apellido1 asc, apellido2 asc, nombre asc;

-- 16. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos
-- que tienen mayor presupuesto.
select nombre, presupuesto from departamento order by presupuesto desc limit 3;

-- 17. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos
-- que tienen menor presupuesto.
select nombre, presupuesto from departamento order by presupuesto asc limit 3;

-- 18. Devuelve una lista con el nombre y el gasto, de los 2 departamentos que
-- tienen mayor gasto.
select nombre, gastos from departamento order by gastos desc limit 2;

-- 19. Devuelve una lista con el nombre y el gasto, de los 2 departamentos que
-- tienen menor gasto.
select nombre, gastos from departamento order by gastos asc limit 2;

-- 20. Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado. La
-- tercera fila se debe incluir en la respuesta. La respuesta debe incluir todas las
-- columnas de la tabla empleado.
select * from empleado;
select * from empleado limit 5 offset 2;

-- 21. Devuelve una lista con el nombre de los departamentos y el presupuesto, de
-- aquellos que tienen un presupuesto mayor o igual a 150000 euros.
select nombre as nombre_departamento, presupuesto from departamento where presupuesto >= 150000;

-- 22. Devuelve una lista con el nombre de los departamentos y el gasto, de
-- aquellos que tienen menos de 5000 euros de gastos.
select nombre as nombre_departamento, gastos from departamento where gastos < 5000;

-- 23. Devuelve una lista con el nombre de los departamentos y el presupuesto, de
-- aquellos que tienen un presupuesto entre 100000 y 200000 euros. Sin
-- utilizar el operador BETWEEN.
select nombre as nombre_departamento, presupuesto from departamento where presupuesto >= 100000 and presupuesto <= 200000;

-- 24. Devuelve una lista con el nombre de los departamentos que no tienen un
-- presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
select nombre as nombre_departamento, presupuesto from departamento where presupuesto < 100000 or presupuesto > 200000;

-- 25. Devuelve una lista con el nombre de los departamentos que tienen un
-- presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
select nombre as nombre_departamento, presupuesto from departamento where presupuesto between '100000' and '200000';

-- 26. Devuelve una lista con el nombre de los departamentos que no tienen un
-- presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
select nombre as nombre_departamento, presupuesto from departamento where presupuesto not between 100000 and 200000;

-- 27. Devuelve una lista con el nombre de los departamentos, gastos y
-- presupuesto, de aquellos departamentos donde los gastos sean mayores
-- que el presupuesto del que disponen.
select nombre as departamento, gastos, presupuesto from departamento where gastos > presupuesto;

-- 28. Devuelve una lista con el nombre de los departamentos, gastos y
-- presupuesto, de aquellos departamentos donde los gastos sean menores
-- que el presupuesto del que disponen.
select nombre as departamento, gastos, presupuesto from departamento where gastos < presupuesto;

-- 29. Devuelve una lista con el nombre de los departamentos, gastos y
-- presupuesto, de aquellos departamentos donde los gastos sean iguales al
-- presupuesto del que disponen.
select nombre as departamento, gastos, presupuesto from departamento where gastos = presupuesto;

-- 30. Lista todos los datos de los empleados cuyo segundo apellido sea NULL.
select * from empleado where apellido2 is null;

-- 31. Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.
select * from empleado where apellido2 is not null;

-- 32. Lista todos los datos de los empleados cuyo segundo apellido sea López.
select * from empleado where apellido2 = 'López';

-- 33. Lista todos los datos de los empleados cuyo segundo apellido
-- sea Díaz o Moreno. Sin utilizar el operador IN.
select * from empleado where apellido2 = 'Díaz' or apellido2 = 'Moreno';

-- 34. Lista todos los datos de los empleados cuyo segundo apellido
-- sea Díaz o Moreno. Utilizando el operador IN.
select * from empleado where apellido2 in ('Díaz', 'Moreno');

-- 35. Lista los nombres, apellidos y nif de los empleados que trabajan en el
-- departamento 3.
select nombre, apellido1, apellido2, nif from empleado where id_departamento = 3;

-- 36. Lista los nombres, apellidos y nif de los empleados que trabajan en los
-- departamentos 2, 4 o 5.
select nombre, apellido1, apellido2, nif from empleado where id_departamento in (2,4,5);

-- consultas multitabla (composición interna).
-- 1. Devuelve un listado con los empleados y los datos de los departamentos
-- donde trabaja cada uno.
select * from empleado inner join departamento on empleado.id_departamento = departamento.id;

-- 2. Devuelve un listado con los empleados y los datos de los departamentos
-- donde trabaja cada uno. Ordena el resultado, en primer lugar por el nombre
-- del departamento (en orden alfabético) y en segundo lugar por los apellidos
-- y el nombre de los empleados.
select empleado.id, empleado.nif, empleado.nombre, empleado.apellido1, empleado.apellido2, departamento.id, departamento.nombre,
departamento.presupuesto, departamento.gastos from empleado inner join departamento on empleado.id_departamento = departamento.id 
order by departamento.nombre asc, empleado.apellido1 asc, empleado.apellido2 asc, empleado.nombre asc;

-- 3. Devuelve un listado con el identificador y el nombre del departamento,
-- solamente de aquellos departamentos que tienen empleados.
select departamento.id, departamento.nombre as nombre_departamento from departamento inner join empleado 
on departamento.id = empleado.id_departamento group by departamento.id, departamento.nombre;

-- 4. Devuelve un listado con el identificador, el nombre del departamento y el
-- valor del presupuesto actual del que dispone, solamente de aquellos
-- departamentos que tienen empleados. El valor del presupuesto actual lo
-- puede calcular restando al valor del presupuesto inicial
-- (columna presupuesto) el valor de los gastos que ha generado (columna gastos).
select departamento.id, departamento.nombre, (departamento.presupuesto - departamento.gastos) as presupuesto_actual from departamento
inner join empleado on departamento.id = empleado.id_departamento 
group by departamento.id, departamento.nombre, departamento.presupuesto, departamento.gastos;

-- 5. Devuelve el nombre del departamento donde trabaja el empleado que tiene
-- el nif 38382980M.
select departamento.nombre from empleado inner join departamento on empleado.id_departamento = departamento.id where empleado.nif = '38382980M';

-- 6. Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz
-- Santana.
select departamento.nombre from empleado inner join departamento on empleado.id_departamento = departamento.id 
where empleado.nombre = 'Pepe' and empleado.apellido1 = 'Ruiz' and empleado.apellido2 = 'Santana';

-- 7. Devuelve un listado con los datos de los empleados que trabajan en el
-- departamento de I+D. Ordena el resultado alfabéticamente.
select empleado.id, empleado.nif, empleado.nombre, empleado.apellido1, empleado.apellido2, empleado.id_departamento from empleado 
inner join departamento on empleado.id_departamento = departamento.id 
where departamento.nombre = 'I+D' order by empleado.apellido1 asc, empleado.apellido2 asc, empleado.nombre asc;

-- 8. Devuelve un listado con los datos de los empleados que trabajan en el
-- departamento de Sistemas, Contabilidad o I+D. Ordena el resultado
-- alfabéticamente.
select empleado.id, empleado.nif, empleado.nombre, empleado.apellido1, empleado.apellido2, empleado.id_departamento from empleado 
inner join departamento on empleado.id_departamento = departamento.id 
where departamento.nombre in ('Sistemas', 'Contabilidad', 'I+D') order by empleado.apellido1 asc, empleado.apellido2 asc, empleado.nombre asc;

-- 9. Devuelve una lista con el nombre de los empleados que tienen los
-- departamentos que no tienen un presupuesto entre 100000 y 200000 euros.
select empleado.nombre from empleado inner join departamento on empleado.id_departamento = departamento.id 
where departamento.presupuesto < 100000 or departamento.presupuesto > 200000;

-- 10. Devuelve un listado con el nombre de los departamentos donde existe
-- algún empleado cuyo segundo apellido sea NULL. Tenga en cuenta que no
-- debe mostrar nombres de departamentos que estén repetidos. 
select departamento.nombre from empleado inner join departamento on empleado.id_departamento = departamento.id 
where empleado.apellido2 is null;

-- Consultas multitable (Composición externa).
-- 1. Devuelve un listado con todos los empleados junto con los datos de los
-- departamentos donde trabajan. Este listado también debe incluir los
-- empleados que no tienen ningún departamento asociado. 
select empleado.id, empleado.nif, empleado.nombre, empleado.apellido1, empleado.apellido2, empleado.id_departamento, departamento.nombre,
departamento.presupuesto, departamento.gastos from empleado left join departamento on empleado.id_departamento = departamento.id;

-- 2. Devuelve un listado donde sólo aparezcan aquellos empleados que no
-- tienen ningún departamento asociado.
select * from empleado where empleado.id_departamento is null;

-- 3. Devuelve un listado donde sólo aparezcan aquellos departamentos que no
-- tienen ningún empleado asociado.
select departamento.id, departamento.nombre, departamento.presupuesto, departamento.gastos from departamento 
left join empleado on departamento.id = empleado.id_departamento where empleado.id_departamento is null;

-- 4. Devuelve un listado con todos los empleados junto con los datos de los
-- departamentos donde trabajan. El listado debe incluir los empleados que no
-- tienen ningún departamento asociado y los departamentos que no tienen
-- ningún empleado asociado. Ordene el listado alfabéticamente por el
-- nombre del departamento.
select empleado.id, empleado.nif, empleado.nombre,empleado.apellido1, empleado.apellido2, empleado.id_departamento,
departamento.id, departamento.nombre as departamento_nombre, departamento.presupuesto, departamento.gastos from empleado left join departamento
on empleado.id_departamento = departamento.id union select empleado.id, empleado.nif, empleado.nombre, empleado.apellido1, empleado.apellido2, empleado.id_departamento, 
departamento.id, departamento.nombre as departamento_nombre, departamento.presupuesto, departamento.gastos from departamento left join empleado 
on empleado.id_departamento = departamento.id where empleado.id_departamento is null order by departamento_nombre asc;

-- 5. Devuelve un listado con los empleados que no tienen ningún departamento
-- asociado y los departamentos que no tienen ningún empleado asociado.
-- Ordene el listado alfabéticamente por el nombre del departamento.
select empleado.id, empleado.nif, empleado.nombre, empleado.apellido1, empleado.apellido2, empleado.id_departamento,
null as departamento_id, null as departamento_nombre, null as presupuesto, null as gastos from empleado where empleado.id_departamento is null
union select  null as empleado_id, null as nif, null as empleado_nombre, null as apellido1, null as apellido2, null as id_departamento,
departamento.id, departamento.nombre as departamento_nombre, departamento.presupuesto, departamento.gastos from departamento where not exists (select 1 from empleado 
where empleado.id_departamento = departamento.id) order by departamento_nombre asc;

-- Consultas resumen
-- 1. Calcula la suma del presupuesto de todos los departamentos.
select sum(presupuesto) as presupuesto from departamento;

-- 2. Calcula la media del presupuesto de todos los departamentos.
select avg(presupuesto) as presupuesto from departamento;

-- 3. Calcula el valor mínimo del presupuesto de todos los departamentos.
select min(presupuesto) as presupuesto from departamento;

-- 4. Calcula el nombre del departamento y el presupuesto que tiene asignado,
-- del departamento con menor presupuesto.
select nombre as nombre_departamento, presupuesto from departamento where presupuesto = (select min(presupuesto) from departamento);

-- 5. Calcula el valor máximo del presupuesto de todos los departamentos.
select max(presupuesto) as presupuesto from departamento;

-- 6. Calcula el nombre del departamento y el presupuesto que tiene asignado,
-- del departamento con mayor presupuesto.
select nombre as nombre_departamento, presupuesto from departamento where presupuesto = (select max(presupuesto) from departamento);

-- 7. Calcula el número total de empleados que hay en la tabla empleado.
select count(*) as empleados from empleado;

-- 8. Calcula el número de empleados que no tienen NULL en su segundo apellido.
select count(*) as empleados from empleado where apellido2 is not null;

-- 9. Calcula el número de empleados que hay en cada departamento. Tienes que
-- devolver dos columnas, una con el nombre del departamento y otra con el
-- número de empleados que tiene asignados.
select departamento.nombre, count(empleado.id) as empleados from departamento left join empleado 
on departamento.id = empleado.id_departamento group by departamento.id;

-- 10. Calcula el nombre de los departamentos que tienen más de 2 empleados. El
-- resultado debe tener dos columnas, una con el nombre del departamento y
-- otra con el número de empleados que tiene asignados.
select departamento.nombre, count(empleado.id) as empleados from departamento left join empleado on departamento.id = empleado.id_departamento
group by departamento.id having count(empleado.id) > 2;

-- 11. Calcula el número de empleados que trabajan en cada uno de los
-- departamentos. El resultado de esta consulta también tiene que incluir
-- aquellos departamentos que no tienen ningún empleado asociado.
select departamento.nombre, count(empleado.id) as empleados from departamento left join empleado on departamento.id = empleado.id_departamento 
group by departamento.id;

-- 12. Calcula el número de empleados que trabajan en cada unos de los
-- departamentos que tienen un presupuesto mayor a 200000 euros.
select departamento.nombre, count(empleado.id) as empleados from departamento left join empleado on departamento.id = empleado.id_departamento 
where departamento.presupuesto > 200000 group by departamento.id;