drop database if exists tabla_tienda;
create database tabla_tienda;
show databases;
use tabla_tienda;

-- borrar tablas --
drop database if exists fabricantes;
drop database if exists articulos;

-- crear tablas --
create table fabricantes (
codigo_fabri int not null auto_increment unique,
nombre_fabri varchar(30) default null,
primary key (codigo_fabri)
);
create table articulos (
codigo_arti int not null auto_increment unique,
nombre_arti varchar(30) default null,
precio_arti double default null,
fabricante_arti int not null,
foreign key (fabricante_arti) references fabricantes (codigo_fabri)
on delete cascade on update cascade
);

-- descripcion --
describe fabricantes;
describe articulos;

-- valores fabricantes --
insert into fabricantes (nombre_fabri) values ('Nintendo');
insert into fabricantes (nombre_fabri) values ('SONY');
insert into fabricantes (nombre_fabri) values ('HP');
insert into fabricantes (nombre_fabri) values ('MSI');
insert into fabricantes (nombre_fabri) values ('ACER');
insert into fabricantes (nombre_fabri) values ('Appel');
insert into fabricantes (nombre_fabri) values ('DELL');

-- valores articulos --
insert into articulos (nombre_arti, precio_arti, fabricante_arti) values ('PlayStation5','500.00','2');
insert into articulos (nombre_arti, precio_arti, fabricante_arti) values ('GP65 Leopard','1300.00','4');
insert into articulos (nombre_arti, precio_arti, fabricante_arti) values ('GE75 Raider','2299.99','4');
insert into articulos (nombre_arti, precio_arti, fabricante_arti) values ('Mac Book Pro','1600.00','6');
insert into articulos (nombre_arti, precio_arti, fabricante_arti) values ('Nintendo Switch','319.99','1');
insert into articulos (nombre_arti, precio_arti, fabricante_arti) values ('Nintendo DS','49.59','1');
insert into articulos (nombre_arti, precio_arti, fabricante_arti) values ('iMac','1299.99','6');
insert into articulos (nombre_arti, precio_arti, fabricante_arti) values ('Acer Nitro 5','779.00','5');
insert into articulos (nombre_arti, precio_arti, fabricante_arti) values ('Envy 15','1199.00','3');
insert into articulos (nombre_arti, precio_arti, fabricante_arti) values ('Portátil E6220','200.00','7');
insert into articulos (nombre_arti, fabricante_arti) values ('PlayStation','2');
insert into articulos (nombre_arti, fabricante_arti) values ('PlayStation 2','2');
insert into articulos (nombre_arti, precio_arti, fabricante_arti) values ('PlayStation 3','50.0','2');
insert into articulos (nombre_arti, precio_arti, fabricante_arti) values ('PlayStation 4','150.0','2');

-- mostrar --
select * from fabricantes;
select * from articulos;



-- EJERCICIO --

-- 1º nombre articulos --
select nombre_arti from articulos;

-- 2º nombre/precios articulos --
select nombre_arti,precio_arti from articulos;

-- 3º todos los articulos --
select * from articulos;

-- 4º *nombre* precio<=200 --
select * from articulos where precio_arti <= 200;

-- 5º *nombre* precio=60|200 --
select * from articulos where precio_arti >=60 and precio_arti <=200;

-- 6º precio medio de los articulos --
select avg (precio_arti) from articulos;

-- 7º cuantos articulos hay --
select count(*) from articulos;

-- 8º cuantos fabricantes hay --
select count(*) from fabricantes;

-- 9º cuantos articulos percio>180 --
select count(*) from articulos where precio_arti >180;

-- 10º nombre|precio ,precio>=90, orden precio < and nombre --
select nombre_arti, precio_arti from articulos where precio_arti >= 90 order by precio_arti, nombre_arti;

-- 11º todos los articulos de cada fabricante, cada articulo los datos del fabricante --
select * from articulos, fabricantes where codigo_arti = codigo_fabri;

-- 12º precio medio de cada fabricante mostrando solo los codigos --
select avg (precio_arti), codigo_arti from articulos group by codigo_arti;

-- 13º mostrar aticulos que empiezen por n --
select nombre_arti from articulos where nombre_arti LIKE "N%" or "n%";

-- 14º mostrar aticulos que empiezen por p o que su precio este ente 2000-2500 --
select nombre_arti, precio_arti from articulos where ((nombre_arti LIKE "P%" or "p%") or (precio_arti >2000 and precio_arti <2500));

-- 15º mostrar fabricante que tienen una e y terminan por o --
select nombre_fabri from fabricantes where nombre_fabri like "%E%" or "%e%" and nombre_fabri like "%O" or "%o";

-- 16º mostrar articulos con precio null --
select nombre_arti, precio_arti from articulos where precio_arti is null;