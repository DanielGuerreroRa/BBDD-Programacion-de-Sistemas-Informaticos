--Group by
--having
--Obtener por producto la scantidades que se han vendido
Select product_id, sum(quantity) as catidad_vendida
from public.order_details
group by product_id
order by product_id;

--Y ahora las que sean mayores a 850
Select product_id, sum(quantity) as catidad_vendida
from public.order_details
group by product_id
having sum (quantity) > 850
order by product_id;

--Obtener los empleados que han obtenido mas de 100 de la tabla de Ordenes
Select employee_id, count(order_id) cantidad_mayor100
from public.orders
group by employee_id
having count (order_id) > 100
order by employee_id;

--Obtener el numero de ordener por pais, unicamente los paises USA, Spain
Select ship_country, count(order_id) NºOrdenes
from public.orders
where ship_country in('USA', 'Spain')
group by ship_country 

--Cuales so los prroveedores que nos surten mas de 1 producto, mostrar el proveedor
--mostrar la cantidad de productos, pero unicamete de la categoria 1 de la tabla de Productos
Select supplier_id, count(product_id)
from public.products
where category_id=1
Group by supplier_id
having count(product_id)>1
order by supplier_id;

--CONTAR LAS ORDENES POR EMPLEADO DE LOS PAISES USA, CANADA, SPAIN (ShipCountry)
--MOSTRAR UNICAMENTE LOS EMPLEADOS CUYO CONTADOR DE ORDENES SEA MAYOR A 20
Select employee_id, sum(order_id)
from public.orders
where ship_country in('Spain')
Group by employee_id
having count (order_id>20)
order by employee_id

--OBTENER EL PRECIO PROMEDIO DE LOS PRODUCTOS POR PROVEEDOR
--UNICAMENTE DE AQUELLOS CUYO PROMEDIO SEA MAYOR A 20
Select supplier_id

--OBTENER LA SUMA DE LAS UNIDADES EN EXISTENCIA (UnitsInStock)
--POR CATEGORIA, Y TOMANDO EN CUENTA UNICAMENTE LOS PRODUCTOS CUYO
--PROVEEDOR (SupplierID) SEA IGUAL A 17, 19, 16
--ADICIONALMENTE CUYA SUMA POR CATEGORIA SEA MAYOR A 300--
Select category_id, sum(units_in_stock)
from public.products
where supplier_id in(17, 19, 16)
Group by category_id

--CONTAR LAS ORDENES POR EMPLEADO DE LOS PAISES (ShipCountry)
--USA, CANADA, SPAIN
--CUYO CONTADOR SEA MAYOR A 25
Select employee_id, count (order_id) as contador
from orders
where ship_country in ('USA', 'Canada', 'Spain')
group by empoyee_id
having count(order_id) >20
order by employee_id;

--OBTENER LAS VENTAS (Quantity * UnitPrice) AGRUPADAS POR PRODUCTO 
--(Orders details) Y CUYA SUMA DE VENTAS SEA MAYOR A 50.000
