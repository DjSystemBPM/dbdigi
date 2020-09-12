\c db_fusion;

--SCRIPTS PARA LA CREACI�N DE SECUENCIAS EN LA BASE DE DATOS db_fusion CON LOS ESTANDARES APLICADOS
----------------------------------- S   E   C  U  E  N  C  I  A  S-----------------------------------------------------
--////////////////////////////////////// 01 ///cat_algoritmo /////////////////////////////////////////////////////
CREATE SEQUENCE public.seq_algoritmo_id_algoritmo
   INCREMENT  1
   START      1
   MINVALUE   1
   MAXVALUE   2147483647
   CACHE      1
   NO CYCLE;

ALTER SEQUENCE public.seq_algoritmo_id_algoritmo
    OWNER TO usr_fusion;

GRANT ALL ON SEQUENCE public.seq_algoritmo_id_algoritmo
	TO usr_fusion;

COMMENT ON SEQUENCE public.seq_algoritmo_id_algoritmo
    IS 'Secuencia utilizada en la tabla cat_algoritmo para el campo id_algoritmo.';

--////////////////////////////////////// 02 ///cat_biometrico /////////////////////////////////////////////////////
CREATE SEQUENCE public.seq_biometrico_id_biometrico
   INCREMENT  1
   START      1
   MINVALUE   1
   MAXVALUE   2147483647
   CACHE      1
   NO CYCLE;

ALTER SEQUENCE public.seq_biometrico_id_biometrico
   OWNER TO usr_fusion;

GRANT ALL ON public.seq_biometrico_id_biometrico
	TO usr_fusion;

COMMENT ON SEQUENCE public.seq_biometrico_id_biometrico
    IS 'Secuencia utilizada en la tabla cat_biometrico para el campo id_biometrico.';

--////////////////////////////////////// 03 ///tbl_candidato_detalle /////////////////////////////////////////////////////
CREATE SEQUENCE public.seq_candidato_detalle_id_candidato_detalle
   INCREMENT  1
   START      1
   MINVALUE   1
   MAXVALUE   2147483647
   CACHE      1
   NO CYCLE;

ALTER SEQUENCE public.seq_candidato_detalle_id_candidato_detalle
    OWNER TO usr_fusion;

GRANT ALL ON public.seq_candidato_detalle_id_candidato_detalle
	TO usr_fusion;

COMMENT ON SEQUENCE public.seq_candidato_detalle_id_candidato_detalle
    IS 'Secuencia utilizada en la tabla tbl_candidato_detalle para el campo id_candidato_detalle.';

--////////////////////////////////////// 04 ///cat_candidato /////////////////////////////////////////////////////
CREATE SEQUENCE public.seq_candidato_id_candidato
   INCREMENT  1
   START      1
   MINVALUE   1
   MAXVALUE   2147483647
   CACHE      1
   NO CYCLE;

ALTER SEQUENCE public.seq_candidato_id_candidato
    OWNER TO usr_fusion;

GRANT ALL ON public.seq_candidato_id_candidato
	TO usr_fusion;

COMMENT ON SEQUENCE public.seq_candidato_id_candidato
    IS 'Secuencia utilizada en la tabla cat_candidato para el campo id_candidato.';

--////////////////////////////////////// 05 ///cat_estatus /////////////////////////////////////////////////////
CREATE SEQUENCE public.seq_estatus_id_estatus
   INCREMENT  1
   START      1
   MINVALUE   1
   MAXVALUE   2147483647
   CACHE      1
   NO CYCLE;

ALTER SEQUENCE public.seq_estatus_id_estatus
    OWNER TO usr_fusion;

GRANT ALL ON SEQUENCE public.seq_estatus_id_estatus
	TO usr_fusion;

COMMENT ON SEQUENCE public.seq_estatus_id_estatus
    IS 'Secuencia utilizada en la tabla cat_estatus para el campo id_estatus.';

--////////////////////////////////////// 06 ///cat_factor_calculo /////////////////////////////////////////////////////
CREATE SEQUENCE public.seq_factor_calculo_id_factor_calculo
   INCREMENT  1
   START      1
   MINVALUE   1
   MAXVALUE   2147483647
   CACHE      1
   NO CYCLE;

ALTER SEQUENCE public.seq_factor_calculo_id_factor_calculo
   OWNER TO usr_fusion;

GRANT ALL ON public.seq_factor_calculo_id_factor_calculo
	TO usr_fusion;

COMMENT ON SEQUENCE public.seq_factor_calculo_id_factor_calculo
    IS 'Secuencia utilizada en la tabla cat_factor_calculo para el campo id_factor_calculo.';

--////////////////////////////////////// 07 ///cat_factor_calculo_his /////////////////////////////////////////////////////
CREATE SEQUENCE public.seq_factor_calculo_his_id_factor_calculo_his
   INCREMENT  1
   START      1
   MINVALUE   1
   MAXVALUE   2147483647
   CACHE      1
   NO CYCLE;

ALTER SEQUENCE public.seq_factor_calculo_his_id_factor_calculo_his
   OWNER TO usr_fusion;

GRANT ALL ON public.seq_factor_calculo_his_id_factor_calculo_his
	TO usr_fusion;

COMMENT ON SEQUENCE public.seq_factor_calculo_his_id_factor_calculo_his
    IS 'Secuencia utilizada en la tabla cat_factor_calculo_his para el campo id_factor_calculo_his.';

--////////////////////////////////////// 08 ///cat_factor /////////////////////////////////////////////////////
CREATE SEQUENCE public.seq_factor_id_factor
   INCREMENT  1
   START      1
   MINVALUE   1
   MAXVALUE   2147483647
   CACHE      1
   NO CYCLE;

ALTER SEQUENCE public.seq_factor_id_factor
   OWNER TO usr_fusion;

GRANT ALL ON public.seq_factor_id_factor
	TO usr_fusion;

COMMENT ON SEQUENCE public.seq_factor_id_factor
    IS 'Secuencia utilizada en la tabla cat_factor para el campo id_id_factor.';


--////////////////////////////////////// 09 ///cat_motorbio /////////////////////////////////////////////////////
CREATE SEQUENCE public.seq_motorbio_id_motorbio
   INCREMENT  1
   START      1
   MINVALUE   1
   MAXVALUE   2147483647
   CACHE      1
   NO CYCLE;

ALTER SEQUENCE public.seq_motorbio_id_motorbio
   OWNER TO usr_fusion;

GRANT ALL ON public.seq_motorbio_id_motorbio
	TO usr_fusion;

COMMENT ON SEQUENCE public.seq_motorbio_id_motorbio
    IS 'Secuencia utilizada en la tabla cat_motorbio para el campo id_motorbio.';

--////////////////////////////////////// 10 ///cat_organizacion /////////////////////////////////////////////////////
CREATE SEQUENCE public.seq_organizacion_id_organizacion
   INCREMENT  1
   START      1
   MINVALUE   1
   MAXVALUE   2147483647
   CACHE      1
   NO CYCLE;

ALTER SEQUENCE public.seq_organizacion_id_organizacion
    OWNER TO usr_fusion;

GRANT ALL ON SEQUENCE public.seq_organizacion_id_organizacion
	TO usr_fusion;

COMMENT ON SEQUENCE public.seq_organizacion_id_organizacion
    IS 'Secuencia utilizada en la tabla cat_organizacion para el campo id_organizacion.';

--////////////////////////////////////// 11 ///cat_posicion /////////////////////////////////////////////////////
CREATE SEQUENCE public.seq_posicion_id_posicion
   INCREMENT  1
   START      1
   MINVALUE   1
   MAXVALUE   2147483647
   CACHE      1
   NO CYCLE;

ALTER SEQUENCE public.seq_posicion_id_posicion
    OWNER TO usr_fusion;

GRANT ALL ON public.seq_posicion_id_posicion
	TO usr_fusion;

COMMENT ON SEQUENCE public.seq_posicion_id_posicion
    IS 'Secuencia utilizada en la tabla cat_posicion para el campo id_posicion.';

--////////////////////////////////////// 12 ///cat_rango_biometrico /////////////////////////////////////////////////////
CREATE SEQUENCE public.seq_rango_biometrico_id_rango_biometrico
   INCREMENT  1
   START      1
   MINVALUE   1
   MAXVALUE   2147483647
   CACHE      1
   NO CYCLE;

ALTER SEQUENCE public.seq_rango_biometrico_id_rango_biometrico
   OWNER TO usr_fusion;

GRANT ALL ON public.seq_rango_biometrico_id_rango_biometrico
	TO usr_fusion;

COMMENT ON SEQUENCE public.seq_rango_biometrico_id_rango_biometrico
    IS 'Secuencia utilizada en la tabla cat_rango_biometrico para el campo id_rango_biometrico.';

--////////////////////////////////////// 13 ///tbl_umbral_conf /////////////////////////////////////////////////////
CREATE SEQUENCE public.seq_umbral_conf_id_umbral_conf
   INCREMENT  1
   START      1
   MINVALUE   1
   MAXVALUE   2147483647
   CACHE      1
   NO CYCLE;

ALTER SEQUENCE public.seq_umbral_conf_id_umbral_conf
   OWNER TO usr_fusion;

GRANT ALL ON public.seq_umbral_conf_id_umbral_conf
	TO usr_fusion;

COMMENT ON SEQUENCE public.seq_umbral_conf_id_umbral_conf
    IS 'Secuencia utilizada en la tabla cat_umbral_conf para el campo id_umbral_conf.';

--////////////////////////////////////// 14 ///tbl_umbral_conf_his /////////////////////////////////////////////////////
CREATE SEQUENCE public.seq_umbral_conf_his_id_umbral_conf_his
   INCREMENT  1
   START      1
   MINVALUE   1
   MAXVALUE   2147483647
   CACHE      1
   NO CYCLE;

ALTER SEQUENCE public.seq_umbral_conf_his_id_umbral_conf_his
    OWNER TO usr_fusion;

GRANT ALL ON SEQUENCE public.seq_umbral_conf_his_id_umbral_conf_his
	TO usr_fusion;

COMMENT ON SEQUENCE public.seq_umbral_conf_his_id_umbral_conf_his
    IS 'Secuencia utilizada en la tabla tbl_umbral_conf_his para el campo id_umbral_conf_his.';
