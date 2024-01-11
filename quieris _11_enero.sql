Create table cuenta_bancaria
(
id_cuenta serial primary key,
	saldo money not null,
	pin varchar(4) not null,
	nombre varchar(60),
	direccion varchar(120),
	no_tarjeta varchar(20)
)

insert into public.cuenta_bancaria
(saldo, pin, nombre, no_tarjeta)
values
(3000, '1234','Juan Lopez', '12345'),
(8500, '1234','Sergio Mendez', '12346'),
(38200, '1234','Julia Torija', '12347'),
(3420, '1575','Juan Torija', '12348')

select * from cuenta_bancaria

update cuenta_bancaria set saldo = saldo + '100' where no_tarjeta = '12345'


