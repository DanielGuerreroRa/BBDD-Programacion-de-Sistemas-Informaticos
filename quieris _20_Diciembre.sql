--Ver
select * from orders;

--Ver solo estas tablas
select order_id, employee_id,order_date from public.orders;

--Que su cantidad sea mayor a 100
select * from public.order_details
where quantity > 100;

--Que comiencen con 'F'
select * from public.employees
where last_name like 'F%';

--Que la segunda letra del apellido sea 'u'
select * from public.employees
where last_name like '_u%';

--Funciones de agregacion avg(), count(), sum(), min(), max()
--promedio(es AVG) de las cantidades vendidas de detalle de ordenes
select avg(quantity) as promedio
from public.order_details

--Suma (es SUM) de las cantidades vendidas por producto
select product_id, sum(quantity)
from public.order_details
group by product_id
--Agrupacion de lo solicitado

--Sin agrupar
select product_id, quantity from public.order_details
order by product_id;

--obtener la orden_id, fecha orden, el empleado id, nombre
select order_id,order_date,o.employee_id,first_name
from public.orders o
inner join public.employees e
on o.employee_id = e.employee_id

--Obtener los paises a los cuales han enviado mas de 10 ordenes contar(count)
select ship_country, count(order_id) as ordenes
from public.orders
group by ship_country
having count(order_id)>10;  --ejemplo <<<
--having es sobre una funcion de agregacion   --where sobre una fila de la tabla

