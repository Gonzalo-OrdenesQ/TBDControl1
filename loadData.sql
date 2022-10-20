INSERT INTO public.administrador
	(id, nombre)
	VALUES (1, 'admin1'),
		   (2, 'admin2'),
		   (3, 'admin3'),
		   (4, 'admin4'),
		   (5, 'admin5'),
		   (6, 'admin6'),
		   (7, 'admin7'),
		   (8, 'admin8');

INSERT INTO public.comuna
    (id, nombre)
    VALUES (1, 'Santiago'),
           (2, 'Estacion Central'),
           (3, 'Quinta Normal'),
           (4, 'Maipu'),
           (5, 'Lo Prado'),
           (6, 'Cerrillos'),
           (7, 'Pudahuel'),
           (8, 'Pedro Aguirre Cerda');

INSERT INTO public.edificio
    (id, id_comuna, id_administrador, direccion)
    VALUES (1, 1, 1, 'San Antonio 580'),
           (2, 1, 2, 'Pl. de Armas s/n'),
           (3, 2, 1, 'Av. Libertador Bernardo Ohiggins 3363'),
           (4, 3, 3, 'Av. Carrascal 4447'),
           (5, 4, 4, 'Av. 5 de Abril 0260'),
           (6, 5, 5, 'Av. San Pablo 5959'),
           (7, 6, 6, 'Piloto Lazo 120'),
           (8, 7, 7, 'Av. San Pablo 8444'),
           (9, 8, 8, 'Pdte. Salvador Allende Gossens. 2029');

INSERT INTO public.gasto_edificio
    (id, monto)
    VALUES (1, 2400000),
           (2, 3000000),
           (3, 2150000),
           (4, 1800000),
           (5, 3800000),
           (6, 2340000),
           (7, 3100000),
           (8, 2800000),
           (9, 2650000),
           (10, 2900000);

INSERT INTO public.pago_gasto_edificio
    (id, id_edificio, id_gasto_edificio, mes)
    VALUES (1, 1, 1, 'Marzo'),
           (2, 2, 2, 'Marzo'),
           (3, 3, 3, 'Marzo'),
           (4, 4, 4, 'Marzo'),
           (5, 5, 5, 'Marzo'),
           (6, 6, 6, 'Marzo'),
           (7, 7, 7, 'Marzo'),
           (8, 8, 8, 'Marzo'),
           (9, 7, 9, 'Marzo'),
           (10, 3, 10, 'Marzo');

INSERT INTO public.tipo_gg
    (id, nombre)
    VALUES (1, 'Agua'),
           (2, 'Luz'),
           (3, 'Telefono'),
           (4, 'Multa'),
           (5, 'Administracion');

INSERT INTO public.gasto_comun
    (id, id_edificio, id_tipo_gg, nombre, valor)
    VALUES (1, 1, 1, 'Agua', 68688),
           (2, 2, 2, 'Luz', 74525),
           (3, 3, 3, 'Telefono', 78661),
           (4, 4, 4, 'Multa', 74122),
           (5, 5, 5, 'Administracion', 98600),
           (6, 6, 1, 'Agua', 60834),
           (7, 7, 2, 'Luz', 96950),
           (8, 8, 3, 'Telefono', 77874),
           (9, 2, 4, 'Multa', 58633),
           (10, 4, 5, 'Administracion', 83735);

INSERT INTO public.tipo_depto
    (id, nombre)
    VALUES (1, 'Basico'),
           (2, 'Mediano'),
           (3, 'Grande'),
           (4, 'Penthouse');

INSERT INTO public.tipo_gg_tipo_depto
    (id, id_tipo_gg, id_tipo_depto)
    VALUES (1, 1, 1),
           (2, 1, 2),
           (3, 1, 3),
           (4, 2, 4),
           (5, 2, 3),
           (6, 2, 2),
           (7, 3, 4),
           (8, 3, 1),
           (9, 4, 4),
           (10, 4, 3),
           (11, 5, 4),
           (12, 3, 2);

INSERT INTO public.depto
    (id, id_edificio, id_tipo_depto, numero, piso, habitantes)
    VALUES (1, 1, 1, 301, 3, 1),
           (2, 1, 2, 203, 2, 3),
           (3, 2, 3, 615, 6, 4),
           (4, 3, 4, 606, 6, 1),
           (5, 4, 1, 1008, 10, 5),
           (6, 5, 2, 503, 5, 4),
           (7, 6, 3, 505, 5, 3),
           (8, 7, 4, 906, 9, 1),
           (9, 8, 1, 402, 4, 2),
           (10, 9, 4, 501, 5, 1),
           (11, 5, 4, 207, 2, 4),
           (12, 8, 2, 903, 9, 3);

INSERT INTO public.pago_gg_depto
    (id, id_depto, id_gasto_comun, mes)
    VALUES (1, 1, 1, 'Marzo'),
           (2, 2, 2, 'Marzo'),
           (3, 3, 3, 'Marzo'),
           (4, 4, 4, 'Marzo'),
           (5, 5, 5, 'Marzo'),
           (6, 6, 6, 'Marzo'),
           (7, 7, 7, 'Marzo'),
           (8, 8, 8, 'Marzo'),
           (9, 9, 9, 'Marzo'),
           (10, 10, 10, 'Marzo');