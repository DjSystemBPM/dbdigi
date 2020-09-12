\c db_digitus;

--------------CREACIÓN DE SECUENCIAS-----------------------
---------------------------------------Secuencia 01 ---------------------------------------------
CREATE SEQUENCE public.seq_alerta_id_alerta
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_alerta_id_alerta
    OWNER TO usr_digitus;

GRANT ALL ON SEQUENCE public.seq_alerta_id_alerta TO usr_digitus;

---------------------------------------Secuencia 02 ---------------------------------------------
CREATE SEQUENCE public.seq_algoritmo_id_algoritmo
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_algoritmo_id_algoritmo
    OWNER TO usr_digitus;

COMMENT ON SEQUENCE public.seq_algoritmo_id_algoritmo
    IS 'Secuencia utilizada en la tabla cat_algoritmo para el campo id_algoritmo.';

GRANT ALL ON SEQUENCE public.seq_algoritmo_id_algoritmo TO usr_digitus;

---------------------------------------Secuencia 03 ---------------------------------------------
CREATE SEQUENCE public.seq_asociado_his_id_asosciado_his
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_asociado_his_id_asosciado_his
    OWNER TO usr_digitus;

GRANT ALL ON SEQUENCE public.seq_asociado_his_id_asosciado_his TO usr_digitus;

---------------------------------------Secuencia 04 ---------------------------------------------
CREATE SEQUENCE public.seq_asociado_id_asociado
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_asociado_id_asociado
    OWNER TO usr_digitus;

GRANT ALL ON SEQUENCE public.seq_asociado_id_asociado TO usr_digitus;

---------------------------------------Secuencia 05 ---------------------------------------------
CREATE SEQUENCE public.seq_asociado_operacion_id_asociado_operacion
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_asociado_operacion_id_asociado_operacion
    OWNER TO usr_digitus;

---------------------------------------Secuencia 06 ---------------------------------------------
/*CREATE SEQUENCE public.seq_asociado_secuencia
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_asociado_secuencia
    OWNER TO usr_digitus;

GRANT ALL ON SEQUENCE public.seq_asociado_secuencia TO usr_digitus;*/

---------------------------------------Secuencia 07 ---------------------------------------------
CREATE SEQUENCE public.seq_atributo_id_atributo
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_atributo_id_atributo
    OWNER TO usr_digitus;

COMMENT ON SEQUENCE public.seq_atributo_id_atributo
    IS 'Secuencia utilizada en la tabla cat_atributo para el campo id_atributo.';

GRANT ALL ON SEQUENCE public.seq_atributo_id_atributo TO usr_digitus;

---------------------------------------Secuencia 08 ---------------------------------------------
CREATE SEQUENCE public.seq_biometrico_id_biometrico
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_biometrico_id_biometrico
    OWNER TO usr_digitus;

COMMENT ON SEQUENCE public.seq_biometrico_id_biometrico
    IS 'Secuencia utilizada en la tabla cat_biometrico para el campo id_biometrico.';

GRANT ALL ON SEQUENCE public.seq_biometrico_id_biometrico TO usr_digitus;

---------------------------------------Secuencia 09 ---------------------------------------------
CREATE SEQUENCE public.seq_calidad_extraccion_his_id_calidad_extraccion_his
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_calidad_extraccion_his_id_calidad_extraccion_his
    OWNER TO usr_digitus;

COMMENT ON SEQUENCE public.seq_calidad_extraccion_his_id_calidad_extraccion_his
    IS 'Secuencia utilizada en la tabla tbl_calidad_extraccion_his para el campo id_calidad_extraccion_his.';

GRANT ALL ON SEQUENCE public.seq_calidad_extraccion_his_id_calidad_extraccion_his TO usr_digitus;

---------------------------------------Secuencia 10 ---------------------------------------------
CREATE SEQUENCE public.seq_calidad_extraccion_id_calidad_extraccion
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_calidad_extraccion_id_calidad_extraccion
    OWNER TO usr_digitus;

COMMENT ON SEQUENCE public.seq_calidad_extraccion_id_calidad_extraccion
    IS 'Secuencia utilizada en la tabla cat_calidad_extraccion para el campo id_calidad_extraccion.';

GRANT ALL ON SEQUENCE public.seq_calidad_extraccion_id_calidad_extraccion TO usr_digitus;

---------------------------------------Secuencia 11 ---------------------------------------------
CREATE SEQUENCE public.seq_candidato_detalle_id_candidato_detalle
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_candidato_detalle_id_candidato_detalle
    OWNER TO usr_digitus;

COMMENT ON SEQUENCE public.seq_candidato_detalle_id_candidato_detalle
    IS 'Secuencia utilizada en la tabla tbl_candidato_detalle para el campo id_candidato_detalle.';

GRANT ALL ON SEQUENCE public.seq_candidato_detalle_id_candidato_detalle TO usr_digitus;

---------------------------------------Secuencia 12 ---------------------------------------------
CREATE SEQUENCE public.seq_candidato_id_candidato
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_candidato_id_candidato
    OWNER TO usr_digitus;

COMMENT ON SEQUENCE public.seq_candidato_id_candidato
    IS 'Secuencia utilizada en la tabla tbl_candidato para el campo id_candidato.';

GRANT ALL ON SEQUENCE public.seq_candidato_id_candidato TO usr_digitus;

---------------------------------------Secuencia 13 ---------------------------------------------
CREATE SEQUENCE public.seq_codigo_excepcion_id_codigo_excepcion
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_codigo_excepcion_id_codigo_excepcion
    OWNER TO usr_digitus;

COMMENT ON SEQUENCE public.seq_codigo_excepcion_id_codigo_excepcion
    IS 'Secuencia utilizada en la tabla cat_codigo_excepcion para el campo id_codigo_excepcion.';

GRANT ALL ON SEQUENCE public.seq_codigo_excepcion_id_codigo_excepcion TO usr_digitus;

---------------------------------------Secuencia 14 ---------------------------------------------
CREATE SEQUENCE public.seq_cvt_id_cvt
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_cvt_id_cvt
    OWNER TO usr_digitus;

GRANT ALL ON SEQUENCE public.seq_cvt_id_cvt TO usr_digitus;

---------------------------------------Secuencia 15 ---------------------------------------------
CREATE SEQUENCE public.seq_ddp_verificacion_id_ddp_verificacion
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_ddp_verificacion_id_ddp_verificacion
    OWNER TO usr_digitus;

GRANT ALL ON SEQUENCE public.seq_ddp_verificacion_id_ddp_verificacion TO usr_digitus;

---------------------------------------Secuencia 16 ---------------------------------------------
CREATE SEQUENCE public.seq_ddp_vrfcn_minucias_id_ddp_vrfcn_minucias
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_ddp_vrfcn_minucias_id_ddp_vrfcn_minucias
    OWNER TO usr_digitus;

GRANT ALL ON SEQUENCE public.seq_ddp_vrfcn_minucias_id_ddp_vrfcn_minucias TO usr_digitus;

---------------------------------------Secuencia 17 ---------------------------------------------
CREATE SEQUENCE public.seq_deduplicacion_ejecucion_id_deduplicacion_ejecucion
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_deduplicacion_ejecucion_id_deduplicacion_ejecucion
    OWNER TO usr_digitus;

GRANT ALL ON SEQUENCE public.seq_deduplicacion_ejecucion_id_deduplicacion_ejecucion TO usr_digitus;

---------------------------------------Secuencia 18 ---------------------------------------------
CREATE SEQUENCE public.seq_deduplicacion_id_deduplicacion
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_deduplicacion_id_deduplicacion
    OWNER TO usr_digitus;

GRANT ALL ON SEQUENCE public.seq_deduplicacion_id_deduplicacion TO usr_digitus;

---------------------------------------Secuencia 19 ---------------------------------------------
CREATE SEQUENCE public.seq_entidad_id_entidad
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_entidad_id_entidad
    OWNER TO usr_digitus;

COMMENT ON SEQUENCE public.seq_entidad_id_entidad
    IS 'Secuencia utilizada en la tabla cat_entidad para el campo id_entidad.';

GRANT ALL ON SEQUENCE public.seq_entidad_id_entidad TO usr_digitus;

---------------------------------------Secuencia 20 ---------------------------------------------
CREATE SEQUENCE public.seq_estatus_alerta_id_estatus_alerta
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_estatus_alerta_id_estatus_alerta
    OWNER TO usr_digitus;

COMMENT ON SEQUENCE public.seq_estatus_alerta_id_estatus_alerta
    IS 'Secuencia utilizada en la tabla cat_estatus_alerta para el campo id_estatus_alerta.';

GRANT ALL ON SEQUENCE public.seq_estatus_alerta_id_estatus_alerta TO usr_digitus;

---------------------------------------Secuencia 21 ---------------------------------------------
CREATE SEQUENCE public.seq_estatus_ddp_id_estatus_ddp
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_estatus_ddp_id_estatus_ddp
    OWNER TO usr_digitus;

GRANT ALL ON SEQUENCE public.seq_estatus_ddp_id_estatus_ddp TO usr_digitus;

---------------------------------------Secuencia 22 ---------------------------------------------
CREATE SEQUENCE public.seq_estatus_id_estatus
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_estatus_id_estatus
    OWNER TO usr_digitus;

COMMENT ON SEQUENCE public.seq_estatus_id_estatus
    IS 'Secuencia utilizada en la tabla cat_estatus para el campo id_estatus.';

GRANT ALL ON SEQUENCE public.seq_estatus_id_estatus TO usr_digitus;

---------------------------------------Secuencia 23 ---------------------------------------------
CREATE SEQUENCE public.seq_evento_id_evento
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_evento_id_evento
    OWNER TO usr_digitus;

COMMENT ON SEQUENCE public.seq_evento_id_evento
    IS 'Secuencia utilizada en la tabla cat_evento para el campo id_evento.';

GRANT ALL ON SEQUENCE public.seq_evento_id_evento TO usr_digitus;

---------------------------------------Secuencia 24 ---------------------------------------------
CREATE SEQUENCE public.seq_excepcion_id_excepcion
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_excepcion_id_excepcion
    OWNER TO usr_digitus;

COMMENT ON SEQUENCE public.seq_excepcion_id_excepcion
    IS 'Secuencia utilizada en la tabla tbl_excepcion para el campo id_excepcion.';

GRANT ALL ON SEQUENCE public.seq_excepcion_id_excepcion TO usr_digitus;

---------------------------------------Secuencia 25 ---------------------------------------------
/*CREATE SEQUENCE public.seq_liga_condifente_id_liga_confidente
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_liga_condifente_id_liga_confidente
    OWNER TO usr_digitus;

GRANT ALL ON SEQUENCE public.seq_liga_condifente_id_liga_confidente TO usr_digitus;
---------------------------------------Secuencia 26 ---------------------------------------------
CREATE SEQUENCE public.seq_mensaje_queue_id_msj_queue
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_mensaje_queue_id_msj_queue
    OWNER TO usr_digitus;

GRANT ALL ON SEQUENCE public.seq_mensaje_queue_id_msj_queue TO usr_digitus;*/
---------------------------------------Secuencia 27 ---------------------------------------------
CREATE SEQUENCE public.seq_motorbio_id_motorbio
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_motorbio_id_motorbio
    OWNER TO usr_digitus;

COMMENT ON SEQUENCE public.seq_motorbio_id_motorbio
    IS 'Secuencia utilizada en la tabla cat_motorbio para el campo id_motorbio.';

GRANT ALL ON SEQUENCE public.seq_motorbio_id_motorbio TO usr_digitus;
---------------------------------------Secuencia 28 ---------------------------------------------
CREATE SEQUENCE public.seq_operaciontipo_id_operaciontipo
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_operaciontipo_id_operaciontipo
    OWNER TO usr_digitus;

COMMENT ON SEQUENCE public.seq_operaciontipo_id_operaciontipo
    IS 'Secuencia utilizada en la tabla cat_operaciontipo para el campo id_operaciontipo.';

GRANT ALL ON SEQUENCE public.seq_operaciontipo_id_operaciontipo TO usr_digitus;
---------------------------------------Secuencia 29 ---------------------------------------------
CREATE SEQUENCE public.seq_organizacion_id_organizacion
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_organizacion_id_organizacion
    OWNER TO usr_digitus;

COMMENT ON SEQUENCE public.seq_organizacion_id_organizacion
    IS 'Secuencia utilizada en la tabla cat_organizacion para el campo id_organizacion.';

GRANT ALL ON SEQUENCE public.seq_organizacion_id_organizacion TO usr_digitus;
---------------------------------------Secuencia 30 ---------------------------------------------
CREATE SEQUENCE public.seq_pais_id_pais
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_pais_id_pais
    OWNER TO usr_digitus;

COMMENT ON SEQUENCE public.seq_pais_id_pais
    IS 'Secuencia utilizada en la tabla cat_pais para el campo id_pais.';

GRANT ALL ON SEQUENCE public.seq_pais_id_pais TO usr_digitus;
---------------------------------------Secuencia 31 ---------------------------------------------
CREATE SEQUENCE public.seq_permiso_id_permiso
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_permiso_id_permiso
    OWNER TO usr_digitus;

GRANT ALL ON SEQUENCE public.seq_permiso_id_permiso TO usr_digitus;
---------------------------------------Secuencia 32 ---------------------------------------------
CREATE SEQUENCE public.seq_persona_biografico_id_persona_biografico
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_persona_biografico_id_persona_biografico
    OWNER TO usr_digitus;

COMMENT ON SEQUENCE public.seq_persona_biografico_id_persona_biografico
    IS 'Secuencia utilizada en la tabla tbl_persona_biografico para el campo id_persona_biografico.';

GRANT ALL ON SEQUENCE public.seq_persona_biografico_id_persona_biografico TO usr_digitus;
---------------------------------------Secuencia 33 ---------------------------------------------
CREATE SEQUENCE public.seq_respuesta_id_respuesta
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_respuesta_id_respuesta
    OWNER TO usr_digitus;

GRANT ALL ON SEQUENCE public.seq_respuesta_id_respuesta TO usr_digitus;
---------------------------------------Secuencia 34 ---------------------------------------------
CREATE SEQUENCE public.seq_persona_extraccion_h_id_persona_extraccion_h
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_persona_extraccion_h_id_persona_extraccion_h
    OWNER TO usr_digitus;

COMMENT ON SEQUENCE public.seq_persona_extraccion_h_id_persona_extraccion_h
    IS 'Secuencia utilizada en la tabla tbl_persona_extraccion_h para el campo id_persona_extraccion_h.';

GRANT ALL ON SEQUENCE public.seq_persona_extraccion_h_id_persona_extraccion_h TO usr_digitus;
---------------------------------------Secuencia 35 ---------------------------------------------
CREATE SEQUENCE public.seq_persona_extraccion_i_id_persona_extraccion_i
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_persona_extraccion_i_id_persona_extraccion_i
    OWNER TO postgres;

COMMENT ON SEQUENCE public.seq_persona_extraccion_i_id_persona_extraccion_i
    IS 'Secuencia utilizada en la tabla tbl_persona_extraccion_i para el campo id_persona_extraccion_i.';

GRANT USAGE ON SEQUENCE public.seq_persona_extraccion_i_id_persona_extraccion_i TO usr_digitus;

GRANT ALL ON SEQUENCE public.seq_persona_extraccion_i_id_persona_extraccion_i TO postgres;
---------------------------------------Secuencia 36 ---------------------------------------------
CREATE SEQUENCE public.seq_persona_extraccion_r_id_persona_extraccion_r
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_persona_extraccion_r_id_persona_extraccion_r
    OWNER TO postgres;

COMMENT ON SEQUENCE public.seq_persona_extraccion_r_id_persona_extraccion_r
    IS 'Secuencia utilizada en la tabla tbl_persona_extraccion_r para el campo id_persona_extraccion_r.';

GRANT USAGE ON SEQUENCE public.seq_persona_extraccion_r_id_persona_extraccion_r TO usr_digitus;

GRANT ALL ON SEQUENCE public.seq_persona_extraccion_r_id_persona_extraccion_r TO postgres;
---------------------------------------Secuencia 37 ---------------------------------------------
CREATE SEQUENCE public.seq_persona_identidad_id_persona_identidad
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_persona_identidad_id_persona_identidad
    OWNER TO usr_digitus;

COMMENT ON SEQUENCE public.seq_persona_identidad_id_persona_identidad
    IS 'Secuencia utilizada en la tabla tbl_persona_identidad para el campo id_persona_identidad.';

GRANT ALL ON SEQUENCE public.seq_persona_identidad_id_persona_identidad TO usr_digitus;
---------------------------------------Secuencia 38 ---------------------------------------------
CREATE SEQUENCE public.seq_persona_motor_id_persona_motor
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_persona_motor_id_persona_motor
    OWNER TO usr_digitus;

COMMENT ON SEQUENCE public.seq_persona_motor_id_persona_motor
    IS 'Secuencia utilizada en la tabla tbl_persona_motor para el campo id_persona_motor.';

GRANT ALL ON SEQUENCE public.seq_persona_motor_id_persona_motor TO usr_digitus;
---------------------------------------Secuencia 39 ---------------------------------------------
CREATE SEQUENCE public.seq_persona_peticion_id_persona_peticion
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_persona_peticion_id_persona_peticion
    OWNER TO usr_digitus;

GRANT ALL ON SEQUENCE public.seq_persona_peticion_id_persona_peticion TO usr_digitus;
---------------------------------------Secuencia 40 ---------------------------------------------
CREATE SEQUENCE public.seq_peticion_id_peticion
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_peticion_id_peticion
    OWNER TO usr_digitus;

GRANT ALL ON SEQUENCE public.seq_peticion_id_peticion TO usr_digitus;
---------------------------------------Secuencia 41 ---------------------------------------------
CREATE SEQUENCE public.seq_posicion_id_posicion
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_posicion_id_posicion
    OWNER TO usr_digitus;

COMMENT ON SEQUENCE public.seq_posicion_id_posicion
    IS 'Secuencia utilizada en la tabla cat_posicion para el campo id_posicion.';

GRANT ALL ON SEQUENCE public.seq_posicion_id_posicion TO usr_digitus;
---------------------------------------Secuencia 42 ---------------------------------------------
CREATE SEQUENCE public.seq_programa_id_programa
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_programa_id_programa
    OWNER TO usr_digitus;

GRANT ALL ON SEQUENCE public.seq_programa_id_programa TO usr_digitus;
---------------------------------------Secuencia 43 ---------------------------------------------
CREATE SEQUENCE public.seq_recuperacion_biometrico_id_recuperacion_biometrico
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_recuperacion_biometrico_id_recuperacion_biometrico
    OWNER TO usr_digitus;

GRANT ALL ON SEQUENCE public.seq_recuperacion_biometrico_id_recuperacion_biometrico TO usr_digitus;
---------------------------------------Secuencia 44 ---------------------------------------------
CREATE SEQUENCE public.seq_registro_evento_id_registro_evento
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_registro_evento_id_registro_evento
    OWNER TO usr_digitus;

COMMENT ON SEQUENCE public.seq_registro_evento_id_registro_evento
    IS 'Secuencia utilizada en la tabla tbl_registro_evento para el campo id_registro_evento.';

GRANT ALL ON SEQUENCE public.seq_registro_evento_id_registro_evento TO usr_digitus;
---------------------------------------Secuencia 45 ---------------------------------------------
/*CREATE SEQUENCE public.seq_secr_permiso_idsecper
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_secr_permiso_idsecper
    OWNER TO postgres;

GRANT USAGE ON SEQUENCE public.seq_secr_permiso_idsecper TO usr_digitus;

GRANT ALL ON SEQUENCE public.seq_secr_permiso_idsecper TO postgres;*/
---------------------------------------Secuencia 46 ---------------------------------------------
CREATE SEQUENCE public.seq_secretaria_id_secretaria
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_secretaria_id_secretaria
    OWNER TO usr_digitus;

COMMENT ON SEQUENCE public.seq_secretaria_id_secretaria
    IS 'Secuencia utilizada en la tabla cat_secretaria para el campo id_secretaria.';

GRANT ALL ON SEQUENCE public.seq_secretaria_id_secretaria TO usr_digitus;
---------------------------------------Secuencia 47 ---------------------------------------------
CREATE SEQUENCE public.seq_sistema_id_sistema
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_sistema_id_sistema
    OWNER TO usr_digitus;

GRANT ALL ON SEQUENCE public.seq_sistema_id_sistema TO usr_digitus;
---------------------------------------Secuencia 48 ---------------------------------------------
CREATE SEQUENCE public.seq_sitio_id_sitio
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_sitio_id_sitio
    OWNER TO usr_digitus;

COMMENT ON SEQUENCE public.seq_sitio_id_sitio
    IS 'Secuencia utilizada en la tabla cat_sitio para el campo id_sitio.';

GRANT ALL ON SEQUENCE public.seq_sitio_id_sitio TO usr_digitus;
---------------------------------------Secuencia 49 ---------------------------------------------
CREATE SEQUENCE public.seq_tipo_alerta_id_tipo_alerta
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_tipo_alerta_id_tipo_alerta
    OWNER TO usr_digitus;

COMMENT ON SEQUENCE public.seq_tipo_alerta_id_tipo_alerta
    IS 'Secuencia utilizada en la tabla cat_alerta para el campo id_alerta.';

GRANT ALL ON SEQUENCE public.seq_tipo_alerta_id_tipo_alerta TO usr_digitus;
---------------------------------------Secuencia 50 ---------------------------------------------
CREATE SEQUENCE public.seq_tipo_respuesta_id_tipo_respuesta
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_tipo_respuesta_id_tipo_respuesta
    OWNER TO usr_digitus;

GRANT ALL ON SEQUENCE public.seq_tipo_respuesta_id_tipo_respuesta TO usr_digitus;
---------------------------------------Secuencia 51 ---------------------------------------------
CREATE SEQUENCE public.seq_tipo_verificacion_id_tipo_verificacion
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_tipo_verificacion_id_tipo_verificacion
    OWNER TO usr_digitus;

GRANT ALL ON SEQUENCE public.seq_tipo_verificacion_id_tipo_verificacion TO usr_digitus;
---------------------------------------Secuencia 52 ---------------------------------------------
CREATE SEQUENCE public.seq_umbral_conf_his_id_umbral_conf_his
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_umbral_conf_his_id_umbral_conf_his
    OWNER TO usr_digitus;

COMMENT ON SEQUENCE public.seq_umbral_conf_his_id_umbral_conf_his
    IS 'Secuencia utilizada en la tabla cat_umbral_conf_his para el campo id_umbral_conf_his.';

GRANT ALL ON SEQUENCE public.seq_umbral_conf_his_id_umbral_conf_his TO usr_digitus;
---------------------------------------Secuencia 53 ---------------------------------------------
CREATE SEQUENCE public.seq_umbral_conf_id_umbral_conf
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_umbral_conf_id_umbral_conf
    OWNER TO usr_digitus;

COMMENT ON SEQUENCE public.seq_umbral_conf_id_umbral_conf
    IS 'Secuencia utilizada en la tabla cat_umbral_conf para el campo id_umbral_conf.';

GRANT ALL ON SEQUENCE public.seq_umbral_conf_id_umbral_conf TO usr_digitus;

------------------------------------Secuencia 54 ----------------------------------------------
-- Creación de secuencia
CREATE SEQUENCE public.seq_persona_extraccion_p_id_persona_extraccion_p
    INCREMENT 1
    START 780
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_persona_extraccion_p_id_persona_extraccion_p
    OWNER TO usr_digitus;

COMMENT ON SEQUENCE public.seq_persona_extraccion_p_id_persona_extraccion_p
    IS 'Secuencia utilizada en la tabla tbl_persona_extraccion_p para el campo id_persona_extraccion_p.';

GRANT ALL ON SEQUENCE public.seq_persona_extraccion_p_id_persona_extraccion_p TO usr_digitus;

-------------------------------- Secuencia 55 ----------------------------------------------
-- Creación de secuencia
CREATE SEQUENCE public.seq_persona_extraccion_l_id_persona_extraccion_l
    INCREMENT 1
    START 780
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.seq_persona_extraccion_l_id_persona_extraccion_l
    OWNER TO usr_digitus;

COMMENT ON SEQUENCE public.seq_persona_extraccion_l_id_persona_extraccion_l
    IS 'Secuencia utilizada en la tabla tbl_persona_extraccion_l para el campo id_persona_extraccion_l.';

GRANT ALL ON SEQUENCE public.seq_persona_extraccion_l_id_persona_extraccion_l TO usr_digitus;
