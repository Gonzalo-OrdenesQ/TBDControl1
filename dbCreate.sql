CREATE DATABASE administracion_edificio
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Spain.1252'
    LC_CTYPE = 'Spanish_Spain.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

\connect administracion_edificio

--1
CREATE TABLE IF NOT EXISTS public.comuna
(
    id character varying(4) COLLATE pg_catalog."default" NOT NULL,
    nombre character varying(128) COLLATE pg_catalog."default",
    CONSTRAINT comuna_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.comuna
    OWNER to postgres;


--2
CREATE TABLE IF NOT EXISTS public.administrador
(
    id character varying(4) COLLATE pg_catalog."default" NOT NULL,
    nombre character varying(64) COLLATE pg_catalog."default",
    CONSTRAINT administrador_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.administrador
    OWNER to postgres;


--3
CREATE TABLE IF NOT EXISTS public.edificio
(
    id character varying(4) COLLATE pg_catalog."default" NOT NULL,
    id_comuna character varying(4) COLLATE pg_catalog."default" NOT NULL,
    id_administrador character varying(4) COLLATE pg_catalog."default" NOT NULL,
    direccion character varying(128) COLLATE pg_catalog."default",
    CONSTRAINT edificio_pkey PRIMARY KEY (id),
    CONSTRAINT fk_edificio_administrador FOREIGN KEY (id_administrador)
        REFERENCES public.administrador (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE,
    CONSTRAINT fk_edificio_comuna FOREIGN KEY (id_comuna)
        REFERENCES public.comuna (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.edificio
    OWNER to postgres;

--4
CREATE TABLE IF NOT EXISTS public.gasto_edificio
(
    id character varying(4) COLLATE pg_catalog."default" NOT NULL,
    monto character varying(16) COLLATE pg_catalog."default",
    CONSTRAINT gasto_edificio_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.gasto_edificio
    OWNER to postgres;


--5
CREATE TABLE IF NOT EXISTS public.pago_gasto_edificio
(
    id character varying(4) COLLATE pg_catalog."default" NOT NULL,
    id_edificio character varying(4) COLLATE pg_catalog."default" NOT NULL,
    id_gasto_edificio character varying(4) COLLATE pg_catalog."default" NOT NULL,
    mes character varying(16) COLLATE pg_catalog."default",
    CONSTRAINT pago_gasto_edificio_pkey PRIMARY KEY (id),
    CONSTRAINT fk_pago_gasto_edificio_edificio FOREIGN KEY (id_edificio)
        REFERENCES public.edificio (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE,
    CONSTRAINT fk_pago_gasto_edificio_gasto_edificio FOREIGN KEY (id_gasto_edificio)
        REFERENCES public.gasto_edificio (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.pago_gasto_edificio
    OWNER to postgres;


--6
CREATE TABLE IF NOT EXISTS public.tipo_gg
(
    id character varying(4) COLLATE pg_catalog."default" NOT NULL,
    nombre character varying(16) COLLATE pg_catalog."default",
    CONSTRAINT tipo_gg_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.tipo_gg
    OWNER to postgres;


--7
CREATE TABLE IF NOT EXISTS public.gasto_comun
(
    id character varying(4) COLLATE pg_catalog."default" NOT NULL,
    id_edificio character varying(4) COLLATE pg_catalog."default" NOT NULL,
    id_tipo_gg character varying(4) COLLATE pg_catalog."default" NOT NULL,
    nombre character varying(16) COLLATE pg_catalog."default",
    valor character varying(16) COLLATE pg_catalog."default",
    CONSTRAINT gasto_comun_pkey PRIMARY KEY (id),
    CONSTRAINT fk_gasto_comun_edificio FOREIGN KEY (id_edificio)
        REFERENCES public.edificio (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE,
    CONSTRAINT fk_gasto_comun_tipo_gg FOREIGN KEY (id_tipo_gg)
        REFERENCES public.tipo_gg (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.gasto_comun
    OWNER to postgres;

--8
CREATE TABLE IF NOT EXISTS public.tipo_depto
(
    id character varying COLLATE pg_catalog."default" NOT NULL,
    nombre character varying COLLATE pg_catalog."default",
    CONSTRAINT tipo_depto_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.tipo_depto
    OWNER to postgres;

--9
CREATE TABLE IF NOT EXISTS public.tipo_gg_tipo_depto
(
    id character varying(4) COLLATE pg_catalog."default" NOT NULL,
    id_tipo_gg character varying(4) COLLATE pg_catalog."default" NOT NULL,
    id_tipo_depto character varying(4) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT tipo_gg_tipo_depto_pkey PRIMARY KEY (id),
    CONSTRAINT tipo_gg_tipo_depto_id_tipo_depto_fkey FOREIGN KEY (id_tipo_depto)
        REFERENCES public.tipo_depto (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE,
    CONSTRAINT tipo_gg_tipo_depto_id_tipo_gg_fkey FOREIGN KEY (id_tipo_gg)
        REFERENCES public.tipo_gg (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.tipo_gg_tipo_depto
    OWNER to postgres;

--10
CREATE TABLE IF NOT EXISTS public.depto
(
    id character varying(4) COLLATE pg_catalog."default" NOT NULL,
    id_edificio character varying(4) COLLATE pg_catalog."default" NOT NULL,
    id_tipo_depto character varying(4) COLLATE pg_catalog."default" NOT NULL,
    numero character varying(8) COLLATE pg_catalog."default",
    piso character varying(8) COLLATE pg_catalog."default",
    habitantes character varying(8) COLLATE pg_catalog."default",
    CONSTRAINT depto_pkey PRIMARY KEY (id),
    CONSTRAINT depto_id_edificio_fkey FOREIGN KEY (id_edificio)
        REFERENCES public.edificio (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT depto_id_tipo_depto_fkey FOREIGN KEY (id_tipo_depto)
        REFERENCES public.tipo_depto (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.depto
    OWNER to postgres;

--11
CREATE TABLE IF NOT EXISTS public.pago_gg_depto
(
    id character varying(4) COLLATE pg_catalog."default" NOT NULL,
    id_depto character varying(4) COLLATE pg_catalog."default" NOT NULL,
    id_gasto_comun character varying(4) COLLATE pg_catalog."default" NOT NULL,
    mes character varying(16) COLLATE pg_catalog."default",
    CONSTRAINT pago_gg_depto_pkey PRIMARY KEY (id),
    CONSTRAINT pago_gg_depto_id_depto_fkey FOREIGN KEY (id_depto)
        REFERENCES public.depto (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE,
    CONSTRAINT pago_gg_depto_id_gasto_comun_fkey FOREIGN KEY (id_gasto_comun)
        REFERENCES public.gasto_comun (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        DEFERRABLE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.pago_gg_depto
    OWNER to postgres;