create database Planificacion_T2;

use Planificacion_T2;

create table Clientes (
id_cliente int primary key,
Cedula int,
Nombres varchar(60),
Apellidos varchar(60),
Direccion varchar(60),
Ciudad_residencia varchar(60),
Celular int,
Correlo_electronico varchar(50)
);

create table Empleados (
id_empleado int primary key,
Cedula int,
Nombres varchar(60),
Apellidos varchar(60),
Ubicacion varchar(60),
Celular int,
Correo_electronico varchar(50),
id_sucursal int,
foreign key (id_sucursal) references Sucursales(id_sucursal)
);

create table Sucursales (
id_sucursal int primary key,
Ubicacion varchar(60),
Telefono_fijo int,
Celular int,
Correo_electronico varchar(50)
);

create table Vehiculos (
id_vehiculo int primary key,
Tipo_vehiculo varchar(50),
Placa varchar(25),
Referencia int,
Modelo varchar(50),
Puertas int,
Capacidad int,
Sunroof varchar(50),
Motor varchar(50),
Color varchar(50)
);

create table Alquileres (
id_alquiler int primary key,
Fecha_salida date,
Fecha_llegada date,
Fecha_esperada_entrega date,
Valor_cotizado int,
Valor_pagado int,
id_vehiculo int,
id_empleado int,
id_sucursal int,
foreign key (id_vehiculo) references Vehiculos(id_vehiculo),
foreign key (id_empleado) references Empleados(id_empleado),
foreign key (id_sucursal) references Sucursales(id_sucursal)
);

create table Tipo_vehiculo (
id_tipoV int primary key,
Valor_alquiler_semana int,
Valor_alquiler_dia int,
Tipo varchar(50)
);

create table Descuento ( 
id_descuento int primary key,
Fecha_inicio date,
Fecha_fin date,
Porcentaje_descuento int,
id_tipoV int,
foreign key (id_tipoV) references Tipo_vehiculo(id_tipoV)
);
