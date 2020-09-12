\c db_fusion;

--SCRIPTS PARA LA CREACI�N DE TABLAS EN LA BASE DE DATOS db_fusion CON LOS ESTANDARES APLICADOS
--///////////////////////////////////////////////////////////////////////////////////////
---------------------------------------------- Script 01 -------------------------------------------------------------
DROP TABLE IF EXISTS public.cat_estatus;
CREATE TABLE public.cat_estatus
(
    id_estatus  integer     NOT NULL default nextval ('seq_estatus_id_estatus'),
    descripcion varchar(25) NOT NULL,
    CONSTRAINT pk_estatus_id_estatus PRIMARY KEY (id_estatus)
)
WITH
(
    OIDS = FALSE
)

TABLESPACE tsp_fusion;

ALTER TABLE public.cat_estatus
    OWNER to usr_fusion;

COMMENT ON TABLE public.cat_estatus
    IS 'Tabla que contiene el cat�logo de los diferentes eventos que puede tener una transacci�n durante todo el flujo del sistema.';
COMMENT ON COLUMN public.cat_estatus.id_estatus
    IS 'Llave primaria de la tabla. Es un campo autoincremental.';
COMMENT ON COLUMN public.cat_estatus.descripcion
    IS 'Valor descriptivo correspondiente al estatus de una transacci�n.';


---------------------------------------------- Script 02 -------------------------------------------------------------
DROP TABLE IF EXISTS public.cat_organizacion;
CREATE TABLE public.cat_organizacion
(
    id_organizacion integer        NOT NULL default nextval ('seq_organizacion_id_organizacion'),
    organizacion    varchar(150)   NOT NULL,
	unidad          varchar(50),
	subunidad       varchar(50),
    CONSTRAINT pk_organizacion_id_organizacion PRIMARY KEY (id_organizacion)
)
WITH
(
    OIDS = FALSE
)
TABLESPACE tsp_fusion;

ALTER TABLE public.cat_organizacion
    OWNER to usr_fusion;

COMMENT ON TABLE public.cat_organizacion
   IS 'Tabla que contiene el cat�logo de las diferentes organizaciones que una secretar�a puede tener y que participan en el proyecto de identificaci�n biom�trica.';
COMMENT ON COLUMN public.cat_organizacion.id_organizacion
   IS 'Llave primaria de la tabla. Es un campo autoincremental.';
COMMENT ON COLUMN public.cat_organizacion.organizacion
   IS 'Valor correspondiente al nombre de la organizaci�n.';
COMMENT ON COLUMN public.cat_organizacion.unidad
   IS 'Valor correspondiente al nombre de la unidad a la que pertenece la organizaci�n.';
COMMENT ON COLUMN public.cat_organizacion.subunidad
   IS 'Valor correspondiente al nombre de la subunidad a la que pertenece la organizaci�n.';

---------------------------------------------- Script 03 -------------------------------------------------------------
DROP TABLE IF EXISTS public.cat_posicion;
CREATE TABLE public.cat_posicion
(
    id_posicion  	integer     NOT NULL default nextval ('seq_posicion_id_posicion'),
	posicion     	integer 	NOT NULL,
	descripcion_esp varchar(30)	NOT NULL,
	descripcion_ing varchar(30)	NOT NULL,
	 CONSTRAINT pk_posicion_id_posicion  PRIMARY KEY (id_posicion)
)
WITH
(
    OIDS = FALSE
)
TABLESPACE tsp_fusion;

ALTER TABLE public.cat_posicion
    OWNER to usr_fusion;

COMMENT ON TABLE public.cat_posicion
   IS 'Tabla que contiene el cat�logo de la lista de posiciones por cada uno de los biom�tricos; (huellas, Iris y rostro) con base al est�ndar ANSI NIST ITL-2011.';
COMMENT ON COLUMN public.cat_posicion.id_posicion
   IS 'Llave primaria de la tabla. Es un campo autoincremental.';
COMMENT ON COLUMN public.cat_posicion.posicion
   IS 'Clave �nica de la posici�n biom�trica.';
COMMENT ON COLUMN public.cat_posicion.descripcion_esp
   IS 'Valor descriptivo de la posici�n del biom�trico en espa�ol.';
COMMENT ON COLUMN public.cat_posicion.descripcion_ing
   IS 'Valor descriptivo de la posici�n del biom�trico en ingl�s.';

---------------------------------------------- Script 04 -------------------------------------------------------------
DROP TABLE IF EXISTS public.cat_biometrico;
CREATE TABLE public.cat_biometrico
(
	id_biometrico   integer      NOT NULL default nextval ('seq_biometrico_id_biometrico'),
	tipo_biometrico varchar(10)  NOT NULL,
	CONSTRAINT pk_biometrico_id_biometrico PRIMARY KEY (id_biometrico)
)
WITH
(
    OIDS = FALSE
)
TABLESPACE tsp_fusion;

ALTER TABLE public.cat_biometrico
    OWNER to usr_fusion;

COMMENT ON TABLE public.cat_biometrico
   IS 'Tabla que contiene el cat�logo de las diferentes modalidades utilizadas en el sistema biom�trico.';
COMMENT ON COLUMN public.cat_biometrico.id_biometrico
   IS 'Llave primaria de la tabla. Es un campo autoincremental.';
COMMENT ON COLUMN public.cat_biometrico.tipo_biometrico
   IS 'Nombre del tipo de biom�trico (modalidad).';

---------------------------------------------- Script 05 -------------------------------------------------------------
DROP TABLE IF EXISTS public.cat_algoritmo;
CREATE TABLE public.cat_algoritmo
(
    id_algoritmo 		integer 			NOT NULL default nextval('seq_algoritmo_id_algoritmo'),
    version_algoritmo 	varchar (50),
    formula 			varchar (500),
    fecha_inicio 		timestamp with time zone DEFAULT timezone('America/Mexico_City'::text, now()),
    fecha_fin 			timestamp with time zone DEFAULT timezone('America/Mexico_City'::text, now()),
    CONSTRAINT pk_cat_algoritmo_id_algoritmo PRIMARY KEY (id_algoritmo)
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_fusion;

ALTER TABLE public.cat_algoritmo
    OWNER to usr_fusion;

COMMENT ON TABLE public.cat_algoritmo
    IS 'Tabla que contiene la lista de algoritmos de Fusi�n aplicados a cada una de las transacciones.';
COMMENT ON COLUMN public.cat_algoritmo.id_algoritmo
    IS 'Llave primaria de la tabla. Es un campo autoincremental.';
COMMENT ON COLUMN public.cat_algoritmo.version_algoritmo
    IS 'Nombre del algoritmo aplicado a la transacci�n.';
COMMENT ON COLUMN public.cat_algoritmo.formula
    IS 'Valor de la f�rmula del algoritmo de Fusi�n aplicado.';
COMMENT ON COLUMN public.cat_algoritmo.fecha_inicio
    IS 'Fecha en la que entra en operaci�n la formula.';
COMMENT ON COLUMN public.cat_algoritmo.fecha_fin
    IS 'Fecha en la termina la formula.';

---------------------------------------------- Script 06 -------------------------------------------------------------
DROP TABLE IF EXISTS public.tbl_candidato;
CREATE TABLE public.tbl_candidato
(
    id_candidato    		integer  		NOT NULL default nextval ('seq_candidato_id_candidato'),
	id_transaccion 			uuid     		NOT NULL,
	id_persona				uuid	 		NOT NULL,
	id_estatus_candidato	integer  		NOT NULL,
	id_candidato_persona	uuid,
	puntaje_fusion  		decimal(4,2),
	id_algoritmo			integer			NOT NULL,
	id_fusion				uuid,
	CONSTRAINT pk_candidato_id_candidato  			PRIMARY KEY (id_candidato),
	CONSTRAINT fk_candidato_id_estatus_candidato	FOREIGN KEY (id_estatus_candidato)
	  REFERENCES public.cat_estatus (id_estatus),
	CONSTRAINT fk_candidato_id_algoritmo			FOREIGN KEY (id_algoritmo)
	  REFERENCES public.cat_algoritmo (id_algoritmo)
)
WITH
(
    OIDS = FALSE
)
TABLESPACE tsp_fusion;

ALTER TABLE public.tbl_candidato
    OWNER to usr_fusion;

COMMENT ON TABLE public.tbl_candidato
   IS 'Tabla que registra la lista de coincidencias que regresa el proceso de Fusi�n respecto a una b�squeda biom�trica.';
COMMENT ON COLUMN public.tbl_candidato.id_candidato
   IS 'Llave primaria de la tabla. Es un campo autoincremental.';
COMMENT ON COLUMN public.tbl_candidato.id_transaccion
   IS 'Llave for�nea que identifica la transacci�n, proviene de la tabla tbl_transaccion.';
COMMENT ON COLUMN public.tbl_candidato.id_persona
	IS 'Identificador �nico de una persona.';
COMMENT ON COLUMN public.tbl_candidato.id_candidato_persona
   IS 'Identificador �nico del candidato con el que tuvo coincidencia la persona a enrolarse.';
COMMENT ON COLUMN public.tbl_candidato.id_estatus_candidato
   IS 'Llave for�nea que indica el estatus general del candidato, proviene de la tabla cat_estatus.';
COMMENT ON COLUMN public.tbl_candidato.puntaje_fusion
   IS 'Valor del puntaje de Fusi�n.';
COMMENT ON COLUMN public.tbl_candidato.id_algoritmo
   IS 'Llave for�nea que hace referencia al campo id_algoritmo de la tabla cat_algoritmo.';


---------------------------------------------- Script 07 -------------------------------------------------------------
DROP TABLE IF EXISTS public.cat_motorbio;
CREATE TABLE public.cat_motorbio
(
	id_motorbio   integer      NOT NULL default nextval ('seq_motorbio_id_motorbio'),
	motor         varchar(50)  NOT NULL,
	descripcion   varchar(100),
CONSTRAINT pk_motorbio_id_motorbio PRIMARY KEY (id_motorbio)
)
WITH
(
    OIDS = FALSE
)
TABLESPACE tsp_fusion;

ALTER TABLE public.cat_motorbio
    OWNER to usr_fusion;

COMMENT ON TABLE public.cat_motorbio
   IS 'Tabla que contiene el cat�logo de los diferentes motores biom�tricos utilizados en el sistema.';
COMMENT ON COLUMN public.cat_motorbio.id_motorbio
   IS 'Llave primaria de la tabla. Es un campo autoincremental.';
COMMENT ON COLUMN public.cat_motorbio.motor
   IS 'Nombre del motor biometrico.';
 COMMENT ON COLUMN public.cat_motorbio.descripcion
   IS 'Nombre descriptivo del motor biom�trico.';

---------------------------------------------- Script 08 -------------------------------------------------------------
DROP TABLE IF EXISTS public.tbl_candidato_detalle;
CREATE TABLE public.tbl_candidato_detalle
(
    id_candidato_detalle    integer NOT NULL default nextval ('seq_candidato_detalle_id_candidato_detalle'),
	id_candidato            integer NOT NULL,
	id_estatus_biometrico	integer	NOT NULL,
	id_posicion				integer	NOT NULL,
	puntaje_motor			decimal(6,2),
	puntaje_normalizado		decimal(17,16),
	id_biometrico			integer	NOT NULL,
	id_motorbio				integer NOT NULL,
	umbral_maximo			integer,
	umbral_minimo			integer,
    CONSTRAINT pk_candidato_detalle_id_candidato_detalle	PRIMARY KEY (id_candidato_detalle),
    CONSTRAINT fk_candidato_detalle_id_candidato			FOREIGN KEY (id_candidato)
      REFERENCES public.tbl_candidato (id_candidato),
	CONSTRAINT fk_candidato_detalle_id_biometrico			FOREIGN KEY (id_biometrico)
      REFERENCES public.cat_biometrico (id_biometrico),
	CONSTRAINT fk_candidato_detalle_id_estatus				FOREIGN KEY (id_estatus_biometrico)
      REFERENCES public.cat_estatus (id_estatus),
	CONSTRAINT fk_candidato_detalle_id_posicion				FOREIGN KEY (id_posicion)
      REFERENCES public.cat_posicion (id_posicion),
	CONSTRAINT fk_candidato_detalle_id_motorbio				FOREIGN KEY (id_motorbio)
      REFERENCES public.cat_motorbio (id_motorbio)
)
WITH
(
    OIDS = FALSE
)
TABLESPACE tsp_fusion;

ALTER TABLE public.tbl_candidato_detalle
    OWNER to usr_fusion;

COMMENT ON TABLE public.tbl_candidato_detalle
   IS 'Tabla que registra los detalles biom�tricos de un candidato.';
COMMENT ON COLUMN public.tbl_candidato_detalle.id_candidato_detalle
   IS 'Llave primaria de la tabla. Es un campo autoincremental.';
COMMENT ON COLUMN public.tbl_candidato_detalle.id_candidato
   IS 'Llave for�nea que hace referencia al campo id_candidato de la tabla tbl_candidato.';
COMMENT ON COLUMN public.tbl_candidato_detalle.id_biometrico
   IS 'Llave for�nea que hace referencia al campo id_biometrico de la tabla cat_biometrico.';
COMMENT ON COLUMN public.tbl_candidato_detalle.id_posicion
   IS 'Llave for�nea que hace referencia al campo id_posicion de la tabla cat_posicion.';
COMMENT ON COLUMN public.tbl_candidato_detalle.id_estatus_biometrico
   IS 'Llave for�nea que hace referencia al campo id_estatus de la tabla cat_estatus.';
COMMENT ON COLUMN public.tbl_candidato_detalle.id_motorbio
   IS 'Llave for�nea que hace referencia al campo id_motorbio de la tabla cat_motorbio.';
COMMENT ON COLUMN public.tbl_candidato_detalle.puntaje_motor
   IS 'Valor que indica el puntaje asignado por el motor biom�trico.';
COMMENT ON COLUMN public.tbl_candidato_detalle.puntaje_normalizado
   IS   'Valor que indica el puntaje de motor ya normalizado.';
COMMENT ON COLUMN public.tbl_candidato_detalle.umbral_maximo
   IS 'El umbral superior define el nivel donde los puntajes mayores o iguales son "Hits absolutos". Las puntuaciones mayores o iguales a umbral_minimo y menores a ubral_maximo son "Area gris".';
COMMENT ON COLUMN public.tbl_candidato_detalle.umbral_minimo
   IS 'El umbral bajo define el nivel donde las puntuaciones m�s bajas son omitidas.';

---------------------------------------------- Script 09 -------------------------------------------------------------
DROP TABLE IF EXISTS public.cat_umbral_conf;
CREATE TABLE public.cat_umbral_conf
(
    id_umbral_conf      integer 	NOT NULL default nextval ('seq_umbral_conf_id_umbral_conf'),
	id_motorbio         integer     NOT NULL,
	id_organizacion     integer     NOT NULL,
	id_biometrico		integer		NOT NULL,
	umbral_minimo		integer,
	umbral_maximo		integer,
	fecha_modificacion  timestamp with time zone DEFAULT timezone('America/Mexico_City'::text, now()),
	usuario             varchar(20) NOT NULL,
	CONSTRAINT pk_umbral_conf_id_umbral_conf	PRIMARY KEY (id_umbral_conf),
	CONSTRAINT fk_umbral_conf_id_motorbio		FOREIGN KEY (id_motorbio)
        REFERENCES public.cat_motorbio (id_motorbio),
	CONSTRAINT fk_umbral_conf_id_organizacion	FOREIGN KEY (id_organizacion)
        REFERENCES public.cat_organizacion (id_organizacion),
	CONSTRAINT fk_umbral_conf_id_biometrico		FOREIGN KEY (id_biometrico)
        REFERENCES public.cat_biometrico (id_biometrico)
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_fusion;

ALTER TABLE public.cat_umbral_conf
    OWNER to usr_fusion;

COMMENT ON TABLE public.cat_umbral_conf
   IS 'Tabla que almacena los valores de configuraci�n de los diferentes esquemas biom�tricos que pueden ser utilizados en el proceso Fusi�n.';
COMMENT ON COLUMN public.cat_umbral_conf.id_umbral_conf
   IS 'Llave primaria de la tabla. Es un campo autoincremental.';
COMMENT ON COLUMN public.cat_umbral_conf.id_motorbio
   IS 'Llave for�nea que hace referencia al campo id_motorbio de la tabla cat_motorbio.';
COMMENT ON COLUMN public.cat_umbral_conf.id_organizacion
   IS 'Llave for�nea que hace referencia al campo id_organizacion de la tabla cat_organizacion.';
COMMENT ON COLUMN public.cat_umbral_conf.id_biometrico
   IS 'Llave for�nea que hace referencia al campo id_biometrico de la tabla cat_biometrico.';
COMMENT ON COLUMN public.cat_umbral_conf.umbral_minimo
   IS 'El umbral bajo define el nivel donde las puntuaciones m�s bajas son omitidas.';
 COMMENT ON COLUMN public.cat_umbral_conf.umbral_maximo
   IS 'El umbral superior define el nivel donde los puntajes mayores o iguales son "Hits absolutos". Las puntuaciones mayores o iguales a umbral_minimo y menores a ubral_maximo son "Area gris".';
COMMENT ON COLUMN public.cat_umbral_conf.fecha_modificacion
   IS 'Fecha en la cual se establecen los valores de configuraci�n para el esquema biom�trico.';
COMMENT ON COLUMN public.cat_umbral_conf.usuario
   IS 'Nombre del usuario que establece los valores de configuraci�n para el esquema biom�trico.';


---------------------------------------------- Script 10 -------------------------------------------------------------
DROP TABLE IF EXISTS public.tbl_umbral_conf_his;
CREATE TABLE public.tbl_umbral_conf_his
(
    id_umbral_conf_his  integer 	NOT NULL default nextval ('seq_umbral_conf_his_id_umbral_conf_his'),
	id_umbral_conf		integer	 	NOT NULL,
	id_motorbio         integer     NOT NULL,
	id_organizacion     integer     NOT NULL,
	id_biometrico		integer		NOT NULL,
	umbral_minimo		integer,
	umbral_maximo		integer,
	operacion			char (1),
	fecha_modificacion  timestamp with time zone DEFAULT timezone('America/Mexico_City'::text, now()),
	usuario             varchar(20)     NOT NULL,
	CONSTRAINT pk_umbral_conf_his_id_umbral_conf_his  PRIMARY KEY (id_umbral_conf_his),
	CONSTRAINT fk_umbral_conf_his_id_umbral_conf      FOREIGN KEY (id_umbral_conf)
        REFERENCES public.cat_umbral_conf (id_umbral_conf)
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_fusion;

ALTER TABLE public.tbl_umbral_conf_his
    OWNER to usr_fusion;

COMMENT ON TABLE public.tbl_umbral_conf_his
   IS 'Tabla que guarda un hist�rico de todos los movimientos de la tabla cat_umbral_conf.';
COMMENT ON COLUMN public.tbl_umbral_conf_his.id_umbral_conf_his
   IS 'Llave primaria de la tabla. Es un campo autoincremental.';
COMMENT ON COLUMN public.tbl_umbral_conf_his.id_motorbio
   IS 'Llave for�nea que hace referencia al campo id_motorbio de la tabla cat_motorbio.';
COMMENT ON COLUMN public.tbl_umbral_conf_his.id_organizacion
   IS 'Llave for�nea que hace referencia al campo id_organizacion de la tabla cat_organizacion.';
COMMENT ON COLUMN public.tbl_umbral_conf_his.id_biometrico
   IS 'Llave for�nea que hace referencia al campo id_biometrico de la tabla cat_biometrico.';
COMMENT ON COLUMN public.tbl_umbral_conf_his.umbral_minimo
   IS 'Valor m�nimo para determinar que un candidato hizo hit.';
 COMMENT ON COLUMN public.tbl_umbral_conf_his.umbral_maximo
   IS 'Valor m�ximo para determinar que un candidato hizo hit absoluto.';
 COMMENT ON COLUMN public.tbl_umbral_conf_his.operacion
   IS 'Tipo de operaci�n que se realiz� en la tabla cat_umbral_conf. (A) Actualizaci�n, (B) Baja, (I) Inserci�n.';
COMMENT ON COLUMN public.tbl_umbral_conf_his.fecha_modificacion
   IS 'Fecha en la cual se establecen los valores de configuraci�n para el esquema biom�trico.';
COMMENT ON COLUMN public.tbl_umbral_conf_his.usuario
   IS 'Nombre del usuario que establece los valores de configuraci�n para el esquema biom�trico.';

---------------------------------------------- Script 11 -------------------------------------------------------------
DROP TABLE IF EXISTS public.cat_factor;
CREATE TABLE public.cat_factor
(
	id_factor	integer 	NOT NULL default nextval ('seq_factor_id_factor'),
	factor		varchar(15) NOT NULL,
	descripcion varchar(50),
	CONSTRAINT pk_factor_id_factor    PRIMARY KEY (id_factor)
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_fusion;

ALTER TABLE public.cat_factor
    OWNER to usr_fusion;

COMMENT ON TABLE public.cat_factor
   IS 'Tabla que contiene la lista de los diferentes valores de factores que se pueden aplicar en el sistema para el proceso de fusi�n.';
COMMENT ON COLUMN public.cat_factor.id_factor
   IS 'Llave primaria de la tabla. Es un campo autoincremental.';
COMMENT ON COLUMN public.cat_factor.factor
   IS 'Nombre o tipo del factor.';
COMMENT ON COLUMN public.cat_factor.descripcion
   IS 'Nombre descriptivo del factor.';

---------------------------------------------- Script 12 -------------------------------------------------------------
DROP TABLE IF EXISTS public.cat_factor_calculo;
CREATE TABLE public.cat_factor_calculo
(
	id_factor_calculo  integer NOT NULL default nextval ('seq_factor_calculo_id_factor_calculo'),
	id_factor		   integer NOT NULL,
	id_biometrico	   integer NOT NULL,
	valor			   decimal (4,2),
	usuario			   varchar (20) NOT NULL,
	fecha_modificacion timestamp with time zone DEFAULT timezone('America/Mexico_City'::text, now()),
	CONSTRAINT pk_factor_calculo_id_factor_calculo PRIMARY KEY (id_factor_calculo),
	CONSTRAINT fk_factor_calculo_id_factor         FOREIGN KEY (id_factor)
        REFERENCES public.cat_factor (id_factor),
	CONSTRAINT fk_factor_calculo_id_biometrico     FOREIGN KEY (id_biometrico)
        REFERENCES public.cat_biometrico (id_biometrico)
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_fusion;

ALTER TABLE public.cat_factor_calculo
    OWNER to usr_fusion;

COMMENT ON TABLE public.cat_factor_calculo
   IS 'Tabla que contiene los diferentes valores de factores que se pueden aplicar en el sistema para el proceso de Fusi�n por tipo de biom�trico..';
COMMENT ON COLUMN public.cat_factor_calculo.id_factor_calculo
   IS 'Llave primaria de la tabla. Es un campo autoincremental.';
COMMENT ON COLUMN public.cat_factor_calculo.id_factor
   IS 'Llave for�nea que hace referencia al campo id_factor de la tabla cat_factor.';
COMMENT ON COLUMN public.cat_factor_calculo.id_biometrico
   IS 'Llave for�nea que hace referencia al campo id_biometrico de la tabla cat_biometrico.';
COMMENT ON COLUMN public.cat_factor_calculo.valor
   IS 'Valor del factor aplicado en Fusi�n.';
COMMENT ON COLUMN public.cat_factor_calculo.usuario
   IS 'Nombre del usuario que establece los valores de configuraci�n para el factor de c�lculo.';
 COMMENT ON COLUMN public.cat_factor_calculo.fecha_modificacion
   IS 'Fecha en la cual se establecen los valores de configuraci�n para el factor del c�lculo.';

---------------------------------------------- Script 13 -------------------------------------------------------------
DROP TABLE IF EXISTS public.cat_rango_biometrico;
CREATE TABLE public.cat_rango_biometrico
(
	id_rango_biometrico	integer			NOT NULL default nextval ('seq_rango_biometrico_id_rango_biometrico'),
	id_motorbio		   	integer			NOT NULL,
	id_biometrico	   	integer			NOT NULL,
	rango_minimo	   	integer,
	rango_maximo	   	integer,
	fecha_modificacion 	timestamp with time zone DEFAULT timezone('America/Mexico_City'::text, now()),
	usuario				varchar (20)	NOT NULL,
CONSTRAINT pk_cat_rango_biometrico_id_rangobiometrico	PRIMARY KEY (id_rango_biometrico),
	CONSTRAINT fk_rango_biometrico_id_motorbio			FOREIGN KEY (id_motorbio)
        REFERENCES public.cat_motorbio (id_motorbio),
	CONSTRAINT fk_rango_biometrico_id_biometrico		FOREIGN KEY (id_biometrico)
        REFERENCES public.cat_biometrico (id_biometrico)
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_fusion;

ALTER TABLE public.cat_rango_biometrico
    OWNER to usr_fusion;

COMMENT ON TABLE public.cat_rango_biometrico
   IS 'Tabla que contiene el cat�logo de los valores de configuraci�n por motor y tipo biom�trico para el proceso de Fusi�n.';
COMMENT ON COLUMN public.cat_rango_biometrico.id_rango_biometrico
   IS 'Llave primaria de la tabla. Es un campo autoincremental.';
COMMENT ON COLUMN public.cat_rango_biometrico.id_motorbio
   IS 'Llave for�nea que hace referencia al campo id_motorbio de la tabla cat_motorbio.';
COMMENT ON COLUMN public.cat_rango_biometrico.id_biometrico
   IS 'Llave for�nea que hace referencia al campo id_biometrico de la tabla cat_biometrico.';
COMMENT ON COLUMN public.cat_rango_biometrico.rango_minimo
   IS 'Valor m�nimo para determinar si es hit.';
COMMENT ON COLUMN public.cat_rango_biometrico.rango_maximo
   IS 'Valor m�ximo para determinar si es hit absoluto.';
COMMENT ON COLUMN public.cat_rango_biometrico.fecha_modificacion
   IS 'Fecha en la cual se establecen los valores de configuraci�n para el rango biom�trico.';
COMMENT ON COLUMN public.cat_rango_biometrico.usuario
   IS 'Nombre del usuario que establece los valores de configuraci�n para el rango biom�trico.';


---------------------------------------------- Script 14 -------------------------------------------------------------
DROP TABLE IF EXISTS public.tbl_factor_calculo_his;
CREATE TABLE public.tbl_factor_calculo_his
(
	id_factor_calculo_his	integer			NOT NULL default nextval ('seq_factor_calculo_his_id_factor_calculo_his'),
	id_factor_calculo		integer			NOT NULL,
	id_factor				integer			NOT NULL,
	id_biometrico			integer 		NOT NULL,
	valor					decimal (4,2),
	usuario					varchar (20)	NOT NULL,
	operacion				char (1)		NOT NULL,
	fecha_modificacion		timestamp with time zone DEFAULT timezone('America/Mexico_City'::text, now()),
	CONSTRAINT pk_factor_calculo_his_id_factor_calculo_his PRIMARY KEY (id_factor_calculo_his),
	CONSTRAINT fk_factor_calculo_his_id_factor_calculo     FOREIGN KEY (id_factor_calculo)
        REFERENCES public.cat_factor_calculo (id_factor_calculo)
)
WITH (
    OIDS = FALSE
)
TABLESPACE tsp_fusion;

ALTER TABLE public.tbl_factor_calculo_his
    OWNER to usr_fusion;

COMMENT ON TABLE public.tbl_factor_calculo_his
   IS 'Tabla que guarda un hist�rico de todos los movimientos de la tabla cat_factor_calculo.';
COMMENT ON COLUMN public.tbl_factor_calculo_his.id_factor_calculo_his
   IS 'Llave primaria de la tabla. Es un campo autoincremental.';
COMMENT ON COLUMN public.tbl_factor_calculo_his.id_factor_calculo
   IS 'Llave for�nea que hace referencia al campo id_factor de la tabla cat_factor.';
COMMENT ON COLUMN public.tbl_factor_calculo_his.id_factor
   IS 'Llave for�nea que hace referencia al campo id_factor de la tabla cat_factor.';
COMMENT ON COLUMN public.tbl_factor_calculo_his.id_biometrico
   IS 'Llave for�nea que hace referencia al campo id_biometrico de la tabla cat_biometrico.';
COMMENT ON COLUMN public.tbl_factor_calculo_his.valor
   IS 'Valor del factor aplicado en Fusi�n.';
COMMENT ON COLUMN public.tbl_factor_calculo_his.usuario
   IS 'Nombre del usuario que establece los valores de configuraci�n para el factor de c�lculo.';
COMMENT ON COLUMN public.tbl_factor_calculo_his.operacion
   IS 'Tipo de operaci�n que se realiz� en la tabla cat_umbral_conf. (A) Actualizaci�n, (B) Baja, (I) Inserci�n.';
COMMENT ON COLUMN public.tbl_factor_calculo_his.fecha_modificacion
   IS 'Fecha en la cual se establecen los valores de configuraci�n para el factor del c�lculo.';
