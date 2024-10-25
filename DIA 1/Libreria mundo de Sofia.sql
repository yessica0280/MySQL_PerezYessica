CREATE DATABASE migrupoT2; -- Crear una base de datos

USE migrupoT2; -- Utilizar miBBDD
CREATE TABLE Clientes(
idclientes INT NOT NULL auto_increment primary key,
nombre varchar(25) not null,
correo varchar(30) not null,
telefono int not null,
dirección varchar(20) not null
);

CREATE TABLE Libros(
ISBN INT  NOT NULL auto_increment PRIMARY KEY,
autores varchar(20) NOT NULL,
título VARCHAR(25) NOT NULL,
editorial VARCHAR(30) NOT NULL,
categoría INT NOT NULL,
fechapublicación INT NOT NULL,
precio INT NOT NULL,
cantidad INT NOT NULL,
idclientes INT NOT NULL,
foreign key (idclientes) references Clientes (idclientes)
);

CREATE TABLE Autores(
idautor int not null auto_increment primary key,
nombre varchar(25) not null,
fechanacimiento int not null,
nacionalidad varchar(30) not null
);

 DESCRIBE Libros;
 describe Clientes;
 drop table Libros;
 drop table Clientes;
 
 