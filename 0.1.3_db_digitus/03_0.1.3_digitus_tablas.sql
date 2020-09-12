\c db_digitus;

-- Table: public.cat_algoritmo
-- DROP TABLE public.cat_algoritmo;
---------------------------------------------Tabla 01 --------------------------------------------------------------------
CREATE TABLE public.cat_algoritmo
(
    id_algoritmo integer NOT NULL DEFAULT nextval('seq_algoritmo_id_algoritmo'::regclass),
    version_algoritmo character varying(50) COLLATE pg_catalog."default",
    formula character varying(500) COLLATE pg_catalog."default",
    fecha_inicio timestamp with time zone DEFAULT timezone('America/Mexico_City'::text, now()),
    fecha_fin timestamp with time zone DEFAULT timezone('America/Mexico_City'::text, now()),
    CONSTRAINT pk_cat_algoritmo_id_algoritmo PRIMARY KEY (id_algoritmo)
        USING INDEX TABLESPACE tsp_digitus
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.cat_algoritmo
    OWNER to usr_digitus;
COMMENT ON TABLE public.cat_algoritmo
    IS 'Tabla que contiene la lista de algoritmos de Fusión aplicados a cada una de las transacciones.';

COMMENT ON COLUMN public.cat_algoritmo.id_algoritmo
    IS 'Llave primaria de la tabla. Es un campo autoincremental.';

COMMENT ON COLUMN public.cat_algoritmo.version_algoritmo
    IS 'Nombre del algoritmo aplicado a la transacción.';

COMMENT ON COLUMN public.cat_algoritmo.formula
    IS 'Valor de la fórmula del algoritmo de Fusión aplicado.';

COMMENT ON COLUMN public.cat_algoritmo.fecha_inicio
    IS 'Fecha en la que entra en operación la formula.';

COMMENT ON COLUMN public.cat_algoritmo.fecha_fin
    IS 'Fecha en la termina la formula.';

---------------------------------------------Tabla 02 --------------------------------------------------------------------
-- Table: public.cat_atributo

-- DROP TABLE public.cat_atributo;

CREATE TABLE public.cat_atributo
(
    id_atributo integer NOT NULL DEFAULT nextval('seq_atributo_id_atributo'::regclass),
    atributo_esp character varying(50) COLLATE pg_catalog."default",
    atributo_ing character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT pk_id_caracteristica PRIMARY KEY (id_atributo)
        USING INDEX TABLESPACE tsp_digitus
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.cat_atributo
    OWNER to usr_digitus;
COMMENT ON TABLE public.cat_atributo
    IS 'Tabla que contiene el catálogo de los diferentes atributos biográficos que puede tener una persona.';

COMMENT ON COLUMN public.cat_atributo.id_atributo
    IS 'Llave primaria de la tabla. Es un campo autoincremental.';

COMMENT ON COLUMN public.cat_atributo.atributo_esp
    IS 'Nombre del atributo de una persona.';

COMMENT ON COLUMN public.cat_atributo.atributo_ing
    IS 'Nombre del atributo de una persona en inglés.';
---------------------------------------------Tabla 03 --------------------------------------------------------------------
-- Table: public.cat_biometrico

-- DROP TABLE public.cat_biometrico;

CREATE TABLE public.cat_biometrico
(
    id_biometrico integer NOT NULL DEFAULT nextval('seq_biometrico_id_biometrico'::regclass),
    tipo_biometrico character varying(10) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_biometrico_id_biometrico PRIMARY KEY (id_biometrico)
        USING INDEX TABLESPACE tsp_digitus
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.cat_biometrico
    OWNER to usr_digitus;
COMMENT ON TABLE public.cat_biometrico
    IS 'Tabla que contiene el catálogo de las diferentes modalidades utilizadas en el sistema biométrico.';

COMMENT ON COLUMN public.cat_biometrico.id_biometrico
    IS 'Llave primaria de la tabla. Es un campo autoincremental.';

COMMENT ON COLUMN public.cat_biometrico.tipo_biometrico
    IS 'Nombre del tipo de biométrico (modalidad).';
---------------------------------------------Tabla 04 --------------------------------------------------------------------
-- Table: public.cat_calidad_extraccion

-- DROP TABLE public.cat_calidad_extraccion;

CREATE TABLE public.cat_calidad_extraccion
(
    id_calidad_extraccion integer NOT NULL DEFAULT nextval('seq_calidad_extraccion_id_calidad_extraccion'::regclass),
    id_biometrico integer NOT NULL,
    valor integer NOT NULL,
    fecha_calidad timestamp with time zone DEFAULT timezone('America/Mexico_City'::text, now()),
    usuario character varying(35) COLLATE pg_catalog."default",
    CONSTRAINT pk_calidad_extraccion_id_calidad_extraccion PRIMARY KEY (id_calidad_extraccion)
        USING INDEX TABLESPACE tsp_digitus,
    CONSTRAINT fk_calidad_extraccion_id_biometrico FOREIGN KEY (id_biometrico)
        REFERENCES public.cat_biometrico (id_biometrico) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.cat_calidad_extraccion
    OWNER to usr_digitus;
COMMENT ON TABLE public.cat_calidad_extraccion
    IS 'Tabla que contiene el catálogo con los valores minimos para una buena calidad para cada modalidad.';

COMMENT ON COLUMN public.cat_calidad_extraccion.id_calidad_extraccion
    IS 'Llave primaria de la tabla. Es un campo autoincremental.';

COMMENT ON COLUMN public.cat_calidad_extraccion.id_biometrico
    IS 'Llave foránea que hace referencia al campo id_biometrico de la tabla cat_biometrico.';

COMMENT ON COLUMN public.cat_calidad_extraccion.valor
    IS 'Valor con el cual una modalidad es aceptada para su procesamiento.';

COMMENT ON COLUMN public.cat_calidad_extraccion.fecha_calidad
    IS 'Fecha en la cual se establecen los valores de calidad para el biométrico.';

COMMENT ON COLUMN public.cat_calidad_extraccion.usuario
    IS 'Nombre del usuario que establece los valores de configuración para el esquema biométrico.';


---------------------------------------------Tabla 05 --------------------------------------------------------------------
-- Table: public.cat_codigo_excepcion

-- DROP TABLE public.cat_codigo_excepcion;

CREATE TABLE public.cat_codigo_excepcion
(
    id_codigo_excepcion integer NOT NULL DEFAULT nextval('seq_codigo_excepcion_id_codigo_excepcion'::regclass),
    codigo character varying(15) COLLATE pg_catalog."default" NOT NULL,
    descripcion character varying(2000) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_codigo_excepcion_id_codigo_excepcion PRIMARY KEY (id_codigo_excepcion)
        USING INDEX TABLESPACE tsp_digitus
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.cat_codigo_excepcion
    OWNER to usr_digitus;
COMMENT ON TABLE public.cat_codigo_excepcion
    IS 'Tabla que contiene el catálogo de los diferentes códigos de excepción que puede tener el sistema.';

COMMENT ON COLUMN public.cat_codigo_excepcion.id_codigo_excepcion
    IS 'Llave primaria de la tabla. Es un campo autoincremental.';

COMMENT ON COLUMN public.cat_codigo_excepcion.codigo
    IS 'Código con el que será ubicado dentro del transaction Manager.';

COMMENT ON COLUMN public.cat_codigo_excepcion.descripcion
    IS 'Descripción con el que sera ubicada la excepción dentro del transaction Manager.';
---------------------------------------------Tabla 06 --------------------------------------------------------------------
-- Table: public.cat_entidad

-- DROP TABLE public.cat_entidad;

CREATE TABLE public.cat_entidad
(
    id_entidad integer NOT NULL DEFAULT nextval('seq_entidad_id_entidad'::regclass),
    entidad character varying(19) COLLATE pg_catalog."default",
    iso_3 character(3) COLLATE pg_catalog."default",
    iso_2 character(2) COLLATE pg_catalog."default",
    renapo character(2) COLLATE pg_catalog."default",
    abreviatura character varying(10) COLLATE pg_catalog."default",
    CONSTRAINT pk_entidad_id_entidad PRIMARY KEY (id_entidad)
        USING INDEX TABLESPACE tsp_digitus
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.cat_entidad
    OWNER to usr_digitus;
COMMENT ON TABLE public.cat_entidad
    IS 'Tabla que contiene el catálogo de los diferentes estados de la República Mexicana.';

COMMENT ON COLUMN public.cat_entidad.id_entidad
    IS 'Llave primaria de la tabla. Es un campo autoincremental.';

COMMENT ON COLUMN public.cat_entidad.entidad
    IS 'Nombre del estado de la República Mexicana';

COMMENT ON COLUMN public.cat_entidad.iso_3
    IS 'Nombre del estado de la República Mexicana representado con el código ISO_31662 compuesto por 3 carácteres';

COMMENT ON COLUMN public.cat_entidad.iso_2
    IS 'Nombre del estado de la República Mexicana representado con el código ISO_2 compuesto por 2 carácteres';

COMMENT ON COLUMN public.cat_entidad.renapo
    IS 'Nombre del estado de la República Mexicana de acuerdo a la información de Renapo';

COMMENT ON COLUMN public.cat_entidad.abreviatura
    IS 'Nombre abreviado del estado de la República Mexicana';
---------------------------------------------Tabla 07 --------------------------------------------------------------------
-- Table: public.cat_equivalencia

-- DROP TABLE public.cat_equivalencia;

CREATE TABLE public.cat_equivalencia
(
    "INSTANCIA" character(2) COLLATE pg_catalog."default" NOT NULL,
    "DEPENDENCIA" character(2) COLLATE pg_catalog."default" NOT NULL,
    "SUBDEPENDENCIA" character(2) COLLATE pg_catalog."default" NOT NULL,
    "ID_ORGANIZACION" integer NOT NULL,
    "ID_SITIO" integer NOT NULL,
    CONSTRAINT pk_equivalencia_insdepsub PRIMARY KEY ("INSTANCIA", "DEPENDENCIA", "SUBDEPENDENCIA")
        USING INDEX TABLESPACE tsp_digitus
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.cat_equivalencia
    OWNER to usr_digitus;
---------------------------------------------Tabla 08 --------------------------------------------------------------------
-- Table: public.cat_estatus

-- DROP TABLE public.cat_estatus;

CREATE TABLE public.cat_estatus
(
    id_estatus integer NOT NULL DEFAULT nextval('seq_estatus_id_estatus'::regclass),
    descripcion character varying(25) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_estatus_id_estatus PRIMARY KEY (id_estatus)
        USING INDEX TABLESPACE tsp_digitus
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.cat_estatus
    OWNER to usr_digitus;
COMMENT ON TABLE public.cat_estatus
    IS 'Tabla que contiene el catálogo de los diferentes eventos que puede tener una transacción durante todo el flujo del sistema.';

COMMENT ON COLUMN public.cat_estatus.id_estatus
    IS 'Llave primaria de la tabla. Es un campo autoincremental.';

COMMENT ON COLUMN public.cat_estatus.descripcion
    IS 'Valor descriptivo correspondiente al estatus de una transacción.';
---------------------------------------------Tabla 09 --------------------------------------------------------------------
-- Table: public.cat_estatus_alerta

-- DROP TABLE public.cat_estatus_alerta;

CREATE TABLE public.cat_estatus_alerta
(
    id_estatus_alerta integer NOT NULL DEFAULT nextval('seq_estatus_alerta_id_estatus_alerta'::regclass),
    estatus character varying COLLATE pg_catalog."default",
    CONSTRAINT pk_estatus_alerta_id_estatus_alerta PRIMARY KEY (id_estatus_alerta)
        USING INDEX TABLESPACE tsp_digitus
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.cat_estatus_alerta
    OWNER to usr_digitus;
COMMENT ON TABLE public.cat_estatus_alerta
    IS 'Catalogo que contiene los diferentes eventos de alerta, que puede tener una transacción durante todo el flujo del sistema.';

COMMENT ON COLUMN public.cat_estatus_alerta.id_estatus_alerta
    IS 'Llave primaria de la tabla. Es un campo autoincremental.';

COMMENT ON COLUMN public.cat_estatus_alerta.estatus
    IS 'Valor descriptivo correspondiente al estatus de alerta, de una transacción.';
---------------------------------------------Tabla 10 --------------------------------------------------------------------
-- Table: public.cat_estatus_deduplicacion

-- DROP TABLE public.cat_estatus_deduplicacion;

CREATE TABLE public.cat_estatus_deduplicacion
(
    id_estatus_deduplicacion integer NOT NULL DEFAULT nextval('seq_estatus_ddp_id_estatus_ddp'::regclass),
    descripcion character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT pk_estatus_ddp_id_estatus_ddp PRIMARY KEY (id_estatus_deduplicacion)
        USING INDEX TABLESPACE tsp_digitus
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.cat_estatus_deduplicacion
    OWNER to usr_digitus;
COMMENT ON TABLE public.cat_estatus_deduplicacion
    IS ' ';

COMMENT ON COLUMN public.cat_estatus_deduplicacion.id_estatus_deduplicacion
    IS 'Llave primaria de la tabla. Es un campo autoincremental.';
---------------------------------------------Tabla 11 --------------------------------------------------------------------
-- Table: public.cat_evento

-- DROP TABLE public.cat_evento;

CREATE TABLE public.cat_evento
(
    id_evento integer NOT NULL DEFAULT nextval('seq_evento_id_evento'::regclass),
    evento character varying COLLATE pg_catalog."default",
    CONSTRAINT cat_evento_pkey PRIMARY KEY (id_evento)
        USING INDEX TABLESPACE tsp_digitus
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.cat_evento
    OWNER to usr_digitus;
COMMENT ON TABLE public.cat_evento
    IS 'Tabla que contiene la lista de los diferentes eventos que puede tener una transacción durante todo el flujo del sistema.';

COMMENT ON COLUMN public.cat_evento.id_evento
    IS 'Llave primaria de la tabla. Es un campo autoincremental.';

COMMENT ON COLUMN public.cat_evento.evento
    IS 'Valor descriptivo correspondiente al tipo de evento de una transacción.';
---------------------------------------------Tabla 12 --------------------------------------------------------------------
-- Table: public.cat_motorbio

-- DROP TABLE public.cat_motorbio;

CREATE TABLE public.cat_motorbio
(
    id_motorbio integer NOT NULL DEFAULT nextval('seq_motorbio_id_motorbio'::regclass),
    motor character varying(50) COLLATE pg_catalog."default" NOT NULL,
    descripcion character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT pk_motorbio_id_motorbio PRIMARY KEY (id_motorbio)
        USING INDEX TABLESPACE tsp_digitus
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.cat_motorbio
    OWNER to usr_digitus;
COMMENT ON TABLE public.cat_motorbio
    IS 'Tabla que contiene el catálogo de los diferentes motores biométricos utilizados en el sistema';

COMMENT ON COLUMN public.cat_motorbio.id_motorbio
    IS 'Llave primaria de la tabla. Es un campo autoincremental.';

COMMENT ON COLUMN public.cat_motorbio.motor
    IS 'Nombre del motor biométrico.';

COMMENT ON COLUMN public.cat_motorbio.descripcion
    IS 'Nombre descriptivo del motor biométrico.';
---------------------------------------------Tabla 13 --------------------------------------------------------------------
-- Table: public.cat_operaciontipo

-- DROP TABLE public.cat_operaciontipo;

CREATE TABLE public.cat_operaciontipo
(
    id_operaciontipo integer NOT NULL DEFAULT nextval('seq_operaciontipo_id_operaciontipo'::regclass),
    tipo_operacion character varying(25) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_operaciontipo_id_operaciontipo PRIMARY KEY (id_operaciontipo)
        USING INDEX TABLESPACE tsp_digitus
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.cat_operaciontipo
    OWNER to usr_digitus;
COMMENT ON TABLE public.cat_operaciontipo
    IS 'Tabla que contiene el catálogo de los diferentes tipos de operaciones que pueden realizarse en el sistema';

COMMENT ON COLUMN public.cat_operaciontipo.id_operaciontipo
    IS 'Llave primaria de la tabla. Es un campo autoincremental.';

COMMENT ON COLUMN public.cat_operaciontipo.tipo_operacion
    IS 'Nombre descriptivo del tipo de operación.';
---------------------------------------------Tabla 14 --------------------------------------------------------------------
-- Table: public.cat_secretaria

-- DROP TABLE public.cat_secretaria;

CREATE TABLE public.cat_secretaria
(
    id_secretaria integer NOT NULL DEFAULT nextval('seq_secretaria_id_secretaria'::regclass),
    secretaria character varying(150) COLLATE pg_catalog."default" NOT NULL,
    descripcion character varying(150) COLLATE pg_catalog."default" NOT NULL,
    dependencia_ext boolean NOT NULL,
    CONSTRAINT pk_secretaria_id_secretaria PRIMARY KEY (id_secretaria)
        USING INDEX TABLESPACE tsp_digitus
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.cat_secretaria
    OWNER to usr_digitus;
COMMENT ON TABLE public.cat_secretaria
    IS 'Catálogo que contiene la lista de las diferentes secretarías que pueden participar en el motor biométrico.';

COMMENT ON COLUMN public.cat_secretaria.id_secretaria
    IS 'Llave primaria de la tabla. Es un campo autoincremental.';

COMMENT ON COLUMN public.cat_secretaria.secretaria
    IS 'Valor correspondiente al nombre de la setretaría.';

COMMENT ON COLUMN public.cat_secretaria.descripcion
    IS 'Valor descriptivo de la secretaría.';

COMMENT ON COLUMN public.cat_secretaria.dependencia_ext
    IS 'Nombre de la dependencia exterior, equivalente a secretaria en México.';


---------------------------------------------Tabla 15 --------------------------------------------------------------------
-- Table: public.cat_pais

-- DROP TABLE public.cat_pais;

CREATE TABLE public.cat_pais
(
    id_pais integer NOT NULL DEFAULT nextval('seq_pais_id_pais'::regclass),
    iso_2 character(2) COLLATE pg_catalog."default",
    iso_3 character(3) COLLATE pg_catalog."default",
    descripcion character varying(60) COLLATE pg_catalog."default",
    CONSTRAINT pk_pais_id_pais PRIMARY KEY (id_pais)
        USING INDEX TABLESPACE tsp_digitus
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.cat_pais
    OWNER to usr_digitus;
COMMENT ON TABLE public.cat_pais
    IS 'Tabla que contienen el catálogo de la lista de países de acuerdo al formato estándar ISO 3166.';

COMMENT ON COLUMN public.cat_pais.id_pais
    IS 'Llave primaria de la tabla. Es un campo autoincremental.';

COMMENT ON COLUMN public.cat_pais.iso_2
    IS 'Código de país según el estándar ISO 3166/2.';

COMMENT ON COLUMN public.cat_pais.iso_3
    IS 'Código de país según el estándar ISO 3166/3';

COMMENT ON COLUMN public.cat_pais.descripcion
    IS 'Nombre descriptivo del país.';
---------------------------------------------Tabla 16 --------------------------------------------------------------------
-- Table: public.cat_posicion

-- DROP TABLE public.cat_posicion;

CREATE TABLE public.cat_posicion
(
    id_posicion integer NOT NULL DEFAULT nextval('seq_posicion_id_posicion'::regclass),
    posicion integer NOT NULL,
    descripcion_esp character varying(60) COLLATE pg_catalog."default" NOT NULL,
    descripcion_ing character varying(60) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_posicion_id_posicion PRIMARY KEY (id_posicion)
        USING INDEX TABLESPACE tsp_digitus
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.cat_posicion
    OWNER to usr_digitus;
COMMENT ON TABLE public.cat_posicion
    IS 'Tabla que contiene el catálogo de la lista de posiciones por cada uno de los biométricos; (huellas, Iris y rostro), en base al estándar ANSI NIST ITL-2011.';

COMMENT ON COLUMN public.cat_posicion.id_posicion
    IS 'Llave primaria de la tabla. Es un campo autoincremental.';

COMMENT ON COLUMN public.cat_posicion.posicion
    IS 'Clave única de la posición biométrica.';

COMMENT ON COLUMN public.cat_posicion.descripcion_esp
    IS 'Valor descriptivo de la posición del biométrico en Español.';

COMMENT ON COLUMN public.cat_posicion.descripcion_ing
    IS 'Valor descriptivo de la posición del biométrico en Inglés.';
---------------------------------------------Tabla 17 --------------------------------------------------------------------
-- Table: public.cat_programa

-- DROP TABLE public.cat_programa;

CREATE TABLE public.cat_programa
(
    id_programa integer NOT NULL DEFAULT nextval('seq_programa_id_programa'::regclass),
    nombre_programa varchar (50),
    CONSTRAINT pk_programa_id_programa PRIMARY KEY (id_programa)
        USING INDEX TABLESPACE tsp_digitus
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.cat_programa
    OWNER to usr_digitus;
---------------------------------------------Tabla 18 --------------------------------------------------------------------
-- Table: public.cat_recuperacion_biometrico

-- DROP TABLE public.cat_recuperacion_biometrico;

CREATE TABLE public.cat_recuperacion_biometrico
(
    id_recuperacion_biometrico integer NOT NULL DEFAULT nextval('seq_recuperacion_biometrico_id_recuperacion_biometrico'::regclass),
    descripcion character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT pk_recuperacion_biometrico_id_recuperacion_bio PRIMARY KEY (id_recuperacion_biometrico)
        USING INDEX TABLESPACE tsp_digitus
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.cat_recuperacion_biometrico
    OWNER to usr_digitus;
COMMENT ON TABLE public.cat_recuperacion_biometrico
    IS 'Tabla que contiene ';

COMMENT ON COLUMN public.cat_recuperacion_biometrico.id_recuperacion_biometrico
    IS ' ';

COMMENT ON COLUMN public.cat_recuperacion_biometrico.descripcion
    IS ' ';
---------------------------------------------Tabla 19 --------------------------------------------------------------------


-- Table: public.cat_organizacion

-- DROP TABLE public.cat_organizacion;

CREATE TABLE public.cat_organizacion
(
    id_organizacion integer NOT NULL DEFAULT nextval('seq_organizacion_id_organizacion'::regclass),
    id_secretaria integer NOT NULL,
    organizacion character varying(150) COLLATE pg_catalog."default" NOT NULL,
    unidad character varying(50) COLLATE pg_catalog."default",
    subunidad character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT pk_organizacion_id_organizacion PRIMARY KEY (id_organizacion)
        USING INDEX TABLESPACE tsp_digitus,
    CONSTRAINT fk_organizacion_id_secretaria FOREIGN KEY (id_secretaria)
        REFERENCES public.cat_secretaria (id_secretaria) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.cat_organizacion
    OWNER to usr_digitus;
COMMENT ON TABLE public.cat_organizacion
    IS 'Tabla que contiene el catálogo de las diferentes organizaciones que una secretaría puede tener y que participan en el proyecto de identificación biométrica';

COMMENT ON COLUMN public.cat_organizacion.id_organizacion
    IS 'Llave primaria de la tabla. Es un campo autoincremental.';

COMMENT ON COLUMN public.cat_organizacion.id_secretaria
    IS 'Llave foránea que hace referencia al campo id_secretaria de la tabla cat_secretaria.';

COMMENT ON COLUMN public.cat_organizacion.organizacion
    IS 'Valor correspondiente al nombre de la organización.';

COMMENT ON COLUMN public.cat_organizacion.unidad
    IS 'Valor correspondiente al nombre de la unidad a la que pertenece la organización.';

COMMENT ON COLUMN public.cat_organizacion.subunidad
    IS 'Valor correspondiente al nombre de la subunidad a la que pertenece la organización.';

---------------------------------------------Tabla 20 --------------------------------------------------------------------
-- Table: public.cat_sistema

-- DROP TABLE public.cat_sistema;

CREATE TABLE public.cat_sistema
(
    id_sistema integer NOT NULL DEFAULT nextval('seq_sistema_id_sistema'::regclass),
    nombre_sistema varchar (50),
    CONSTRAINT pk_sistema_id_sistema PRIMARY KEY (id_sistema)
        USING INDEX TABLESPACE tsp_digitus
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.cat_sistema
    OWNER to usr_digitus;
---------------------------------------------Tabla 21 --------------------------------------------------------------------
-- Table: public.cat_sitio

-- DROP TABLE public.cat_sitio;

CREATE TABLE public.cat_sitio
(
    id_sitio integer NOT NULL DEFAULT nextval('seq_sitio_id_sitio'::regclass),
    id_secretaria integer NOT NULL,
    sitio character varying(150) COLLATE pg_catalog."default" NOT NULL,
    descripcion character varying(150) COLLATE pg_catalog."default",
    id_entidad integer NOT NULL,
    latitud numeric(11,8),
    longitud numeric(11,8),
    id_organizacion integer,
    CONSTRAINT pk_sitio_id_sitio PRIMARY KEY (id_sitio)
        USING INDEX TABLESPACE tsp_digitus,
    CONSTRAINT fk_sitio_id_entidad FOREIGN KEY (id_entidad)
        REFERENCES public.cat_entidad (id_entidad) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_sitio_id_secretaria FOREIGN KEY (id_secretaria)
        REFERENCES public.cat_secretaria (id_secretaria) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.cat_sitio
    OWNER to usr_digitus;
COMMENT ON TABLE public.cat_sitio
    IS 'Tabla que contiene el catálogo de sitios disponibles por las secretarías para enrolamientos';

COMMENT ON COLUMN public.cat_sitio.id_sitio
    IS 'Llave primaria de la tabla. Es un campo autoincremental.';

COMMENT ON COLUMN public.cat_sitio.id_secretaria
    IS 'Llave foránea que hace referencia a la tabla cat_secretaria.';

COMMENT ON COLUMN public.cat_sitio.sitio
    IS 'Clave o nombre del sitio de enrolamiento';

COMMENT ON COLUMN public.cat_sitio.descripcion
    IS 'Nombre descriptivo del sitio de enrolamiento';

COMMENT ON COLUMN public.cat_sitio.id_entidad
    IS 'Llave foránea que hace referencia a la tabla cat_entidad';

COMMENT ON COLUMN public.cat_sitio.latitud
    IS 'Datos de latitud del sitio';

COMMENT ON COLUMN public.cat_sitio.longitud
    IS 'Datos de longitud del sitio';
---------------------------------------------Tabla 22 --------------------------------------------------------------------
-- Table: public.cat_tipo_alerta

-- DROP TABLE public.cat_tipo_alerta;

CREATE TABLE public.cat_tipo_alerta
(
    id_tipo_alerta integer NOT NULL DEFAULT nextval('seq_tipo_alerta_id_tipo_alerta'::regclass),
    alerta character varying(20) COLLATE pg_catalog."default",
    verificacion character(2) COLLATE pg_catalog."default",
    CONSTRAINT pk_tipo_alerta_id_tipo_alerta PRIMARY KEY (id_tipo_alerta)
        USING INDEX TABLESPACE tsp_digitus
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.cat_tipo_alerta
    OWNER to usr_digitus;
COMMENT ON TABLE public.cat_tipo_alerta
    IS 'Tabla que contiene ';
---------------------------------------------Tabla 23 --------------------------------------------------------------------
-- Table: public.cat_tipo_respuesta

-- DROP TABLE public.cat_tipo_respuesta;

CREATE TABLE public.cat_tipo_respuesta
(
    id_tipo_respuesta integer NOT NULL DEFAULT nextval('seq_tipo_respuesta_id_tipo_respuesta'::regclass),
    respuesta_esp character varying(30) COLLATE pg_catalog."default",
    respuesta_ing character varying(30) COLLATE pg_catalog."default",
    CONSTRAINT pk_respuesta_id_tipo_respuesta PRIMARY KEY (id_tipo_respuesta)
        USING INDEX TABLESPACE tsp_digitus
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.cat_tipo_respuesta
    OWNER to usr_digitus;
---------------------------------------------Tabla 24 --------------------------------------------------------------------
-- Table: public.cat_tipo_verificacion

-- DROP TABLE public.cat_tipo_verificacion;

CREATE TABLE public.cat_tipo_verificacion
(
    id_tipo_verificacion integer NOT NULL DEFAULT nextval('seq_tipo_verificacion_id_tipo_verificacion'::regclass),
    descripcion character varying(10) COLLATE pg_catalog."default",
    CONSTRAINT pk_tipo_vf_id_tipo_verificacion PRIMARY KEY (id_tipo_verificacion)
        USING INDEX TABLESPACE tsp_digitus
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.cat_tipo_verificacion
    OWNER to usr_digitus;
---------------------------------------------Tabla 25 --------------------------------------------------------------------
-- Table: public.cat_umbral_conf

-- DROP TABLE public.cat_umbral_conf;

CREATE TABLE public.cat_umbral_conf
(
    id_umbral_conf integer NOT NULL DEFAULT nextval('seq_umbral_conf_id_umbral_conf'::regclass),
    id_motorbio integer NOT NULL,
    id_organizacion integer NOT NULL,
    id_biometrico integer NOT NULL,
    umbral_minimo integer,
    umbral_maximo integer,
    fecha_modificacion timestamp with time zone DEFAULT timezone('America/Mexico_City'::text, now()),
    usuario character varying(20) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_umbral_conf_id_umbral_conf PRIMARY KEY (id_umbral_conf)
        USING INDEX TABLESPACE tsp_digitus,
    CONSTRAINT fk_umbral_conf_id_biometrico FOREIGN KEY (id_biometrico)
        REFERENCES public.cat_biometrico (id_biometrico) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_umbral_conf_id_motorbio FOREIGN KEY (id_motorbio)
        REFERENCES public.cat_motorbio (id_motorbio) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_umbral_conf_id_organizacion FOREIGN KEY (id_organizacion)
        REFERENCES public.cat_organizacion (id_organizacion) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.cat_umbral_conf
    OWNER to usr_digitus;
COMMENT ON TABLE public.cat_umbral_conf
    IS 'Tabla que almacena los valores de configuración de los diferentes esquemas biométricos que pueden ser utilizados en el proceso Fusión.';

COMMENT ON COLUMN public.cat_umbral_conf.id_umbral_conf
    IS 'Llave primaria de la tabla. Es un campo autoincremental.';

COMMENT ON COLUMN public.cat_umbral_conf.id_motorbio
    IS 'Llave foránea que hace referencia al campo id_motorbio de la tabla cat_motorbio.';

COMMENT ON COLUMN public.cat_umbral_conf.id_organizacion
    IS 'Llave foránea que hace referencia al campo id_organizacion de la tabla cat_organizacion.';

COMMENT ON COLUMN public.cat_umbral_conf.id_biometrico
    IS 'Llave foránea que hace referencia al campo id_biometrico de la tabla cat_biometrico.';

COMMENT ON COLUMN public.cat_umbral_conf.umbral_minimo
    IS 'El umbral bajo define el nivel donde las puntuaciones más bajas son omitidas.';

COMMENT ON COLUMN public.cat_umbral_conf.umbral_maximo
    IS 'El umbral superior define el nivel donde los puntajes mayores o iguales son "Hits absolutos". Las puntuaciones mayores o iguales a umbral_minimo y menores a ubral_maximo son "Area gris".';

COMMENT ON COLUMN public.cat_umbral_conf.fecha_modificacion
    IS 'Fecha en la cual se establecen los valores de configuración para el esquema biométrico.';

COMMENT ON COLUMN public.cat_umbral_conf.usuario
    IS 'Nombre del usuario que establece los valores de configuración para el esquema biométrico.';


---------------------------------------------Tabla 26 --------------------------------------------------------------------
-- Table: public.tbl_asociado

-- DROP TABLE public.tbl_asociado;

CREATE TABLE public.tbl_asociado
(
    id_asociado integer NOT NULL DEFAULT nextval('seq_asociado_id_asociado'::regclass),
    id_secretaria integer NOT NULL,
    id_organizacion integer NOT NULL,
    id_programa integer,
    id_sitio integer NOT NULL,
    id_sistema integer,
    codigo character varying(50) COLLATE pg_catalog."default",
    fecha_asociado timestamp with time zone DEFAULT timezone('America/Mexico_City'::text, now()),
    id_secretaria_ver integer,
    permiso boolean,
    usuario character varying COLLATE pg_catalog."default",
    busqueda_externa boolean,
    CONSTRAINT pk_asociado_id_asociado PRIMARY KEY (id_asociado)
        USING INDEX TABLESPACE tsp_digitus,
    CONSTRAINT fk_asociado_id_secretaria FOREIGN KEY (id_secretaria)
        REFERENCES public.cat_secretaria (id_secretaria) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_asociado_id_sitio FOREIGN KEY (id_sitio)
        REFERENCES public.cat_sitio (id_sitio) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.tbl_asociado
    OWNER to usr_digitus;
---------------------------------------------Tabla 27 --------------------------------------------------------------------
-- Table: public.tbl_asociado_his

-- DROP TABLE public.tbl_asociado_his;

CREATE TABLE public.tbl_asociado_his
(
    id_asociado_his integer NOT NULL DEFAULT nextval('seq_asociado_his_id_asosciado_his'::regclass),
    id_asociado integer NOT NULL,
    id_secretaria integer NOT NULL,
    id_organizacion integer NOT NULL,
    id_programa integer NOT NULL,
    id_sitio integer NOT NULL,
    id_sistema integer NOT NULL,
    codigo character varying(50) COLLATE pg_catalog."default",
    id_operaciontipo character varying(50) COLLATE pg_catalog."default",
    fecha_asociado timestamp with time zone DEFAULT timezone('America/Mexico_City'::text, now()),
    id_secretaria_ver integer,
    permiso boolean,
    usuario character varying COLLATE pg_catalog."default",
    busqueda_externa boolean,
    fecha_modificacion timestamp with time zone DEFAULT timezone('America/Mexico_City'::text, now()),
    tipo_modificacion character(10) COLLATE pg_catalog."default",
    fecha_vigencia timestamp with time zone DEFAULT timezone('America/Mexico_City'::text, now()),
    CONSTRAINT pk_asociado_id_asociado_his PRIMARY KEY (id_asociado_his)
        USING INDEX TABLESPACE tsp_digitus,
    CONSTRAINT fk_asociado_his_id_asociado FOREIGN KEY (id_asociado)
        REFERENCES public.tbl_asociado (id_asociado) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.tbl_asociado_his
    OWNER to usr_digitus;
---------------------------------------------Tabla 28 --------------------------------------------------------------------
-- Table: public.tbl_asociado_operacion

-- DROP TABLE public.tbl_asociado_operacion;

CREATE TABLE public.tbl_asociado_operacion
(
    id_asociado_operacion integer NOT NULL DEFAULT nextval('seq_asociado_operacion_id_asociado_operacion'::regclass),
    id_asociado integer,
    id_operaciontipo integer,
    operacion_habilitada boolean NOT NULL,
    CONSTRAINT pk_asociado_op_id_asociado_op PRIMARY KEY (id_asociado_operacion)
        USING INDEX TABLESPACE tsp_digitus,
    CONSTRAINT fk_asociado_op_id_asociado FOREIGN KEY (id_asociado)
        REFERENCES public.tbl_asociado (id_asociado) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.tbl_asociado_operacion
    OWNER to usr_digitus;
---------------------------------------------Tabla 29 --------------------------------------------------------------------
-- Table: public.tbl_calidad

-- DROP TABLE public.tbl_calidad;

CREATE TABLE public.tbl_calidad
(
    id_persona uuid,
    total_calidad numeric,
    calidad character varying(15) COLLATE pg_catalog."default",
    fecha_insercion timestamp without time zone
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.tbl_calidad
    OWNER to usr_digitus;
COMMENT ON TABLE public.tbl_calidad
    IS ' ';

COMMENT ON COLUMN public.tbl_calidad.id_persona
    IS ' ';

COMMENT ON COLUMN public.tbl_calidad.total_calidad
    IS ' ';

COMMENT ON COLUMN public.tbl_calidad.calidad
    IS ' ';

COMMENT ON COLUMN public.tbl_calidad.fecha_insercion
    IS ' ';
---------------------------------------------Tabla 30 --------------------------------------------------------------------
-- Table: public.tbl_calidad_extraccion_his

-- DROP TABLE public.tbl_calidad_extraccion_his;

CREATE TABLE public.tbl_calidad_extraccion_his
(
    id_calidad_extraccion_his integer NOT NULL DEFAULT nextval('seq_calidad_extraccion_his_id_calidad_extraccion_his'::regclass),
    id_calidad_extraccion integer NOT NULL,
    id_biometrico integer NOT NULL,
    valor integer NOT NULL,
    fecha_calidad timestamp with time zone DEFAULT timezone('America/Mexico_City'::text, now()),
    usuario character varying(35) COLLATE pg_catalog."default",
    operacion character(1) COLLATE pg_catalog."default",
    CONSTRAINT pk_calidad_extraccion_his_id_calidad_extraccion_his PRIMARY KEY (id_calidad_extraccion_his)
        USING INDEX TABLESPACE tsp_digitus,
    CONSTRAINT fk_calidad_extraccion_his_id_calidad_extraccion FOREIGN KEY (id_calidad_extraccion)
        REFERENCES public.cat_calidad_extraccion (id_calidad_extraccion) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.tbl_calidad_extraccion_his
    OWNER to usr_digitus;
COMMENT ON TABLE public.tbl_calidad_extraccion_his
    IS '?????.';

COMMENT ON COLUMN public.tbl_calidad_extraccion_his.id_calidad_extraccion
    IS 'Llave primaria de la tabla. Es un campo autoincremental.';

COMMENT ON COLUMN public.tbl_calidad_extraccion_his.id_biometrico
    IS 'Llave foránea que hace referencia al campo id_biometrico de la tabla cat_biometrico.';

COMMENT ON COLUMN public.tbl_calidad_extraccion_his.valor
    IS '?????.';

COMMENT ON COLUMN public.tbl_calidad_extraccion_his.fecha_calidad
    IS '?????.';

COMMENT ON COLUMN public.tbl_calidad_extraccion_his.usuario
    IS '?????.';

COMMENT ON COLUMN public.tbl_calidad_extraccion_his.operacion
    IS 'Tipo de operación que se realizó en la tabla cat_umbral. (A) Actualización, (B) Baja, (C) Cambio.';
---------------------------------------------Tabla 31 --------------------------------------------------------------------
-- Table: public.tbl_persona

-- DROP TABLE public.tbl_persona;

CREATE TABLE public.tbl_persona
(
    id_persona uuid NOT NULL,
    id_organizacion integer NOT NULL,
    llave_origen character varying(50) COLLATE pg_catalog."default" NOT NULL,
    id_estatus integer NOT NULL,
    fecha_creacion timestamp with time zone DEFAULT timezone('America/Mexico_City'::text, now()),
    fecha_captura timestamp with time zone DEFAULT timezone('America/Mexico_City'::text, now()),
    id_terminal character varying(50) COLLATE pg_catalog."default" NOT NULL,
    id_sitio integer NOT NULL,
    tipo_transaccion character varying(3) COLLATE pg_catalog."default",
    id_operaciontipo integer NOT NULL,
    fecha_final timestamp with time zone DEFAULT timezone('America/Mexico_City'::text, now()),
    CONSTRAINT pk_persona_uuid PRIMARY KEY (id_persona)
        USING INDEX TABLESPACE tsp_digitus,
    CONSTRAINT fk_persona_id_estatus FOREIGN KEY (id_estatus)
        REFERENCES public.cat_estatus (id_estatus) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_persona_id_operaciontipo FOREIGN KEY (id_operaciontipo)
        REFERENCES public.cat_operaciontipo (id_operaciontipo) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_persona_id_organizacion FOREIGN KEY (id_organizacion)
        REFERENCES public.cat_organizacion (id_organizacion) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_persona_id_sitio FOREIGN KEY (id_sitio)
        REFERENCES public.cat_sitio (id_sitio) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.tbl_persona
    OWNER to usr_digitus;
COMMENT ON TABLE public.tbl_persona
    IS 'Tabla que registra la informacion de personas que entran al sistema de identificación biométrica.';

COMMENT ON COLUMN public.tbl_persona.id_persona
    IS 'Llave primaria de la tabla. Identificador único para representar una transacción de persona.';

COMMENT ON COLUMN public.tbl_persona.id_organizacion
    IS 'Llave foránea que hace referencia a la tabla cat_organizacion.';

COMMENT ON COLUMN public.tbl_persona.llave_origen
    IS 'Identificador único que proviene de la base de datos origen; funciona como una clave para identificar una identidad.';

COMMENT ON COLUMN public.tbl_persona.id_estatus
    IS 'Llave foránea que hace referencia a la tabla cat_estatus indicando el estatus de la transacción.';

COMMENT ON COLUMN public.tbl_persona.fecha_creacion
    IS 'Fecha y hora en la que el registro es insertado en la tabla.';

COMMENT ON COLUMN public.tbl_persona.fecha_captura
    IS 'Fecha en la que fue capturado el registro.';

COMMENT ON COLUMN public.tbl_persona.id_terminal
    IS 'Dispositivo que registra el enrolamiento';

COMMENT ON COLUMN public.tbl_persona.id_sitio
    IS 'LLave foránea que hace referencia a la tabla cat_sitio';

COMMENT ON COLUMN public.tbl_persona.tipo_transaccion
    IS 'Valor que indica el tipo de transacción realizada, puede ser CLI (cliente) o IMP (importación).';

COMMENT ON COLUMN public.tbl_persona.id_operaciontipo
    IS 'Llave foránea que hace referencia a la tabla cat_operaciontipo.';

COMMENT ON COLUMN public.tbl_persona.fecha_final
    IS 'Fecha y hora en la que concluye el flujo total de enrolamiento.';

---------------------------------------------Tabla 32 --------------------------------------------------------------------
-- Table: public.tbl_alerta

-- DROP TABLE public.tbl_alerta;

CREATE TABLE public.tbl_alerta
(
    id_alerta integer NOT NULL DEFAULT nextval('seq_alerta_id_alerta'::regclass),
    id_persona uuid NOT NULL,
    id_tipo_alerta integer NOT NULL,
    descripcion character varying(200) COLLATE pg_catalog."default",
    fecha_insercion timestamp without time zone,
    id_estatus_alerta integer NOT NULL,
    usuario_alerta character varying(20) COLLATE pg_catalog."default",
    CONSTRAINT pk_alerta_id_alerta PRIMARY KEY (id_alerta)
        USING INDEX TABLESPACE tsp_digitus,
    CONSTRAINT fk_alerta_id_estatus_alerta FOREIGN KEY (id_estatus_alerta)
        REFERENCES public.cat_estatus_alerta (id_estatus_alerta) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_alerta_id_persona FOREIGN KEY (id_persona)
        REFERENCES public.tbl_persona (id_persona) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_alerta_id_tipo_alerta FOREIGN KEY (id_tipo_alerta)
        REFERENCES public.cat_tipo_alerta (id_tipo_alerta) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.tbl_alerta
    OWNER to usr_digitus;
COMMENT ON TABLE public.tbl_alerta
    IS ' ';

COMMENT ON COLUMN public.tbl_alerta.id_alerta
    IS ' ';

COMMENT ON COLUMN public.tbl_alerta.id_persona
    IS ' ';

COMMENT ON COLUMN public.tbl_alerta.id_tipo_alerta
    IS ' ';

COMMENT ON COLUMN public.tbl_alerta.descripcion
    IS ' ';

COMMENT ON COLUMN public.tbl_alerta.fecha_insercion
    IS ' ';

COMMENT ON COLUMN public.tbl_alerta.id_estatus_alerta
    IS ' ';

COMMENT ON COLUMN public.tbl_alerta.usuario_alerta
    IS ' ';
---------------------------------------------Tabla 33 --------------------------------------------------------------------
-- Table: public.tbl_candidato

-- DROP TABLE public.tbl_candidato;

CREATE TABLE public.tbl_candidato
(
    id_candidato integer NOT NULL DEFAULT nextval('seq_candidato_id_candidato'::regclass),
    id_candidato_persona uuid NOT NULL,
    id_persona uuid NOT NULL,
    id_estatus_candidato integer NOT NULL,
    puntaje_fusion numeric(18,17),
    id_algoritmo integer NOT NULL,
    CONSTRAINT pk_candidato_id_candidato PRIMARY KEY (id_candidato)
        USING INDEX TABLESPACE tsp_digitus,
    CONSTRAINT fk_candidato_id_algoritmo FOREIGN KEY (id_algoritmo)
        REFERENCES public.cat_algoritmo (id_algoritmo) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_candidato_id_estatus_candidato FOREIGN KEY (id_estatus_candidato)
        REFERENCES public.cat_estatus (id_estatus) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_candidato_id_persona FOREIGN KEY (id_persona)
        REFERENCES public.tbl_persona (id_persona) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.tbl_candidato
    OWNER to usr_digitus;
COMMENT ON TABLE public.tbl_candidato
    IS 'Tabla que registra la lista de coincidencias que regresa el proceso de Fusión respecto a una búsqueda biométrica.';

COMMENT ON COLUMN public.tbl_candidato.id_candidato
    IS 'Llave primaria de la tabla. Es un campo autoincremental.';

COMMENT ON COLUMN public.tbl_candidato.id_candidato_persona
    IS 'Identificador único del candidato con el que tuvo coincidencia la persona a enrolarse.';

COMMENT ON COLUMN public.tbl_candidato.id_persona
    IS 'Llave foránea que identifica la transacción, proviene de la tabla tbl_persona.';

COMMENT ON COLUMN public.tbl_candidato.id_estatus_candidato
    IS 'Valor que indica el estatus general del candidato, para este caso todos son hit.';

COMMENT ON COLUMN public.tbl_candidato.puntaje_fusion
    IS 'Valor del puntaje de Fusión.';

COMMENT ON COLUMN public.tbl_candidato.id_algoritmo
    IS 'Llave foránea que hace referencia al campo id_algoritmo de la tabla cat_algoritmo.';
---------------------------------------------Tabla 34 --------------------------------------------------------------------
-- Table: public.tbl_candidato_detalle

-- DROP TABLE public.tbl_candidato_detalle;

CREATE TABLE public.tbl_candidato_detalle
(
    id_candidato_detalle integer NOT NULL DEFAULT nextval('seq_candidato_detalle_id_candidato_detalle'::regclass),
    id_candidato integer NOT NULL,
    id_biometrico integer NOT NULL,
    id_posicion integer NOT NULL,
    id_estatus_biometrico integer NOT NULL,
    id_motorbio integer NOT NULL,
    puntaje_motor numeric(6,2),
    umbral_maximo integer,
    umbral_minimo integer,
    CONSTRAINT pk_candidato_detalle_id_candidato_detalle PRIMARY KEY (id_candidato_detalle)
        USING INDEX TABLESPACE tsp_digitus,
    CONSTRAINT fk_candidato_detalle_id_biometrico FOREIGN KEY (id_biometrico)
        REFERENCES public.cat_biometrico (id_biometrico) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_candidato_detalle_id_candidato FOREIGN KEY (id_candidato)
        REFERENCES public.tbl_candidato (id_candidato) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_candidato_detalle_id_estatus_biometrico FOREIGN KEY (id_estatus_biometrico)
        REFERENCES public.cat_estatus (id_estatus) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_candidato_detalle_id_motorbio FOREIGN KEY (id_motorbio)
        REFERENCES public.cat_motorbio (id_motorbio) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_candidato_detalle_id_posicion FOREIGN KEY (id_posicion)
        REFERENCES public.cat_posicion (id_posicion) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.tbl_candidato_detalle
    OWNER to usr_digitus;
COMMENT ON TABLE public.tbl_candidato_detalle
    IS 'Tabla que registra los detalles biométricos de un candidato.';

COMMENT ON COLUMN public.tbl_candidato_detalle.id_candidato_detalle
    IS 'Llave primaria de la tabla. Es un campo autoincremental.';

COMMENT ON COLUMN public.tbl_candidato_detalle.id_candidato
    IS 'Llave foránea que hace referencia al campo id_candidato de la tabla tbl_candidato.';

COMMENT ON COLUMN public.tbl_candidato_detalle.id_biometrico
    IS 'Llave foránea que hace referencia al campo id_biometrico de la tabla cat_biometrico.';

COMMENT ON COLUMN public.tbl_candidato_detalle.id_posicion
    IS 'Llave foránea que hace referencia al campo id_posicion de la tabla cat_posicion.';

COMMENT ON COLUMN public.tbl_candidato_detalle.id_estatus_biometrico
    IS 'Llave foránea que hace referencia al campo id_estatus de la tabla cat_estatus.';

COMMENT ON COLUMN public.tbl_candidato_detalle.id_motorbio
    IS 'Llave foránea que hace referencia al campo id_motorbio de la tabla cat_motorbio.';

COMMENT ON COLUMN public.tbl_candidato_detalle.puntaje_motor
    IS 'Valor que indica el puntaje asignado por el motor biométrico.';

COMMENT ON COLUMN public.tbl_candidato_detalle.umbral_maximo
    IS 'El umbral superior define el nivel donde los puntajes mayores o iguales son "Hits absolutos". Las puntuaciones mayores o iguales a umbral_minimo y menores a ubral_maximo son "Area gris".';

COMMENT ON COLUMN public.tbl_candidato_detalle.umbral_minimo
    IS 'El umbral bajo define el nivel donde las puntuaciones más bajas son omitidas.';
---------------------------------------------Tabla 35 --------------------------------------------------------------------
-- Table: public.tbl_cvt

-- DROP TABLE public.tbl_cvt;

CREATE TABLE public.tbl_cvt
(
    id_cvt integer NOT NULL DEFAULT nextval('seq_cvt_id_cvt'::regclass),
    id_persona uuid NOT NULL,
    id_candidato_persona uuid NOT NULL,
    id_estatus integer NOT NULL,
    nombre_perito character varying(100) COLLATE pg_catalog."default",
    comentarios_generales character varying(1000) COLLATE pg_catalog."default",
    fecha_insercion timestamp without time zone NOT NULL,
    CONSTRAINT pk_cvt_id_cvt PRIMARY KEY (id_cvt)
        USING INDEX TABLESPACE tsp_digitus,
    CONSTRAINT fk_cvt_id_estatus FOREIGN KEY (id_estatus)
        REFERENCES public.cat_estatus (id_estatus) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_cvt_id_persona FOREIGN KEY (id_persona)
        REFERENCES public.tbl_persona (id_persona) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.tbl_cvt
    OWNER to usr_digitus;
---------------------------------------------Tabla 36 --------------------------------------------------------------------
-- Table: public.tbl_deduplicacion

-- DROP TABLE public.tbl_deduplicacion;

CREATE TABLE public.tbl_deduplicacion
(
    id_deduplicacion integer NOT NULL DEFAULT nextval('seq_deduplicacion_id_deduplicacion'::regclass),
    id_persona uuid NOT NULL,
    id_estatus_deduplicacion integer NOT NULL,
    fecha_inicio_ddp timestamp without time zone,
    id_recuperacion_biometrico integer,
    fecha_fin_ddp timestamp without time zone,
    id_estatus_cvt integer,
    CONSTRAINT pk_ddp_id_deduplicacion PRIMARY KEY (id_deduplicacion)
        USING INDEX TABLESPACE tsp_digitus,
    CONSTRAINT uk_deduplicacion_id_persona UNIQUE (id_persona)
        USING INDEX TABLESPACE tsp_digitus,
    CONSTRAINT fk_ddp_id_estatus_cvt FOREIGN KEY (id_estatus_cvt)
        REFERENCES public.cat_estatus_deduplicacion (id_estatus_deduplicacion) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_ddp_id_estatus_deduplicacion FOREIGN KEY (id_estatus_deduplicacion)
        REFERENCES public.cat_estatus_deduplicacion (id_estatus_deduplicacion) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_ddp_id_persona FOREIGN KEY (id_persona)
        REFERENCES public.tbl_persona (id_persona) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_ddp_id_recuperacion_biometrico FOREIGN KEY (id_recuperacion_biometrico)
        REFERENCES public.cat_recuperacion_biometrico (id_recuperacion_biometrico) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.tbl_deduplicacion
    OWNER to usr_digitus;

---------------------------------------------Tabla 37 --------------------------------------------------------------------
-- Table: public.tbl_deduplicacion_ejecucion

-- DROP TABLE public.tbl_deduplicacion_ejecucion;

CREATE TABLE public.tbl_deduplicacion_ejecucion
(
    id_deduplicacion_ejecucion integer NOT NULL DEFAULT nextval('seq_deduplicacion_ejecucion_id_deduplicacion_ejecucion'::regclass),
    nombre_contenedor character varying(30) COLLATE pg_catalog."default",
    id_deduplicacion_inicial integer,
    id_deduplicacion_final integer,
    hilos_activos integer,
    tamano_lote integer,
    estado_ejecucion character(1) COLLATE pg_catalog."default",
    tiempo_espera integer,
    CONSTRAINT pk_dedup_ejecucion_id_dedup_ejecucion PRIMARY KEY (id_deduplicacion_ejecucion)
        USING INDEX TABLESPACE tsp_digitus
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.tbl_deduplicacion_ejecucion
    OWNER to usr_digitus;
---------------------------------------------Tabla 38 --------------------------------------------------------------------
-- Table: public.tbl_deduplicacion_verificacion

-- DROP TABLE public.tbl_deduplicacion_verificacion;

CREATE TABLE public.tbl_deduplicacion_verificacion
(
    id_ddp_verificacion integer NOT NULL DEFAULT nextval('seq_ddp_verificacion_id_ddp_verificacion'::regclass),
    id_persona uuid NOT NULL,
    usuario character varying(10) COLLATE pg_catalog."default",
    fecha_asignacion timestamp without time zone,
    fecha_termino timestamp without time zone,
    id_estatus_verificacion integer NOT NULL,
    id_persona_comparacion uuid,
    comentarios character varying(1000) COLLATE pg_catalog."default",
    fecha_examinacion timestamp without time zone,
    tiempo_acumulado bigint DEFAULT 0,
    id_tipo_verificacion integer NOT NULL,
    CONSTRAINT pk_ddp_verificacion_id_ddp_verificacion PRIMARY KEY (id_ddp_verificacion)
        USING INDEX TABLESPACE tsp_digitus,
    CONSTRAINT fk_ddp_verificacion_id_estatus_verificacion FOREIGN KEY (id_estatus_verificacion)
        REFERENCES public.cat_estatus_deduplicacion (id_estatus_deduplicacion) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_ddp_verificacion_id_persona FOREIGN KEY (id_persona)
        REFERENCES public.tbl_persona (id_persona) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_ddp_verificacion_id_persona_comparacion FOREIGN KEY (id_persona_comparacion)
        REFERENCES public.tbl_persona (id_persona) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_ddp_verificacion_id_persona_ddp FOREIGN KEY (id_persona)
        REFERENCES public.tbl_deduplicacion (id_persona) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_ddp_verificacion_id_tipo_verificacion FOREIGN KEY (id_tipo_verificacion)
        REFERENCES public.cat_tipo_verificacion (id_tipo_verificacion) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.tbl_deduplicacion_verificacion
    OWNER to usr_digitus;
---------------------------------------------Tabla 39 --------------------------------------------------------------------
-- Table: public.tbl_ddp_verificacion_minucias

-- DROP TABLE public.tbl_ddp_verificacion_minucias;

CREATE TABLE public.tbl_ddp_verificacion_minucias
(
    id_ddp_verificacion_minucias integer NOT NULL DEFAULT nextval('seq_ddp_vrfcn_minucias_id_ddp_vrfcn_minucias'::regclass),
    id_ddp_verificacion integer NOT NULL,
    id_posicion integer NOT NULL,
    sujeto_minucia_nec json,
    sujeto_minucia_cvt json,
    candidato_minucia_nec json,
    candidato_minucia_cvt json,
    CONSTRAINT pk_ddp_vrfcn_minucias_id_ddp_vrfcn_minucias PRIMARY KEY (id_ddp_verificacion_minucias)
        USING INDEX TABLESPACE tsp_digitus,
    CONSTRAINT fk_ddp_ver_minucias_id_posicion FOREIGN KEY (id_posicion)
        REFERENCES public.cat_posicion (id_posicion) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_ddp_vrfcn_minucias_id_ddp_verificacion FOREIGN KEY (id_ddp_verificacion)
        REFERENCES public.tbl_deduplicacion_verificacion (id_ddp_verificacion) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.tbl_ddp_verificacion_minucias
    OWNER to usr_digitus;
---------------------------------------------Tabla 40 --------------------------------------------------------------------
-- Table: public.tbl_excepcion

-- DROP TABLE public.tbl_excepcion;

CREATE TABLE public.tbl_excepcion
(
    id_excepcion integer NOT NULL DEFAULT nextval('seq_excepcion_id_excepcion'::regclass),
    id_persona uuid NOT NULL,
    id_codigo_excepcion integer NOT NULL,
    fecha_excepcion timestamp with time zone DEFAULT timezone('America/Mexico_City'::text, now()),
    mensaje_excepcion character varying(5000) COLLATE pg_catalog."default",
    CONSTRAINT pk_excepcion_id_excepcion PRIMARY KEY (id_excepcion)
        USING INDEX TABLESPACE tsp_digitus,
    CONSTRAINT fk_excepcion_id_codigo_excepcion FOREIGN KEY (id_codigo_excepcion)
        REFERENCES public.cat_codigo_excepcion (id_codigo_excepcion) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_excepcion_id_persona FOREIGN KEY (id_persona)
        REFERENCES public.tbl_persona (id_persona) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.tbl_excepcion
    OWNER to usr_digitus;

COMMENT ON COLUMN public.tbl_excepcion.id_excepcion
    IS 'Llave primaria de la tabla. Es un campo autoincremental.';

COMMENT ON COLUMN public.tbl_excepcion.id_persona
    IS 'Llave foránea que identifica a la persona y a la transacción, proviene de la tabla tbl_persona.';

COMMENT ON COLUMN public.tbl_excepcion.id_codigo_excepcion
    IS 'Llave foránea que hace referencia al campo id_codigo_excepcion de la tabla cat_codigo_excepcion.';

COMMENT ON COLUMN public.tbl_excepcion.fecha_excepcion
    IS 'Fecha en la que se presenta la excepción.';

COMMENT ON COLUMN public.tbl_excepcion.mensaje_excepcion
    IS ' ';

---------------------------------------------Tabla 41 --------------------------------------------------------------------
-- Table: public.tbl_permiso

-- DROP TABLE public.tbl_permiso;

CREATE TABLE public.tbl_permiso
(
    id_permiso integer NOT NULL DEFAULT nextval('seq_permiso_id_permiso'::regclass),
    id_secretaria integer NOT NULL,
    id_secretaria_ver integer NOT NULL,
    permiso boolean NOT NULL,
    fecha_permiso timestamp with time zone,
    usuario character varying(20) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_permiso_id_permiso PRIMARY KEY (id_permiso)
        USING INDEX TABLESPACE tsp_digitus,
    CONSTRAINT fk_permiso_id_secretaria FOREIGN KEY (id_secretaria)
        REFERENCES public.cat_secretaria (id_secretaria) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_permiso_id_secretaria_ver FOREIGN KEY (id_secretaria_ver)
        REFERENCES public.cat_entidad (id_entidad) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.tbl_permiso
    OWNER to usr_digitus;
COMMENT ON TABLE public.tbl_permiso
    IS 'Tabla que tiene por objeto guardar, la configuracion de permisos de una secretaria a otros secretarias ';

COMMENT ON COLUMN public.tbl_permiso.id_permiso
    IS 'Llave primaria de la tabla. Es un campo autoincremental.';
---------------------------------------------Tabla 42 --------------------------------------------------------------------
-- Table: public.tbl_persona_biografico

-- DROP TABLE public.tbl_persona_biografico;

CREATE TABLE public.tbl_persona_biografico
(
    id_persona_biografico integer NOT NULL DEFAULT nextval('seq_persona_biografico_id_persona_biografico'::regclass),
    id_persona uuid NOT NULL,
    id_atributo integer NOT NULL,
    valor character varying(4000) COLLATE pg_catalog."default",
    CONSTRAINT pk_persona_biografico_id_persona PRIMARY KEY (id_persona_biografico)
        USING INDEX TABLESPACE tsp_digitus,
    CONSTRAINT fk_persona_biografico_id_atributo FOREIGN KEY (id_atributo)
        REFERENCES public.cat_atributo (id_atributo) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_persona_biografico_id_persona FOREIGN KEY (id_persona)
        REFERENCES public.tbl_persona (id_persona) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.tbl_persona_biografico
    OWNER to usr_digitus;
COMMENT ON TABLE public.tbl_persona_biografico
    IS 'Tabla que registra los datos biográficos de una persona.';

COMMENT ON COLUMN public.tbl_persona_biografico.id_persona_biografico
    IS 'Llave primaria de la tabla. Es un campo autoincremental.';

COMMENT ON COLUMN public.tbl_persona_biografico.id_persona
    IS 'Llave foránea que identifica la transacción, proviene de la tabla tbl_persona.';

COMMENT ON COLUMN public.tbl_persona_biografico.id_atributo
    IS 'Llave foránea que hace referencia al campo id_caracteristica de la tabla cat_caracteristica.';

COMMENT ON COLUMN public.tbl_persona_biografico.valor
    IS 'Información que corresponde a la característica de la persona.';
---------------------------------------------Tabla 43 --------------------------------------------------------------------
-- Table: public.tbl_persona_extraccion_h

-- DROP TABLE public.tbl_persona_extraccion_h;

CREATE TABLE public.tbl_persona_extraccion_h
(
    id_persona_extraccion_h integer NOT NULL DEFAULT nextval('seq_persona_extraccion_h_id_persona_extraccion_h'::regclass),
    id_persona uuid NOT NULL,
    id_posicion integer NOT NULL,
    id_motorbio integer NOT NULL,
    puntaje_motor numeric(6,2),
    CONSTRAINT pk_persona_extraccion_h_id_persona_extraccion_h PRIMARY KEY (id_persona_extraccion_h)
        USING INDEX TABLESPACE tsp_digitus,
    CONSTRAINT fk_persona_extraccion_h_id_motorbio FOREIGN KEY (id_motorbio)
        REFERENCES public.cat_motorbio (id_motorbio) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_persona_extraccion_h_id_persona FOREIGN KEY (id_persona)
        REFERENCES public.tbl_persona (id_persona) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_persona_extraccion_h_id_posicion FOREIGN KEY (id_posicion)
        REFERENCES public.cat_posicion (id_posicion) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.tbl_persona_extraccion_h
    OWNER to usr_digitus;
COMMENT ON TABLE public.tbl_persona_extraccion_h
    IS 'Tabla que registra los los valores obtenidos de la extracción de calidad de huellas dactilares del motor biométrico.';

COMMENT ON COLUMN public.tbl_persona_extraccion_h.id_persona_extraccion_h
    IS 'Llave foránea que identifica la transacción, proviene de la tabla tbl_transaccion.';

COMMENT ON COLUMN public.tbl_persona_extraccion_h.id_persona
    IS 'Llave foránea que identifica la transacción, proviene de la tabla tbl_transaccion.';

COMMENT ON COLUMN public.tbl_persona_extraccion_h.id_posicion
    IS 'Llave foránea que hace referencia al campo id_posicion de la tabla cat_posicion.';

COMMENT ON COLUMN public.tbl_persona_extraccion_h.id_motorbio
    IS 'Llave foránea que hace referencia al campo id_motorbio de la tabla cat_motorbio.';

COMMENT ON COLUMN public.tbl_persona_extraccion_h.puntaje_motor
    IS 'Valor que indica el puntaje asignado por el motor biométrico.';
---------------------------------------------Tabla 44 --------------------------------------------------------------------
-- Table: public.tbl_persona_extraccion_i

-- DROP TABLE public.tbl_persona_extraccion_i;

CREATE TABLE public.tbl_persona_extraccion_i
(
    id_persona_extraccion_i integer NOT NULL DEFAULT nextval('seq_persona_extraccion_i_id_persona_extraccion_i'::regclass),
    id_persona uuid NOT NULL,
    id_biometrico integer NOT NULL,
    id_posicion integer NOT NULL,
    id_motorbio integer NOT NULL,
    puntaje_motor numeric(6,2),
    fecha timestamp with time zone DEFAULT timezone('America/Mexico_City'::text, now()),
    CONSTRAINT pk_persona_extraccion_i_id_persona_extraccion_i PRIMARY KEY (id_persona_extraccion_i)
        USING INDEX TABLESPACE tsp_digitus,
    CONSTRAINT fk_persona_extraccion_i_id_biometrico FOREIGN KEY (id_biometrico)
        REFERENCES public.cat_biometrico (id_biometrico) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_persona_extraccion_i_id_motorbio FOREIGN KEY (id_motorbio)
        REFERENCES public.cat_motorbio (id_motorbio) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_persona_extraccion_i_id_persona FOREIGN KEY (id_persona)
        REFERENCES public.tbl_persona (id_persona) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_persona_extraccion_i_id_posicion FOREIGN KEY (id_posicion)
        REFERENCES public.cat_posicion (id_posicion) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.tbl_persona_extraccion_i
    OWNER to usr_digitus;
COMMENT ON TABLE public.tbl_persona_extraccion_i
    IS 'Tabla que registra los los valores obtenidos de la extracción de calidad de huellas dactilares del motor biométrico.';

COMMENT ON COLUMN public.tbl_persona_extraccion_i.id_persona_extraccion_i
    IS 'Llave foránea que identifica la transacción, proviene de la tabla tbl_transaccion.';

COMMENT ON COLUMN public.tbl_persona_extraccion_i.id_persona
    IS 'Llave foránea que identifica la transacción, proviene de la tabla tbl_transaccion.';

COMMENT ON COLUMN public.tbl_persona_extraccion_i.id_biometrico
    IS 'Llave foránea que hace referencia al campo id_biometrico de la tabla cat_biometrico.';

COMMENT ON COLUMN public.tbl_persona_extraccion_i.id_posicion
    IS 'Llave foránea que hace referencia al campo id_posicion de la tabla cat_posicion.';

COMMENT ON COLUMN public.tbl_persona_extraccion_i.id_motorbio
    IS 'Llave foránea que hace referencia al campo id_motorbio de la tabla cat_motorbio.';

COMMENT ON COLUMN public.tbl_persona_extraccion_i.puntaje_motor
    IS 'Valor que indica el puntaje asignado por el motor biométrico.';

COMMENT ON COLUMN public.tbl_persona_extraccion_i.fecha
    IS 'Fecha en la que el registro es insertado en la tabla.';
---------------------------------------------Tabla 45 --------------------------------------------------------------------
-- Table: public.tbl_persona_extraccion_r

-- DROP TABLE public.tbl_persona_extraccion_r;

CREATE TABLE public.tbl_persona_extraccion_r
(
    id_persona_extraccion_r integer NOT NULL DEFAULT nextval('seq_persona_extraccion_r_id_persona_extraccion_r'::regclass),
    id_persona uuid NOT NULL,
    id_biometrico integer NOT NULL,
    id_posicion integer NOT NULL,
    id_motorbio integer NOT NULL,
    puntaje_calidad numeric(6,2),
    puntaje_similitud numeric(6,2),
    fecha timestamp with time zone DEFAULT timezone('America/Mexico_City'::text, now()),
    CONSTRAINT pk_persona_extraccion_r_id_persona_extraccion_r PRIMARY KEY (id_persona_extraccion_r)
        USING INDEX TABLESPACE tsp_digitus,
    CONSTRAINT fk_persona_extraccion_r_id_biometrico FOREIGN KEY (id_biometrico)
        REFERENCES public.cat_biometrico (id_biometrico) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_persona_extraccion_r_id_motorbio FOREIGN KEY (id_motorbio)
        REFERENCES public.cat_motorbio (id_motorbio) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_persona_extraccion_r_id_persona FOREIGN KEY (id_persona)
        REFERENCES public.tbl_persona (id_persona) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_persona_extraccion_r_id_posicion FOREIGN KEY (id_posicion)
        REFERENCES public.cat_posicion (id_posicion) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.tbl_persona_extraccion_r
    OWNER to usr_digitus;
COMMENT ON TABLE public.tbl_persona_extraccion_r
    IS 'Tabla que registra los los valores obtenidos de la extracción de calidad de huellas dactilares del motor biométrico.';

COMMENT ON COLUMN public.tbl_persona_extraccion_r.id_persona_extraccion_r
    IS 'Llave foránea que identifica la transacción, proviene de la tabla tbl_transaccion.';

COMMENT ON COLUMN public.tbl_persona_extraccion_r.id_persona
    IS 'Llave foránea que identifica la transacción, proviene de la tabla tbl_transaccion.';

COMMENT ON COLUMN public.tbl_persona_extraccion_r.id_biometrico
    IS 'Llave foránea que hace referencia al campo id_biometrico de la tabla cat_biometrico.';

COMMENT ON COLUMN public.tbl_persona_extraccion_r.id_posicion
    IS 'Llave foránea que hace referencia al campo id_posicion de la tabla cat_posicion.';

COMMENT ON COLUMN public.tbl_persona_extraccion_r.id_motorbio
    IS 'Llave foránea que hace referencia al campo id_motorbio de la tabla cat_motorbio.';

COMMENT ON COLUMN public.tbl_persona_extraccion_r.puntaje_calidad
    IS 'Valor que indica el puntaje de calidad asignado por el motor biométrico.';

COMMENT ON COLUMN public.tbl_persona_extraccion_r.puntaje_similitud
    IS 'Valor que indica el puntaje de similitud asignado por el motor biométrico.';

COMMENT ON COLUMN public.tbl_persona_extraccion_r.fecha
    IS 'Fecha en la que el registro es insertado en la tabla.';
---------------------------------------------Tabla 46 --------------------------------------------------------------------
-- Table: public.tbl_persona_identidad

-- DROP TABLE public.tbl_persona_identidad;

CREATE TABLE public.tbl_persona_identidad
(
    id_persona uuid NOT NULL,
    id_registro_biometrico uuid NOT NULL,
    CONSTRAINT pk_persona_identidad_id_identidad PRIMARY KEY (id_persona)
        USING INDEX TABLESPACE tsp_digitus,
    CONSTRAINT fk_persona_id_persona FOREIGN KEY (id_persona)
        REFERENCES public.tbl_persona (id_persona) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.tbl_persona_identidad
    OWNER to usr_digitus;
COMMENT ON TABLE public.tbl_persona_identidad
    IS 'Tabla que contiene la lista de identidades biométricas únicas.';

COMMENT ON COLUMN public.tbl_persona_identidad.id_persona
    IS 'Llave foránea que identifica la transacción, proviene de la tabla tbl_persona.';

COMMENT ON COLUMN public.tbl_persona_identidad.id_registro_biometrico
    IS 'Identificador que contiene la identidad biométrica única.';
---------------------------------------------Tabla 47 --------------------------------------------------------------------
-- Table: public.tbl_persona_motor

-- DROP TABLE public.tbl_persona_motor;

CREATE TABLE public.tbl_persona_motor
(
    id_persona_motor integer NOT NULL DEFAULT nextval('seq_persona_motor_id_persona_motor'::regclass),
    id_persona uuid NOT NULL,
    id_persona_galeria uuid,
    id_motorbio integer NOT NULL,
    id_biometrico integer NOT NULL,
    galeria character varying(25) COLLATE pg_catalog."default",
    fecha_enrolamiento timestamp with time zone DEFAULT timezone('America/Mexico_City'::text, now()),
    fecha_borrado timestamp with time zone DEFAULT timezone('America/Mexico_City'::text, now()),
    CONSTRAINT pk_persona_motor_id_persona_motor PRIMARY KEY (id_persona_motor)
        USING INDEX TABLESPACE tsp_digitus,
    CONSTRAINT fk_persona_motor_id_biometrico FOREIGN KEY (id_biometrico)
        REFERENCES public.cat_biometrico (id_biometrico) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_persona_motor_id_motorbio FOREIGN KEY (id_motorbio)
        REFERENCES public.cat_motorbio (id_motorbio) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_persona_motor_id_persona FOREIGN KEY (id_persona)
        REFERENCES public.tbl_persona (id_persona) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.tbl_persona_motor
    OWNER to usr_digitus;
COMMENT ON TABLE public.tbl_persona_motor
    IS 'Tabla que almacena el detalle de la galería en que es enrolada la persona.';

COMMENT ON COLUMN public.tbl_persona_motor.id_persona_motor
    IS 'Llave primaria de la tabla. Es un campo autoincremental.';

COMMENT ON COLUMN public.tbl_persona_motor.id_persona
    IS 'Llave foránea que identifica la transacción, proviene de la tabla tbl_persona.';

COMMENT ON COLUMN public.tbl_persona_motor.id_persona_galeria
    IS 'Identificador dentro de las galerías de los motores biométricos.';

COMMENT ON COLUMN public.tbl_persona_motor.id_motorbio
    IS 'Llave foránea que hace referencia al campo id_motorbio de la tabla cat_motorbio.';

COMMENT ON COLUMN public.tbl_persona_motor.id_biometrico
    IS 'Llave foránea que hace referencia al campo id_biometrico de la tabla cat_biometrico.';

COMMENT ON COLUMN public.tbl_persona_motor.galeria
    IS 'Nombre o tipo de la galería de un motor biométrico.';

---------------------------------------------Tabla 48 --------------------------------------------------------------------
-- Table: public.tbl_peticion

-- DROP TABLE public.tbl_peticion;

CREATE TABLE public.tbl_peticion
(
    id_peticion integer NOT NULL DEFAULT nextval('seq_peticion_id_peticion'::regclass),
    id_asociado integer NOT NULL,
    id_tipo_respuesta integer NOT NULL,
    id_operaciontipo integer NOT NULL,
    id_estatus integer NOT NULL,
    fecha_peticion timestamp with time zone DEFAULT timezone('America/Mexico_City'::text, now()),
    codigo_referencia character varying(50) COLLATE pg_catalog."default",
    responder_a character varying(250) COLLATE pg_catalog."default",
    CONSTRAINT pk_peticion_id_peticion PRIMARY KEY (id_peticion)
        USING INDEX TABLESPACE tsp_digitus,
    CONSTRAINT fk_peticion_id_asociado FOREIGN KEY (id_asociado)
        REFERENCES public.tbl_asociado (id_asociado) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_peticion_id_estatus FOREIGN KEY (id_estatus)
        REFERENCES public.cat_estatus (id_estatus) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_peticion_id_operaciontipo FOREIGN KEY (id_operaciontipo)
        REFERENCES public.cat_operaciontipo (id_operaciontipo) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_peticion_id_tipo_respuesta FOREIGN KEY (id_tipo_respuesta)
        REFERENCES public.cat_tipo_respuesta (id_tipo_respuesta) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.tbl_peticion
    OWNER to usr_digitus;
---------------------------------------------Tabla 49 --------------------------------------------------------------------
-- Table: public.tbl_persona_peticion

-- DROP TABLE public.tbl_persona_peticion;

CREATE TABLE public.tbl_persona_peticion
(
    id_persona_peticion integer NOT NULL DEFAULT nextval('seq_persona_peticion_id_persona_peticion'::regclass),
    id_persona uuid NOT NULL,
    id_peticion integer NOT NULL,
    CONSTRAINT pk_persona_peticion_id_persona_peticion PRIMARY KEY (id_persona_peticion)
        USING INDEX TABLESPACE tsp_digitus,
    CONSTRAINT fk_persona_peticion_id_persona FOREIGN KEY (id_persona)
        REFERENCES public.tbl_persona (id_persona) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_persona_peticion_id_peticion FOREIGN KEY (id_peticion)
        REFERENCES public.tbl_peticion (id_peticion) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.tbl_persona_peticion
    OWNER to usr_digitus;
---------------------------------------------Tabla 50 --------------------------------------------------------------------
-- Table: public.tbl_registro_evento

-- DROP TABLE public.tbl_registro_evento;

CREATE TABLE public.tbl_registro_evento
(
    id_registro_evento integer NOT NULL DEFAULT nextval('seq_registro_evento_id_registro_evento'::regclass),
    id_persona uuid NOT NULL,
    id_evento integer NOT NULL,
    valor character varying COLLATE pg_catalog."default",
    fecha_evento timestamp with time zone,
    CONSTRAINT pk_registro_evento_id_registro_evento PRIMARY KEY (id_registro_evento)
        USING INDEX TABLESPACE tsp_digitus,
    CONSTRAINT fk_registro_evento_id_evento FOREIGN KEY (id_evento)
        REFERENCES public.cat_evento (id_evento) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_registro_evento_id_persona FOREIGN KEY (id_persona)
        REFERENCES public.tbl_persona (id_persona) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.tbl_registro_evento
    OWNER to usr_digitus;

COMMENT ON COLUMN public.tbl_registro_evento.id_registro_evento
    IS 'Llave primaria de la tabla. Es un campo autoincremental.';


---------------------------------------------Tabla 51 --------------------------------------------------------------------
-- Table: public.tbl_respuesta

-- DROP TABLE public.tbl_respuesta;

CREATE TABLE public.tbl_respuesta
(
    id_respuesta integer NOT NULL DEFAULT nextval('seq_respuesta_id_respuesta'::regclass),
    id_transaccion_externa character(30) COLLATE pg_catalog."default",
    fecha_respuesta timestamp with time zone,
    id_estatus integer NOT NULL,
	id_fusion uuid,
    id_peticion integer NOT NULL,
    CONSTRAINT pk_respuesta_id_respuesta PRIMARY KEY (id_respuesta)
        USING INDEX TABLESPACE tsp_digitus,
    CONSTRAINT unq_respuesta_id_peticion UNIQUE (id_peticion)
        USING INDEX TABLESPACE tsp_digitus,
    CONSTRAINT fk_respuesta_id_estatus FOREIGN KEY (id_estatus)
        REFERENCES public.cat_estatus (id_estatus) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_respuesta_id_peticion FOREIGN KEY (id_peticion)
        REFERENCES public.tbl_peticion (id_peticion) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.tbl_respuesta
    OWNER to usr_digitus;
COMMENT ON TABLE public.tbl_respuesta
    IS 'Tabla que contiene la informacion de la respuesta de una busqueda externa que entran al sistema de identificación biométrica.';
---------------------------------------------Tabla 52 --------------------------------------------------------------------
-- Table: public.tbl_umbral_conf_his

-- DROP TABLE public.tbl_umbral_conf_his;

CREATE TABLE public.tbl_umbral_conf_his
(
    id_umbral_conf_his integer NOT NULL DEFAULT nextval('seq_umbral_conf_his_id_umbral_conf_his'::regclass),
    id_umbral_conf integer NOT NULL,
    id_motorbio integer NOT NULL,
    id_organizacion integer NOT NULL,
    id_biometrico integer NOT NULL,
    umbral_minimo integer,
    umbral_maximo integer,
    operacion character(1) COLLATE pg_catalog."default",
    fecha_modificacion timestamp with time zone DEFAULT timezone('America/Mexico_City'::text, now()),
    usuario character varying(20) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_umbral_conf_his_id_umbral_conf_his PRIMARY KEY (id_umbral_conf_his)
        USING INDEX TABLESPACE tsp_digitus,
    CONSTRAINT fk_umbral_conf_his_id_umbral_conf FOREIGN KEY (id_umbral_conf)
        REFERENCES public.cat_umbral_conf (id_umbral_conf) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.tbl_umbral_conf_his
    OWNER to usr_digitus;
COMMENT ON TABLE public.tbl_umbral_conf_his
    IS 'Tabla que guarda un histórico de todos los movimientos de la tabla cat_umbral_conf';

COMMENT ON COLUMN public.tbl_umbral_conf_his.id_umbral_conf_his
    IS 'Llave primaria de la tabla. Es un campo autoincremental.';

COMMENT ON COLUMN public.tbl_umbral_conf_his.id_umbral_conf
    IS 'Llave foránea que hace referencia al campo id_umbral_conf de la tabla cat_umbral_conf.';

COMMENT ON COLUMN public.tbl_umbral_conf_his.id_motorbio
    IS 'Llave foránea que hace referencia al campo id_motorbio de la tabla cat_motorbio.';

COMMENT ON COLUMN public.tbl_umbral_conf_his.id_organizacion
    IS 'Llave foránea que hace referencia al campo id_organizacion de la tabla cat_organizacion.';

COMMENT ON COLUMN public.tbl_umbral_conf_his.id_biometrico
    IS 'Llave foránea que hace referencia al campo id_biometrico de la tabla cat_biometrico.';

COMMENT ON COLUMN public.tbl_umbral_conf_his.umbral_minimo
    IS 'Valor mínimo para determinar que un candidato hizo hit.';

COMMENT ON COLUMN public.tbl_umbral_conf_his.umbral_maximo
    IS 'Valor máximo para determinar que un candidato hizo hit absoluto.';

COMMENT ON COLUMN public.tbl_umbral_conf_his.operacion
    IS 'Tipo de operación que se realizó en la tabla cat_umbral. (A) Actualización, (B) Baja, (C) Cambio.';

COMMENT ON COLUMN public.tbl_umbral_conf_his.fecha_modificacion
    IS 'Fecha en la cual se establecen los valores de configuración para el esquema biométrico.';

COMMENT ON COLUMN public.tbl_umbral_conf_his.usuario
    IS 'Nombre del usuario que establece los valores de configuración para el esquema biométrico.';

---------------------------------------------Tabla 52 --------------------------------------------------------------------
CREATE TABLE public.tbl_persona_extraccion_p
(
    id_persona_extraccion_p integer NOT NULL DEFAULT nextval('seq_persona_extraccion_p_id_persona_extraccion_p'),
    id_persona 				uuid 	NOT NULL,
    id_posicion 			integer NOT NULL,
    id_motorbio 			integer NOT NULL,
    puntaje_motor 			numeric(6,2),
    CONSTRAINT pk_persona_extraccion_p_id_persona_extraccion_p	PRIMARY KEY (id_persona_extraccion_p)
        USING INDEX TABLESPACE tsp_digitus,
    CONSTRAINT fk_persona_extraccion_p_id_motorbio 				FOREIGN KEY (id_motorbio)
        REFERENCES public.cat_motorbio (id_motorbio),
    CONSTRAINT fk_persona_extraccion_p_id_persona 				FOREIGN KEY (id_persona)
        REFERENCES public.tbl_persona (id_persona),
    CONSTRAINT fk_persona_extraccion_p_id_posicion 				FOREIGN KEY (id_posicion)
        REFERENCES public.cat_posicion (id_posicion)
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.tbl_persona_extraccion_p
    OWNER to usr_digitus;

COMMENT ON TABLE public.tbl_persona_extraccion_p
    IS 'Tabla que registra los los valores obtenidos de la extracción de calidad de palmas del motor biométrico.';

COMMENT ON COLUMN public.tbl_persona_extraccion_p.id_persona_extraccion_p
    IS 'Llave primaria de la tabla es un campo auntoincremental.';

COMMENT ON COLUMN public.tbl_persona_extraccion_p.id_persona
    IS 'Llave foránea que identifica la transacción, proviene de la tabla tbl_persona.';

COMMENT ON COLUMN public.tbl_persona_extraccion_p.id_posicion
    IS 'Llave foránea que hace referencia al campo id_posicion de la tabla cat_posicion.';

COMMENT ON COLUMN public.tbl_persona_extraccion_p.id_motorbio
    IS 'Llave foránea que hace referencia al campo id_motorbio de la tabla cat_motorbio.';

COMMENT ON COLUMN public.tbl_persona_extraccion_p.puntaje_motor
    IS 'Valor que indica el puntaje asignado por el motor biométrico.';
	---------------------------------------------Tabla 52 --------------------------------------------------------------------
-- Table: public.tbl_persona_extraccion_l
CREATE TABLE public.tbl_persona_extraccion_l
(
    id_persona_extraccion_l integer NOT NULL DEFAULT nextval('seq_persona_extraccion_l_id_persona_extraccion_l'),
    id_persona 				uuid 	NOT NULL,
    id_posicion 			integer NOT NULL,
    id_motorbio 			integer NOT NULL,
    puntaje_motor 			numeric(6,2),
    CONSTRAINT pk_persona_extraccion_l_id_persona_extraccion_l	PRIMARY KEY (id_persona_extraccion_l)
        USING INDEX TABLESPACE tsp_digitus,
    CONSTRAINT fk_persona_extraccion_l_id_motorbio 				FOREIGN KEY (id_motorbio)
        REFERENCES public.cat_motorbio (id_motorbio),
    CONSTRAINT fk_persona_extraccion_l_id_persona 				FOREIGN KEY (id_persona)
        REFERENCES public.tbl_persona (id_persona),
    CONSTRAINT fk_persona_extraccion_l_id_posicion 				FOREIGN KEY (id_posicion)
        REFERENCES public.cat_posicion (id_posicion)
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_digitus;

ALTER TABLE public.tbl_persona_extraccion_l
    OWNER to usr_digitus;

COMMENT ON TABLE public.tbl_persona_extraccion_l
    IS 'Tabla que registra los los valores obtenidos de la extracción de calidad de latentes del motor biométrico.';

COMMENT ON COLUMN public.tbl_persona_extraccion_l.id_persona_extraccion_l
    IS 'Llave primaria de la tabla es un campo auntoincremental.';

COMMENT ON COLUMN public.tbl_persona_extraccion_l.id_persona
    IS 'Llave foránea que identifica la transacción, proviene de la tabla tbl_persona.';

COMMENT ON COLUMN public.tbl_persona_extraccion_l.id_posicion
    IS 'Llave foránea que hace referencia al campo id_posicion de la tabla cat_posicion.';

COMMENT ON COLUMN public.tbl_persona_extraccion_l.id_motorbio
    IS 'Llave foránea que hace referencia al campo id_motorbio de la tabla cat_motorbio.';

COMMENT ON COLUMN public.tbl_persona_extraccion_l.puntaje_motor
    IS 'Valor que indica el puntaje asignado por el motor biométrico.';
