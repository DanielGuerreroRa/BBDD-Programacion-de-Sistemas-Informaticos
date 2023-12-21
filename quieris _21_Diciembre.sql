
--Cuantos productos hay en tabla de productos
select count(*) as cantidad_total
from public.products


--Sumar las cantidades en existencia 
--de la tabla de productos
select sum(units_in_stock) as total
from public.products


--Promedio de los precios 
-- de la tabla de productos
select avg(unit_price) as promedio
from public.products

--Columna claculada
Select unit_price*1.10 as  precio_incremetado10
from products

--Numero de productos por categoria
select category_id, count(category_id) as productos_por_categoria
from public.products
group by category_id


--Obtener el precio promedio por proveedor de la tabla de productos
select supplier_id, avg(unit_price) as precio_promedio
from public.products
group by supplier_id

--Obtener la suma de inventario (UnitsInStock) por SupplierID
--De la tabla de productos (Products)
select supplier_id, sum(unit_price) as total
from public.products
group by supplier_id

--comprobaci�n
SELECT SupplierID, 
       UnitsInStock
FROM products
ORDER BY SupplierID;

--Contar las ordenes por cliente de la tabla de orders
select customer_id count(order_id) ordenes_totales
from orders
group by customer_id


--Contar las ordenes por empleado
--De la tabla de ordenes
--Pero unicamente del empleado 1,3,5,6
select employee_id count(order_id) as ordenes_totales
from orders
where employee_id in (1,3,5,6)
group by employee_id


--Obtener la suma del env�o (freight) por cliente
--De la tabla de ordenes
--Pero �nicamente de los registros cuya ShipCity sea 
--Madrid, Sevilla, Barcelona, Lisboa, London
--Ordenado por el campo de suma del env�o
select customer_id, sum(freight) as suma_total
from public.orders
where ship_city in ('Madrid', 'Sevilla', 'Barcelona', 'Lisboa', 'London')
group by customer_id
order by sum(freight)


--Obtener los datos de productos ordenados descendentemente por precio unitario
--de la categor�a 1
select *
from products
where category_id=1
order by unit_price desc



--Obtener los datos de los clientes(Customers) ordenados descendentemente por nombre(CompanyName) que se 
--encuentren en la ciudad(city) de barcelona, Lisboa
select *
from public.customers
where city in ('Barcelona', 'Lisboa')
order by customer_id desc

--Obtener los datos de las ordenes, ordenados descendentemente por la fecha de la orden
--cuyo cliente(CustomerId) sea ALFKI
select *
from public.orders
where customer_id = 'ALFKI'
order by order_date desc

--Obtener los datos del detalle de ordenes, ordenados ascendentemente por precio
--cuyo producto sea 1, 5 o 20
select *
from public.order_details
where product_id in (1, 5, 20)
order by unit_price asc


--Obtener los datos de las ordenes ordenados ascendentemente por la fecha de la orden
--cuyo empleado sea 2 o 4
select *
from public.orders
where employee_id in (2, 4)
order by order_date asc

--Obtener los productos cuyo precio est�n entre 30 y 60
--ordenado por nombre
select *
from products
where unit_price between 30 and 60   
order by product_name


--OBTENER EL MAXIMO, MINIMO Y PROMEDIO DE PRECIO UNITARIO DE LA TABLA DE PRODUCTOS
--UTILIZANDO ALIAS
select max(unit_price) as maximo, min(unit_price) as minimo, avg(unit_price) as promedio
from public.products



--obtener el precio promedio de los productos por categoria
--sin contar con los productos descontinuados (Discontinued)
select category_id, avg(unit_price) as promedio
from public.products
where discontinued=0
group by category_id


--Obtener la cantidad de productos por categoria,  aquellos cuyo precio se
--encuentre entre 10 y 60 que tengan m�s de 12 productos
select category_id, count(product_id) as cantidad
from public.products
where unit_price between 10 and 60
group by category_id
having count(product_id) > 9


--OBTENER LA SUMA DE LAS UNIDADES EN EXISTENCIA (UnitsInStock)
--POR CATEGORIA, Y TOMANDO EN CUENTA UNICAMENTE LOS PRODUCTOS CUYO
--PROVEEDOR (SupplierID) SEA IGUAL A 17, 19, 16.
--cuya categoria tenga menos de 200 unidades
--ordenado por unidades
select category_id, sum(units_in_stock) as suma
from public.products
where supplier_id in (17, 19, 16)
group by category_id
having sum(units_in_stock) < 200
order by suma