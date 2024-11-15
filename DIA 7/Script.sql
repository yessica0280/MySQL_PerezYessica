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
