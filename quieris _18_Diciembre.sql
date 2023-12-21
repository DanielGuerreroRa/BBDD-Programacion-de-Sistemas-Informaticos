create table colecciones
(
id_coleccion serial primary key,
	volumen integer not null
)

create table libros
(
isbn char(20) primary key,
	titulo varchar(30),
	autor varchar(60),
	editorial varchar(30),
	id_coleccion integer,
	constraint FK_libros_colecciones foreign key (id_coleccion) references colecciones (id_coleccion)
)

create table provincias
(
id_provincia serial primary key,
nombre varchar(30) not null,
extension integer,
id_almacen integer not null
)
 
create table almacenes
(
id_almacen serial primary key,
f_apertura date not null,
direccion varchar(90),
id_provincia integer not null,
constraint FK_almacenes_provincia foreign key (id_provincia) references provincias(id_provincia)
)
 
create table poblaciones
(
id_poblacion serial primary key,
	nombre varchar(60) not null,
	habitantes integer not null,
	id_provincia integer not null,
	constraint FK_pobaciones_provincias foreign key (id_provincia) references provincias (id_provincia)
)

create table Stocks
(
isbn char(20),
	id_almacen integer,
	cantidad integer not null,
	constraint PK_stocks primary key(isbn,id_almacen),
	constraint FK_stocks_libros foreign key (isbn) references libros(isbn),
	constraint FK_stocks_almacenes foreign key (id_almacen) references almacenes(id_almacen)
)


create table socios
(
id_socio serial primary key,
dni char(9),
nombre varchar(30),
apellidos varchar(60),
telefono varchar(15),
id_poblacion integer not null,
id_socio_avalador integer not null,
constraint FK_socios_poblaciones foreign key (id_poblacion) references poblaciones(id_poblacion),
constraint FK_socios_socios foreign key (id_socio_avalador) references socios(id_socio)
)

create table pedidos
(
id_pedido serial primary key,
f_envio char(15),
f_pago char(15),
id_socio integer not null,
constraint FK_pedidos_socios foreign key (id_socio) references socios(id_socio)
	
)

create table detalles_pedido
(
id_pedido integer,
id_consecutivo integer,
isbn char(20) not null,
cantidad integer ,
constraint PK_detalles_pedido primary key (id_pedido, id_consecutivo),
constraint FK_detalles_pedido_pedidos foreign key (id_pedido) references pedidos(id_pedido)
	
)
