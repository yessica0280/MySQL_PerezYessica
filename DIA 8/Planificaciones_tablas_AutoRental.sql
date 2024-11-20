create database Planificaciones_T2;

use Planificaciones_T2;

CREATE TABLE sucursales (
  id_sucursal INT PRIMARY KEY AUTO_INCREMENT,
  ubicacion VARCHAR(255) NOT NULL,
  ciudad VARCHAR(50) NOT NULL,
  dirección VARCHAR(70) NOT NULL,
  telefono_fijo VARCHAR(20) NOT NULL,
  celular VARCHAR(20) NOT NULL,
  correo_electronico VARCHAR(255) NOT NULL
);

create table tipo_vehiculo(
	id_tipo_vehiculo int primary key not null ,
    tipo varchar(70) not null ,
    valor_alquiler_dia double not null ,
    valor_alquiler_semana double not null 
);


CREATE TABLE vehiculos (
  id_vehiculo INT PRIMARY KEY AUTO_INCREMENT,
  id_tipo_vehiculo int NOT NULL,
  id_sucursal int not null,
  placa VARCHAR(20) NOT NULL,
  referencia VARCHAR(255) NOT NULL,
  modelo VARCHAR(255) NOT NULL,
  puertas INT NOT NULL,
  capacidad INT NOT NULL,
  sunroof TINYINT(1) NOT NULL,
  motor VARCHAR(255) NOT NULL,
  color VARCHAR(255) NOT NULL,
  foreign key (id_tipo_vehiculo) references tipo_vehiculo(id_tipo_vehiculo),
  foreign key (id_sucursal) references sucursales(id_sucursal)
);


create table descuento (
id_descuento int primary key  not null,
id_tipo_vehiculo int not null,
fecha_inicio date not null,
fecha_fin date not null,
porcentaje_descuento double not null,
foreign key (id_tipo_vehiculo) references tipo_vehiculo(id_tipo_vehiculo) 
 
);

CREATE TABLE clientes (
  id_cliente INT PRIMARY KEY AUTO_INCREMENT,
  cedula VARCHAR(20) NOT NULL,
  nombre1 VARCHAR(255) NOT NULL,
  nombre2 VARCHAR(255) NOT NULL,
  apellido1 VARCHAR(255) NOT NULL,
  apellido2 VARCHAR(255) NOT NULL,
  ubicacion VARCHAR(255) NOT NULL,
  ciudad VARCHAR(50) NOT NULL,
  celular VARCHAR(20) NOT NULL,
  correo_electronico VARCHAR(255) NOT NULL
);

CREATE TABLE empleados (
  id_empleado INT PRIMARY KEY AUTO_INCREMENT,
  id_sucursal INT NOT NULL,
  cedula VARCHAR(20) NOT NULL,
  nombre1 VARCHAR(255) NOT NULL,
  nombre2 VARCHAR(255) NOT NULL,
  apellido1 VARCHAR(255) NOT NULL,
  apellido2 VARCHAR(255) NOT NULL,
  ubicacion VARCHAR(255) NOT NULL,
  ciudad VARCHAR(50) NOT NULL,
  celular VARCHAR(20) NOT NULL,
  correo_electronico VARCHAR(255) NOT NULL,
  FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal)
);



CREATE TABLE alquileres (
  id_alquiler INT PRIMARY KEY AUTO_INCREMENT,
  id_vehiculo INT NOT NULL,
  id_empleado INT NOT NULL,
  id_sucursal INT NOT NULL,
  fecha_salida date not null ,
  fecha_esperada_entrega DATE NOT NULL,
  fecha_entrega date ,
  valor_cotizado DECIMAL(10, 2) NOT NULL,
  valor_pagado DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (id_vehiculo) REFERENCES vehiculos(id_vehiculo),
  FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado),
  FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal)
);