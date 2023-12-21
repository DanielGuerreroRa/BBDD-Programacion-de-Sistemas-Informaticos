DO $$
declare
nombre varchar(20):='Juan Lopez';
begin
    raise notice 'Bienvenido %',nombre;
end
$$ language 'plpgsql'


DO $$
declare
edad int :=18;
begin
    raise notice 'Su edad es %', edad;
end
$$ language 'plpgsql'


DO $$
declare
sexo char :='M';
begin
    raise notice 'Su sexo es %', sexo;
end
$$ language 'plpgsql'


DO $$
declare
usuario varchar(20):='admin';
begin
    if(usuario = 'admin')then
	raise notice 'Bienvenido %', usuario;
	else
	raise notice 'No se puede logear, o tiene permiso';
	end if;
end
$$ language 'plpgsql'


--Definir una variable de edad y decir si es mayor de edad o no
DO $$
declare
edad int :=19;
begin
    if(edad >= 18) then
    raise notice 'Su edad es % por lo tanto es mayor de edad ',edad;
	else 
	raise notice 'Su edad es % por lo tanto no es mayor de edad',edad;
	end if;
end
$$ language 'plpgsql'

--Definir una variable y decir si es positivo o negativo
DO $$
declare
numero int := -3;
begin
    if(numero < 0) then
    raise notice 'El numero % es negativo',numero;
	else 
	raise notice 'El numero % es positivo',numero;
	end if;
end
$$ language 'plpgsql'

--case - Estructura condicioal para evaluar el valor de una clase
DO $$
declare
estado_civil char:='S';
begin
    case
	when (estado_civil = 'S') then raise notice 'Es soltero';
	when (estado_civil = 'C') then raise notice 'Es casado';
	when (estado_civil = 'V') then raise notice 'Es viudo';
	when (estado_civil = 'D') then raise notice 'divorciado';
    else
	      raise notice 'valor invalido';
	end case;	  
end
$$ language 'plpgsql'

--Dias de la semana
DO $$
declare
dia int:=3;
begin
    case
	when (dia = 1) then raise notice 'Es lunes';
	when (dia = 2) then raise notice 'Es martes';
	when (dia = 3) then raise notice 'Es miercoles';
	when (dia = 4) then raise notice 'Es jueves';
	when (dia = 5) then raise notice 'Es viernes';
	when (dia = 7) then raise notice 'Es sabado';
	when (dia = 7) then raise notice 'Es domigo';
	else 
	      raise notice'Dia invalido';
	end case;  
end
$$ language 'plpgsql'

--Estructuras de bucle
DO $$
declare
contador integer := 1;
begin
    LOOP
	raise notice 'iteracion %',contador;
	contador:= contador + 1;
	exit when contador =11;
	end loop;
end
$$ language 'plpgsql'

--Estructuras de bucle2
DO $$
declare
contador integer := 0;
begin
    While(contador < 10) LOOP
	raise notice 'iteracion %',contador;
	contador:= contador + 1;
	end loop;
end
$$ language 'plpgsql'

--mostrar por la cosola la tabla de multiplicar del 3
DO $$
declare
numero integer := 1;
begin
    While(numero <= 10) LOOP
	raise notice '3 x % = %',numero,numero*3;
	numero := numero + 1;
	end loop;
end
$$ language 'plpgsql'

--funciones
create or replace function sin_param()
returns TEXT
as $$
begin
   return 'Funciona';
end
$$ language 'plpgsql'


select sin_param();


create or replace function cantidades_existencia()
returns integer
as  $$
declare 
    catitadades_existencia integer;
begin
    select sum(units_in_stock) into catitadades_existencia
	from products;
	return cantidades_existencia;
end
$$ language 'plpgsql'

select cantidades_existencia();

--En base a id_producto se devuelve el nombre
create or replace function nombre_producto(id integer)
returns varchar(40)
as  $$
declare 
    nombre varchar(40);
begin
    select product_name into nombre from products
	where product_id = id;
	return nombre;
end
$$ language 'plpgsql'

Select nombre_producto(10);

--Obtener el numero de ordener por empleado
create or replace function numero_ordenes (empl_id integer)
returns int
as  $$
declare 
    quantity int;
begin
    select count(order_id)
	into quantity
	from orders
	where employee_id = empl_id;
	return quantity;
end
$$ language 'plpgsql'

select numero_ordenes(2);

--Obtener en base de un id de producto obtener la suma de las cantidades vendidas
create or replace function suma_cantidades(id integer)
returns integer
as  $$
declare 
    cantidad int;
begin
    select sum(quantity) into cantidad
	from public.order_details
	where product_id = id;
	return cantidad;
end
$$ language 'plpgsql'

select suma_cantidades(1);