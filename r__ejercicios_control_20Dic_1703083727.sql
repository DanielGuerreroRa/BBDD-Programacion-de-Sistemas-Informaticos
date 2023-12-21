--1) Obtener todas las columnas y filas de la tabla de resultados
select * from resultados;

--2) Obtener las columnas clase, tipo, pais y desplazamiento de la tabla de clases
Select clase,tipo,pais,desplazamiento
from clases;

--3) Obtener las columnas clase,numarmas sumandole un 20%, calibre de la tabla de clases
Select clase,numarmas*1.2 as armas_20,calibre
from clases;

--4) Obtener los barcos que comiencen con C
select nombre from barcos
where nombre like 'C%';

--5) Obtener las batallas cuya segunda posicion sea o
select nombre from batallas
where nombre like '_o%';

--6) Nombres de clases de barco y países de las clases de barco que llevaban armas con un
--calibre mayor o igual a 16 pulgadas.
select clase, pais from clases
where calibre >=16;
--resultado 4 registros

--7) Barcos con desplazamiento superior a 35.000 toneladas de la tabla de barcos.
Select b.nombre, desplazamiento  from barcos b
inner join clases c
on b.clase = c.clase
where desplazamiento > 35000;
--resultado 8

--8) Obtener el promedio de armas, el calibre mínimo de la tabla de clases
select avg(numarmas) as promedio_armas, min(calibre)
from clases

--9) Obtener la información de resultados ordenado por resultado
select * from resultados
order by resultado;

--10) Para cada clase, encontrar el año en el que fue botado el barco más antiguo de la clase.
Select clase, min(botado) from barcos
group by clase 
order by clase

--11) Contar cuantos barcos tiene cada batalla de la tabla de resultados
select batalla, count(barco) as contador
from resultados
group by batalla

--12)Batallas en las que participaron barcos de la clase Congo.

Select r.batalla from resultados R
inner join barcos B 
on r.barco= b.nombre
where b.clase='Congo';

--resultado 2

--13) Nombre, desplazamiento y número de armas de todos los barcos que participaron en la
--batalla de Guadalcanal.
Select nombre, desplazamiento, numarmas from barcos b
inner join clases c
on b.clase = c.clase
inner join resultados r
on b.nombre = r.barco
where batalla = 'Guadalcanal';
--resultado 2

--14) Nombre de las clases de barcos tales que al menos dos barco de la clase se hundió en una
--batalla.

select c.clase from resultados r
inner join barcos b
on b.nombre = r.barco
inner join clases c
on c.clase = b.clase
where resultado = 'hundido'
group by c.clase 
having count(b.nombre)>=2

--15) Batallas en las que participaron al menos tres barcos del mismo país.
select r.batalla, pais, count(pais) from barcos b
inner join resultados r 
on b.nombre = r.barco
inner join clases c 
on b.clase = c.clase
group by r.batalla, pais
having count (pais)>=3;
--resultado 1



