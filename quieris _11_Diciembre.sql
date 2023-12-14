--Ejemplo de filtros
--Obtener los productos de orders_details cuyo precio sea mayor a 50
Select * from public.order_details
where unit_price > 50;

--Obtener los productos de order_details cuya cantidad sea mayor a 75
Select * from public.order_details
where quantity > 75;

--Obtener los empleados que contegan una 'w' en su apellido.
Select * from public.employees
where last_name like '%w';

--Obtener los productos de order_details cuya cantidad se encuentre entre 75 y 150
Select product_id, quantity from public.order_details
where quantity between 75 and 150;

--Obtener los productos cuyo stock esté entre 100 y 200
Select * from products
where units_in_stock between 100 and 200;

--Vamos a obtener los productos cuyo nombre comience po C u termine por i
Select * from products
where product_name like 'C%i'; 

--Vamos a obtener los productos cuyo nombre ¡ termine por n
Select * from products
where product_name like '%n'; 

--Obtener los productos cuyo proveedor sea 1,5,7,2
Select * from products
where supplier_id in (1, 5, 7, 2);

--Obtener los productos cuyo nombre empiece por A, G, R ordenadolo por el nombre del producto
Select * from products
where product_name like 'A%' or product_name like 'G%' or product_name like 'R%' order by product_name;

--ORDER BY <NOMBRE>
--Ordenar la tabla de productos por nombre
Select * from products
order by product_name;

--Ordenas los productos_id de forma descendente
Select * from products
order by product_id DESC;

--Ordenar la tabla de productos por categorias ascendentemente y proveedor descendente
Select * from products
order by category_id ASC, supplier_id DESC;

--Obtener cuantas filas tiene la tabla de producto
--Las funciones de agregación son: count, sum, avg, max, min.
--La unica que acepta el * es count.
--El resto el nombre de una columna o una operación aritmetica.
Select count(*) as numero_registro
from products;

--Obtener el número de filas de la tabla de empleados
Select count(*) as numero_registro
from employees;

--Evitar el * para ahorrar trabajo con los null
--Obtener el número de filas de la tabla de empleados sin los nulos
Select count(region) as numero_registro
from employees;

--Gestión de nulos
create table datos
(a numeric);

insert into datos 
values
(8),
(7),
(null),
(5);
select * from datos

select sum(a) from datos;

create table datos2
(a numeric, b numeric);


insert into datos2 
values
(8,2),
(7,3),
(null,3),
(5,5);

 select a+b suma from datos2;
 
 select avg(a) from datos;
 
 --Obtener el precio promedio, maximo y minimo de productos
 Select avg(unit_price) as promedio, max(unit_price) as maximo, min(unit_price) as minimo
 from products;
 
 --Obtener la cantidad maxima y minima de order_details
Select max(quantity) as maximo, min(quantity) as minimo
from order_details;

--Obtener todas las unidades que tenemos en stock
Select count(units_in_stock) as unidades
from products;

