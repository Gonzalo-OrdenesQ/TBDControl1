
-- Query pregunta 3

SELECT ed.direccion, pe.mes, SUM(ge.monto::integer) FROM
	public.edificio as ed,
	public.gasto_edificio as ge,
	public.pago_gasto_edificio as pe
	WHERE ed.id = pe.id_edificio
	AND ge.id = pe.id_gasto_edificio
	GROUP BY ed.direccion, pe.mes;

-- Query pregunta 6

SELECT ad.nombre, COUNT(*) AS encargado FROM
	public.administrador as ad,
	public.edificio as ed
	WHERE ad.id = ed.id_administrador
	GROUP BY ad.nombre
	ORDER BY COUNT(*) DESC LIMIT 1;

-- Query pregunta 7

SELECT ed.direccion, de.piso::integer, de.numero::integer, MAX(de.habitantes::integer) as habitantes FROM
	public.depto as de,
	public.edificio as ed
	WHERE ed.id = de.id_edificio
	GROUP BY ed.direccion, de.piso::integer, de.numero::integer, habitantes
	ORDER BY de.piso::integer ASC, de.numero::integer ASC, habitantes DESC;