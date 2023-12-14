Create Table Personas
(
dni char(9) primary key,
nombre_p varchar(60) not null,
direccion varchar(120)
);

Create Table Socios
(
carnet char(10),
dni char(9) primary key,	
constraint FK_socios_personas foreign key(dni) references Personas(dni)	
);

Create Table Patrones
(
licencia char(10),
dni char(9) primary key,	
constraint FK_patrones_personas foreign key(dni) references Personas(dni)	
);

Create Table Barcos
(
	matricula char(7) primary key,
	nombre_barco varchar(60) not null,
	amarre integer,
	cuota money,
	dni char(9),
	constraint FK_barcos_socios foreign key(dni) references Socios(dni)	
);

Create Table salidas
(
	dni char(9),
	matricula char(7),
	fecha_salida date,
	hora_salida integer,
	destino varchar(60),
	constraint PK_Salidas primary key(dni,matricula),
	constraint FK_salidas_barcos foreign key(matricula) references Barcos(matricula),
	constraint FK_salidas_patrones foreign key(dni) references Patrones(dni)
)



