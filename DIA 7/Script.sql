use Planificaciones_T2;

select * from sucursales;
-- 1.
select concat(nombre1, ' ',  ' ', coalesce(`apellido2`, '')) as Nombre_Apellido from empleados;

-- 2.
select upper(concat(nombre1, nombre2, apellido1, ' ', coalesce(`apellido2`, ''))) as Nombre_apellidos from empleados;

-- 3.
select id_sucursal from empleados;

-- 4. 
delimiter //
create function calcular_presupuesto_actual(id_alquiler int) 
returns double
deterministic
begin
    declare presupuesto_inicial double;
    declare valor_pagado double;
    select  valor_cotizado, valor_pagado
    into presupuesto_inicial, valor_pagado;
    return (presupuesto_inicial - valor_pagado);
end //
delimiter ;

select fecha_entrega as alquileres,(valor_cotizado - valor_pagado) as presupuesto_inicial from alquileres;

-- 5.
select fecha_entrega, valor_pagado as presupesto_actual from alquileres order by presupesto_actual asc;

-- 6.
select nombre1 from clientes order by 1 asc;

-- 7.
select apellido1, apellido2, nombre1, nombre2 from empleados order by apellido1 asc, apellido2 asc, nombre1 asc, nombre2 asc;

-- 8. 
delimiter //
create function fechas(id_descuentos int) 
returns double
deterministic
begin
    declare fecha double;
    declare fecha_inicio double;
    select  fecha_fin, fecha_inicio
    into fecha, fecha_inicio;
    return (fecha - fecha_inicio);
end //
delimiter ;

select id_tipo_vehiculo as tipo,(fecha_fin - fecha_inicio) as presupuesto from descuento;

-- 9. 
select nombre1, apellido1 from empleados order by nombre1 desc limit 3;

-- 10. 
select tipo, valor_alquiler_dia from tipo_vehiculo order by valor_alquiler_dia desc limit 10;

-- 11. 
select * from clientes limit 5 offset 2;

-- 12. 
select tipo, valor_alquiler_semana from tipo_vehiculo where valor_alquiler_semana >= 150000;

-- 13. 
DELIMITER $$

CREATE FUNCTION EstaEnRango(valor DECIMAL(10,2)) 
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    -- Verifica si el valor está dentro del rango de 110.00 a 210.00
    RETURN valor >= 110.00 AND valor <= 210.00;
END $$

DELIMITER ;

select valor_pagado from alquileres where valor_pagado >= 110.00 and valor_pagado <= 210.00;

-- 14. 
select fecha_entrega, fecha_esperada_entrega from alquileres where fecha_esperada_entrega = fecha_entrega;

-- 15. 
select * from vehiculos where sunroof is false;

-- 16. 
select * from clientes where apellido1 = 'Pérez';

-- 17. 
select empleados.id_empleado, empleados.nombre1, empleados.apellido1, empleados.apellido2, sucursales.id_sucursal, sucursales.ciudad
 from empleados inner join sucursales on empleados.id_sucursal = empleados.id_empleado 
order by sucursales.ciudad asc, empleados.apellido1 asc, empleados.apellido2 asc, empleados.id_empleado asc;

-- 18. 
delimiter //
create function Ahorros(valor_alquiler_semana double, valor_alquiler_dia double)
returns double
deterministic
begin 
    declare Ahorros double;
    set Ahorros = valor_alquiler_dia - (valor_alquiler_semana / 7 );
    return Ahorros;
end // 
delimiter ;
select tipo, (valor_alquiler_semana - valor_alquiler_dia) as Ahorros from tipo_vehiculo;

-- 19. 
select sum(valor_alquiler_dia) as presupuesto from tipo_vehiculo;

-- 20. 
select avg(valor_alquiler_semana) as presupuesto from tipo_vehiculo;

-- 21. 
select fecha_salida, valor_cotizado from alquileres where valor_cotizado = (select min(valor_cotizado) from alquileres);

-- 22. 
select count(*) as total_empleados from empleados where nombre1 = 'José';

-- 23. 
select count(*) as vehiculos from vehiculos where sunroof is false;

-- 24. 
select fecha_inicio, fecha_fin from descuento where fecha_fin > fecha_inicio;

-- 25. 
select lower(concat(nombre1, ' ', apellido1, ' ', coalesce(`apellido2`, ''))) as nombre_apellido from clientes;


-- PROCEDIMIENTOS. 
-- 1. Tabla tipo_vehiculo.
delimiter //
create procedure insertar_tipo_vehiculo(in tipo varchar(100), in valor_alquiler_dia decimal(10, 2), in valor_alquiler_semana decimal(10, 2))
begin
    insert into tipo_vehiculo (tipo, valor_alquiler_dia, valor_alquiler_semana)
    values (tipo, valor_alquiler_dia, valor_alquiler_semana);
end //
delimiter ;

call insertar_tipo_vehiculo('Sedán', 30000.00, 180000.00);

select * from tipo_vehiculo;


-- 2. Tabla vehiculos.
delimiter //
create procedure insertar_vehiculo(in id_tipo_vehiculo int, in id_sucursal int, in placa varchar(10), in referencia varchar(100),
in modelo varchar(4), in puertas int, in capacidad int, in sunroof boolean, in motor varchar(10), in color varchar(20))
begin
    insert into vehiculos (id_tipo_vehiculo, id_sucursal, placa, referencia, modelo, puertas, capacidad, sunroof, motor, color)
    values (id_tipo_vehiculo, id_sucursal, placa, referencia, modelo, puertas, capacidad, sunroof, motor, color);
end //
delimiter ;

call insertar_vehiculo(1, 1, 'ABC123', 'Sedán Toyota Corolla', '2020', 4, 5, TRUE, '1.8L', 'Blanco');

select * from vehiculos;

-- 3. Tabla clientes.
delimiter //
create procedure insertar_clientes_1(in cedula VARCHAR(20), in nombre1 VARCHAR(255), in nombre2 VARCHAR(255), in apellido1 VARCHAR(255),
    in apellido2 VARCHAR(255), in ubicacion VARCHAR(255), in ciudad VARCHAR(50), in celular VARCHAR(20), in correo_electronico VARCHAR(255))
begin
    insert into clientes (cedula, nombre1, nombre2, apellido1, apellido2, ubicacion, ciudad, celular, correo_electronico)
    VALUES (cedula, nombre1, nombre2, apellido1, apellido2, ubicacion, ciudad, celular, correo_electronico);
end //
delimiter ;

call insertar_clientes_1('1234567890', 'Juan', 'Carlos', 'Pérez', 'Gómez', 'Calle 123', 'Bogotá', '3001234567', 'juan@example.com');

select * from clientes;

-- 4. Tabla sucursales. 

delimiter //
create procedure insertar_sucursales_1(in ubicacion VARCHAR(255), in ciudad VARCHAR(50), in dirección VARCHAR(70),
    in telefono_fijo VARCHAR(20), in celular VARCHAR(20), in correo_electronico VARCHAR(255))
begin
    insert into sucursales (ubicacion, ciudad, dirección, telefono_fijo, celular, correo_electronico)
    values (ubicacion, ciudad, dirección, telefono_fijo, celular, correo_electronico);
end //
delimiter ;

call insertar_sucursales_1('Sucursal Centro', 'Bogotá', 'Calle 123', '6012345678', '3009876543', 'centro@ejemplo.com');

select * from sucursales;

-- 5. Tabla descuentos. 
delimiter //
create procedure insertar_descuento(in id_tipo_vehiculo INT, in fecha_inicio DATE, in fecha_fin DATE, in porcentaje_descuento DOUBLE)
begin
    insert into descuento (id_tipo_vehiculo, fecha_inicio, fecha_fin, porcentaje_descuento)
    values (id_tipo_vehiculo, fecha_inicio, fecha_fin, porcentaje_descuento);
end //
delimiter ;

call insertar_descuento(1, '2024-12-01', '2024-12-31', 15.0);

select * from descuento;

-- 6. Tabla empleados. 
delimiter //
create procedure insertar_empleado(in id_sucursal INT, in cedula VARCHAR(20), in nombre1 VARCHAR(255), in nombre2 VARCHAR(255),in apellido1 VARCHAR(255),
 in apellido2 VARCHAR(255), in ubicacion VARCHAR(255), in ciudad VARCHAR(50), in celular VARCHAR(20), in correo_electronico VARCHAR(255))
begin
    insert into empleados (id_sucursal, cedula, nombre1, nombre2, apellido1, apellido2, ubicacion, ciudad, celular, correo_electronico)
    values (id_sucursal, cedula, nombre1, nombre2, apellido1, apellido2, ubicacion, ciudad, celular, correo_electronico);
end //
delimiter ;

call insertar_empleado(1, '1234567890', 'Juan', 'Carlos', 'Pérez', 'Gómez', 'Oficina Central', 'Ciudad de Panamá', '67890123', 'juan.perez@empresa.com');

select * from empleados;

-- 7. Tabla alquileres. 
delimiter //
create procedure insertar_alquiler(in id_vehiculo INT, in id_empleado INT, in id_sucursal INT, in fecha_salida DATE,
    in fecha_esperada_entrega DATE, in valor_cotizado DECIMAL(10, 2), in valor_pagado DECIMAL(10, 2))
begin
    insert into alquileres (id_vehiculo, id_empleado, id_sucursal, fecha_salida, fecha_esperada_entrega, valor_cotizado, valor_pagado)
    values (id_vehiculo, id_empleado, id_sucursal, fecha_salida, fecha_esperada_entrega, valor_cotizado, valor_pagado);
end //
delimiter ;

call insertar_alquiler(1, 3, 2, '2024-11-15', '2024-11-20', 500.00, 500.00);

select * from alquileres;

-- 8. Tablas descuentos y alquileres.
delimiter //
create procedure insertar_alquiler_con_descuentos(in id_vehiculo INT, in id_empleado INT, in id_sucursal INT,
    in fecha_salida DATE, in fecha_esperada_entrega DATE, in porcentaje_descuento DOUBLE)
begin
    declare valor_final DECIMAL(10, 2);
    set valor_final = 200.00 - (200.00 * porcentaje_descuento / 100);
    insert into alquileres (id_vehiculo, id_empleado, id_sucursal, fecha_salida, fecha_esperada_entrega, valor_cotizado, valor_pagado)
    values (id_vehiculo, id_empleado, id_sucursal, fecha_salida, fecha_esperada_entrega, 200.00, valor_final);
end //
delimiter ;

call insertar_alquiler_con_descuentos(1, 2, 1, '2024-11-20', '2024-11-25', 10.00);

select a.id_alquiler, a.id_vehiculo, a.id_empleado, a.id_sucursal, a.fecha_salida, a.fecha_esperada_entrega,
a.fecha_entrega, a.valor_cotizado, a.valor_pagado, (a.valor_cotizado - a.valor_pagado) / a.valor_cotizado * 100 as porcentaje_descuento
from alquileres a;

-- 9. Tablas empleados y sucursales. 
delimiter //
create procedure insertar_empleados(in id_sucursal INT, in cedula VARCHAR(20), in nombre1 VARCHAR(255), in nombre2 VARCHAR(255),
    in apellido1 VARCHAR(255), in apellido2 VARCHAR(255), in ubicacion VARCHAR(255), in ciudad VARCHAR(50), in celular VARCHAR(20), in correo_electronico VARCHAR(255))
begin
    insert into empleados (id_sucursal, cedula, nombre1, nombre2, apellido1, apellido2, ubicacion, ciudad, celular, correo_electronico)
    values (id_sucursal, cedula, nombre1, nombre2, apellido1, apellido2, ubicacion, ciudad, celular, correo_electronico);
end //
delimiter ;

call insertar_empleados(1, '1234567890', 'Juan', 'Carlos', 'Perez', 'Gomez', 'Av. Principal', 'Quito', '0987654321', 'juan.perez@example.com');
 
select id_empleado, cedula, nombre1, nombre2, apellido1, apellido2, ubicacion, ciudad, celular, correo_electronico 
from empleados where cedula = '1234567890'; 
