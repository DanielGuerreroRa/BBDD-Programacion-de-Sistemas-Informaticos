--Todas las columnas y las filas de la tabla de categorias
Select * from categories;
--Todas las columnas y las filas de la tabla de productos
Select * from products;
--Todas las columnas y las filas de la tabla de clientes
Select * from customers;
--Todas las columnas y las filas de la tabla de ordenes
Select * from orders;

--Obtener las columnas category_id y category_name de la tabla categories
Select category_id, category_name from categories;
--Obtener las columnas id, nombre, precio de la tablas de productos
Select product_id, product_name, unit_price from products;
--Obtener las columnas id, producto, cantidad de la tabla de ordenes
Select product_id, product_id, quantity from order_details;
--Obtener las columnas id, nombre, apellidos, jefe, de la tabla de empleados
Select employee_id, first_name, last_name, reports_to from employees;

--Filtros
--No se muestran todas las filas, unicamente las que cumplen una condición
-- Operadores de comparación: >  <  <>  <=  >=
-- and / or / not
--between - rangos between 1 ad 20 (rango que esta entre el 1 y el 20)
--in - si un valor está en un conjunto: sexo in ('M', 'H')
--like - es como el operador igual para usa un patrón: p%, %n, %l%

--Obtener los productos cuyo precio sea mayor a 50
SELECT * FROM PRODUCTS
WHERE unit_price >50;

--Obtener los productos cuyo precio sea menor a 100
SELECT * FROM PRODUCTS
WHERE unit_price <100;

--Obtener los productos que tengan categoria 1, 6, 7
SELECT * FROM PRODUCTS
WHERE category_id in (1,6,7);

--Obtener los productos que tengan el precio entre 35 y 75
SELECT * FROM PRODUCTS
WHERE unit_price between 35 and 75;

--Obtener los productos que comiencen con p
SELECT * FROM PRODUCTS
WHERE product_name like 'P%';
