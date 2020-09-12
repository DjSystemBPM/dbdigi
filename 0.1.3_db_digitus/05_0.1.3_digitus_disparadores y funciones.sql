\c db_digitus;

-------------------------FUNCIONES Y DISPARADORES ------------------------------
-------------------------------- Disparador 01 ---------------------------------
-- FUNCTION: public.tgr_fecha_borrado()
-- DROP FUNCTION public.tgr_fecha_borrado();

CREATE FUNCTION public.tgr_fecha_borrado()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN
    NEW.fecha_borrado = now() WHERE NEW.fecha_borrado is not null;
    RETURN NEW;
END;

$BODY$;

ALTER FUNCTION public.tgr_fecha_borrado()
    OWNER TO usr_digitus;

	-------------------------------- Disparador 02 ---------------------------------
	-- FUNCTION: public.tgr_fecha_creacion()

-- DROP FUNCTION public.tgr_fecha_creacion();

CREATE FUNCTION public.tgr_fecha_creacion()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN
    NEW.fecha_creacion = now();
    RETURN NEW;
END;

$BODY$;

ALTER FUNCTION public.tgr_fecha_creacion()
    OWNER TO usr_digitus;

	-------------------------------- Disparador 03 ---------------------------------
-- FUNCTION: public.tgr_fecha_enrolamiento()

-- DROP FUNCTION public.tgr_fecha_enrolamiento();

CREATE FUNCTION public.tgr_fecha_enrolamiento()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN
    NEW.fecha_enrolamiento = now();
    RETURN NEW;
END;

$BODY$;

ALTER FUNCTION public.tgr_fecha_enrolamiento()
    OWNER TO usr_digitus;

	-------------------------------- Disparador 04 ---------------------------------
	-- FUNCTION: public.tgr_fecha_evento()

-- DROP FUNCTION public.tgr_fecha_evento();

CREATE FUNCTION public.tgr_fecha_evento()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN
    NEW.fecha_evento = now();
    RETURN NEW;
END;

$BODY$;

ALTER FUNCTION public.tgr_fecha_evento()
    OWNER TO usr_digitus;


		-------------------------------- Disparador 05 ---------------------------------
		-- FUNCTION: public.tgr_fecha_excepcion()

-- DROP FUNCTION public.tgr_fecha_excepcion();

CREATE FUNCTION public.tgr_fecha_excepcion()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN
    NEW.fecha_excepcion = now();
    RETURN NEW;
END;

$BODY$;

ALTER FUNCTION public.tgr_fecha_excepcion()
    OWNER TO usr_digitus;


			-------------------------------- Disparador 06 ---------------------------------
-- FUNCTION: public.tgr_fecha_final()

-- DROP FUNCTION public.tgr_fecha_final();

CREATE FUNCTION public.tgr_fecha_final()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN
    NEW.fecha_final = now() WHERE NEW.fecha_final is not null;
    RETURN NEW;
END;

$BODY$;

ALTER FUNCTION public.tgr_fecha_final()
    OWNER TO usr_digitus;


	-------------------------------- Disparador 07 ---------------------------------
-- FUNCTION: public.trg_calidad_extraccion_his()

-- DROP FUNCTION public.trg_calidad_extraccion_his();

CREATE FUNCTION public.trg_calidad_extraccion_his()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN
        IF (TG_OP = 'UPDATE') THEN
           INSERT INTO tbl_calidad_extraccion_his(id_calidad_extraccion,id_biometrico, valor, fecha_calidad, usuario, operacion)
           VALUES (old.id_calidad_extraccion, old.id_biometrico, old.valor, old.fecha_calidad, old.usuario, 'U');
		ELSE
		IF (TG_OP = 'INSERT') THEN
           INSERT INTO tbl_calidad_extraccion_his(id_calidad_extraccion,id_biometrico, valor, fecha_calidad, usuario, operacion)
           VALUES (new.id_calidad_extraccion, new.id_biometrico, new.valor, new.fecha_calidad, new.usuario, 'I');
		ELSE
		IF (TG_OP = 'DELETE') THEN
           INSERT INTO tbl_calidad_extraccion_his(id_calidad_extraccion,id_biometrico, valor, fecha_calidad, usuario, operacion)
           VALUES (old.id_calidad_extraccion, old.id_biometrico, old.valor, old.fecha_calidad, old.usuario, 'D');
	  END IF;
	  END IF;
      END IF;

      RETURN NEW;
END
$BODY$;

ALTER FUNCTION public.trg_calidad_extraccion_his()
    OWNER TO postgres;

GRANT EXECUTE ON FUNCTION public.trg_calidad_extraccion_his() TO usr_digitus;

GRANT EXECUTE ON FUNCTION public.trg_calidad_extraccion_his() TO postgres;

GRANT EXECUTE ON FUNCTION public.trg_calidad_extraccion_his() TO PUBLIC;



	-------------------------------- Disparador 08 ---------------------------------
-- FUNCTION: public.trg_deduplicacion()

-- DROP FUNCTION public.trg_deduplicacion();

CREATE FUNCTION public.trg_deduplicacion()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN

  NEW.fecha_fin_ddp = now();

  RETURN NEW;

END;

$BODY$;

ALTER FUNCTION public.trg_deduplicacion()
    OWNER TO usr_digitus;


	-------------------------------- Disparador 09 ---------------------------------
-- FUNCTION: public.trg_umbral_conf_his()

-- DROP FUNCTION public.trg_umbral_conf_his();

CREATE FUNCTION public.trg_umbral_conf_his()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$

BEGIN
        IF (TG_OP = 'UPDATE') THEN
           INSERT INTO tbl_umbral_conf_his(id_umbral_conf,id_motorbio, id_organizacion, id_biometrico, umbral_minimo, umbral_maximo, operacion, fecha_modificacion, usuario)
           VALUES (old.id_umbral_conf, old.id_motorbio, old.id_organizacion, old.id_biometrico, old.umbral_minimo, old.umbral_maximo, 'U', old.fecha_modificacion, old.usuario);
		ELSE
		IF (TG_OP = 'INSERT') THEN
           INSERT INTO tbl_umbral_conf_his(id_umbral_conf,id_motorbio, id_organizacion, id_biometrico, umbral_minimo, umbral_maximo, operacion, fecha_modificacion, usuario)
           VALUES (new.id_umbral_conf, new.id_motorbio, new.id_organizacion, new.id_biometrico, new.umbral_minimo, new.umbral_maximo, 'I', new.fecha_modificacion, new.usuario);
		ELSE
		IF (TG_OP = 'DELETE') THEN
           INSERT INTO tbl_umbral_conf_his(id_umbral_conf,id_motorbio, id_organizacion, id_biometrico, umbral_minimo, umbral_maximo, operacion, fecha_modificacion, usuario)
           VALUES (old.id_umbral_conf,old.id_motorbio, old.id_organizacion, old.id_biometrico, old.umbral_minimo, old.umbral_maximo, 'D', old.fecha_modificacion, old.usuario);
	  END IF;
	  END IF;
      END IF;

      RETURN NEW;
END
$BODY$;

ALTER FUNCTION public.trg_umbral_conf_his()
    OWNER TO postgres;

GRANT EXECUTE ON FUNCTION public.trg_umbral_conf_his() TO usr_digitus;

GRANT EXECUTE ON FUNCTION public.trg_umbral_conf_his() TO postgres;

GRANT EXECUTE ON FUNCTION public.trg_umbral_conf_his() TO PUBLIC;


	-------------------------------- Funcion 10 ---------------------------------
-- FUNCTION: public.fnc_alertas(character varying)

-- DROP FUNCTION public.fnc_alertas(character varying);

CREATE OR REPLACE FUNCTION public.fnc_alertas(
	p_id_persona character varying)
    RETURNS TABLE(id_alerta integer, id_persona uuid, tipo_alerta text, descripcion text, verificacion text, fecha_insercion timestamp without time zone, estatus_alerta text, usuario_alerta text)
    LANGUAGE 'sql'

    COST 100
    STABLE
    ROWS 1000
AS $BODY$


				select
					R1.id_alerta,
					R1.id_persona,
					R2.alerta as tipo_alerta,
					R1.descripcion,
					cast(R2.verificacion as text),
					R1.fecha_insercion,
					R3.estatus as estatus_alerta,
					R1.usuario_alerta
				FROM public.tbl_alerta as R1,
					 public.cat_tipo_alerta as R2,
				 	 public.cat_estatus_alerta as R3
				WHERE R1.id_persona::VARCHAR = p_id_persona
				AND R1.id_tipo_alerta= R2.id_tipo_alerta
				AND R1.id_estatus_alerta= R3.id_estatus_alerta;


$BODY$;

ALTER FUNCTION public.fnc_alertas(character varying)
    OWNER TO usr_digitus;

-------------------------------- Disparador 11 ---------------------------------
-- FUNCTION: public.fnc_alertas_identidad(character varying)

-- DROP FUNCTION public.fnc_alertas_identidad(character varying);

CREATE OR REPLACE FUNCTION public.fnc_alertas_identidad(
	p_id_persona character varying)
    RETURNS TABLE(id_alerta integer, id_persona uuid, tipo_alerta text, descripcion text, verificacion text, fecha_insercion timestamp without time zone, estatus_alerta text, usuario_alerta text)
    LANGUAGE 'sql'

    COST 100
    STABLE
    ROWS 1000
AS $BODY$


			SELECT
					R1.id_alerta,
					R1.id_persona,
					R2.alerta AS tipo_alerta,
					R1.descripcion,
					cast(R2.verificacion AS text),
					R1.fecha_insercion,
					R3.estatus AS estatus_alerta,
					R1.usuario_alerta
				FROM public.tbl_alerta R1
				 JOIN public.cat_tipo_alerta R2 ON
				 	 R1.id_tipo_alerta= R2.id_tipo_alerta
				 JOIN public.cat_estatus_alerta R3 ON
				 	R1.id_estatus_alerta= R3.id_estatus_alerta
			     JOIN public.tbl_persona_identidad R4 on
			     	R1.id_persona = R4.id_persona
				WHERE R1.id_estatus_alerta in (1,2)
				AND R4.id_registro_biometrico IN
					(SELECT tpi.id_registro_biometrico
						FROM tbl_persona_identidad tpi, tbl_persona_motor tpm
					    WHERE tpi.id_persona= tpm.id_persona
				    	AND tpm.id_persona_galeria::VARCHAR = p_id_persona )



$BODY$;

ALTER FUNCTION public.fnc_alertas_identidad(character varying)
    OWNER TO usr_digitus;


-------------------------------- Disparador 12 ---------------------------------
-- FUNCTION: public.fnc_alertas_identidad_transacciones(character varying)

-- DROP FUNCTION public.fnc_alertas_identidad_transacciones(character varying);

CREATE OR REPLACE FUNCTION public.fnc_alertas_identidad_transacciones(
	p_id_persona character varying)
    RETURNS TABLE(id_alerta integer, id_persona uuid, tipo_alerta text, descripcion text, verificacion text, fecha_insercion timestamp without time zone, estatus_alerta text, usuario_alerta text)
    LANGUAGE 'sql'

    COST 100
    STABLE
    ROWS 1000
AS $BODY$


				SELECT
					R1.id_alerta,
					R1.id_persona,
					R2.alerta AS tipo_alerta,
					R1.descripcion,
					cast(R2.verificacion AS text),
					R1.fecha_insercion,
					R3.estatus AS estatus_alerta,
					R1.usuario_alerta
				FROM public.tbl_alerta R1
				 JOIN public.cat_tipo_alerta R2 ON
				 	 R1.id_tipo_alerta= R2.id_tipo_alerta
				 JOIN public.cat_estatus_alerta R3 ON
				 	R1.id_estatus_alerta= R3.id_estatus_alerta
			     JOIN public.tbl_persona_identidad R4 on
			     	R1.id_persona = R4.id_persona
				WHERE R4.id_registro_biometrico IN
					(SELECT tpi.id_registro_biometrico
						FROM tbl_persona_identidad tpi
					    WHERE tpi.id_persona::VARCHAR = p_id_persona )



$BODY$;

ALTER FUNCTION public.fnc_alertas_identidad_transacciones(character varying)
    OWNER TO usr_digitus;


-------------------------------- Disparador 13 ---------------------------------
-- FUNCTION: public.fnc_biograficos_persona(character varying)

-- DROP FUNCTION public.fnc_biograficos_persona(character varying);

CREATE OR REPLACE FUNCTION public.fnc_biograficos_persona(
	p_id_persona character varying)
    RETURNS TABLE(id_atributo integer, campo text, valor text)
    LANGUAGE 'sql'

    COST 100
    STABLE
    ROWS 1000
AS $BODY$


			select cat.id_atributo ,cat.atributo_esp campo, pb.valor
			from tbl_persona_biografico pb, cat_atributo cat
			where cat.id_atributo= pb.id_atributo and pb.id_persona::VARCHAR = p_id_persona;


$BODY$;

ALTER FUNCTION public.fnc_biograficos_persona(character varying)
    OWNER TO postgres;


-------------------------------- Disparador 14 ---------------------------------
-- FUNCTION: public.fnc_candidatos_persona(character varying, integer)

-- DROP FUNCTION public.fnc_candidatos_persona(character varying, integer);

CREATE OR REPLACE FUNCTION public.fnc_candidatos_persona(
	p_id_persona character varying,
	p_id_secretaria integer)
    RETURNS TABLE(id_persona uuid, fecha_creacion timestamp with time zone, fecha_captura timestamp with time zone, fecha_final timestamp without time zone, id_estatus integer, estatus character varying, id_sitio integer, sitio character varying, id_secretaria integer, secretaria character varying)
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE
    ROWS 1000
AS $BODY$


DECLARE
    persona RECORD;

BEGIN
	--Todas las coincidencias de una persona dada

		FOR persona IN
				SELECT
					R1.id_persona,
					R1.fecha_creacion,
					R1.fecha_captura,
					R1.fecha_final,
					R2.id_estatus,
					R2.descripcion as estatus,
					R3.id_sitio,
					R3.descripcion as sitio,
					R4.id_secretaria,
					R4.secretaria
				FROM public.tbl_persona R1
				JOIN public.tbl_persona_identidad R5 ON
					R1.id_persona = R5.id_persona
				JOIN public.cat_estatus R2 ON
					R1.id_estatus = R2.id_estatus
				JOIN public.cat_sitio R3 ON
					R1.id_sitio = R3.id_sitio
				JOIN public.cat_secretaria R4 ON
					R3.id_secretaria = R4.id_secretaria
				WHERE R1.id_estatus <> 2
				AND R5.id_registro_biometrico in (select R6.id_registro_biometrico from tbl_persona_identidad R6 where R6.id_persona::VARCHAR = p_id_persona)
				AND R3.id_secretaria IN(SELECT tsp.id_secretaria_ver FROM tbl_secretaria_permiso tsp WHERE tsp.id_secretaria=p_id_secretaria AND tsp.permiso=true)
				ORDER BY R1.fecha_creacion ASC
		LOOP
			id_persona := persona.id_persona;
			fecha_creacion := persona.fecha_creacion;
			fecha_captura := persona.fecha_captura;
			fecha_final := persona.fecha_final;
			id_estatus := persona.id_estatus;
			estatus := persona.estatus;
			id_sitio := persona.id_sitio;
			sitio := persona.sitio;
			id_secretaria := persona.id_secretaria;
			secretaria := persona.secretaria;
			RETURN NEXT;
		END LOOP;
		RETURN;

END;

$BODY$;

ALTER FUNCTION public.fnc_candidatos_persona(character varying, integer)
    OWNER TO usr_digitus;


-------------------------------- Disparador 15 ---------------------------------
-- FUNCTION: public.fnc_coincidencias_detalle(integer)

-- DROP FUNCTION public.fnc_coincidencias_detalle(integer);

CREATE OR REPLACE FUNCTION public.fnc_coincidencias_detalle(
	p_id_coincidencia integer)
    RETURNS TABLE(id_candidato integer, id_candidato_detalle integer, puntaje_motor numeric, id_biometrico integer, tipo_biometrico character varying, id_estatus integer, estatus character varying, posicion integer, descripcion_esp character varying)
    LANGUAGE 'sql'

    COST 100
    STABLE
    ROWS 1000
AS $BODY$

		SELECT
			R1.id_candidato,
			R2.id_candidato_detalle,
			R2.puntaje_motor,
			R3.id_biometrico,
			R3.tipo_biometrico,
			R4.id_estatus,
			R4.descripcion AS estatus,
			R5.posicion,
			R5.descripcion_esp
		FROM public.tbl_candidato R1
		JOIN public.tbl_candidato_detalle R2 ON
			R1.id_candidato = R2.id_candidato
		JOIN public.cat_biometrico R3 ON
			R2.id_biometrico = R3.id_biometrico
		JOIN public.cat_estatus R4 ON
			R2.id_estatus_biometrico = R4.id_estatus
		JOIN public.cat_posicion R5 ON
			R2.id_posicion = R5.id_posicion
		WHERE R1.id_candidato = p_id_coincidencia
		ORDER BY R1.id_candidato, R3.id_biometrico, R5.id_posicion;


$BODY$;

ALTER FUNCTION public.fnc_coincidencias_detalle(integer)
    OWNER TO usr_digitus;


-------------------------------- Disparador 16 ---------------------------------
/*-- FUNCTION: public.fnc_coincidencias_persona(character varying)

-- DROP FUNCTION public.fnc_coincidencias_persona(character varying);

CREATE OR REPLACE FUNCTION public.fnc_coincidencias_persona(
	p_id_persona character varying)
    RETURNS TABLE(id_persona uuid, id_candidato integer, id_candidato_persona uuid, puntaje_fusion numeric, id_estatus integer, estatus character varying, biometricos text[])
    LANGUAGE 'sql'

    COST 100
    STABLE
    ROWS 1000
AS $BODY$

	SELECT
		R1.id_persona,
		R2.id_candidato,
		R2.id_candidato_persona,
		R2.puntaje_fusion,
		R3.id_estatus,
		R3.descripcion AS estatus,
		fnc_biograficos_persona(p_id_persona) as biometricos
		FROM public.tbl_persona R1
		JOIN public.tbl_candidato R2 ON
			R1.id_persona = R2.id_persona
		JOIN public.cat_estatus R3 ON
			R2.id_estatus_candidato = R3.id_estatus
		WHERE R1.id_persona::VARCHAR = p_id_persona
		ORDER BY R2.id_candidato;


$BODY$;

ALTER FUNCTION public.fnc_coincidencias_persona(character varying)
    OWNER TO usr_digitus;
*/

-------------------------------- Disparador 17 ---------------------------------
-- FUNCTION: public.fnc_errores_persona(character varying)

-- DROP FUNCTION public.fnc_errores_persona(character varying);

CREATE OR REPLACE FUNCTION public.fnc_errores_persona(
	p_id_persona character varying)
    RETURNS TABLE(id_excepcion integer, id_persona uuid, codigo character varying, descripcion character varying, fecha_excepcion timestamp with time zone)
    LANGUAGE 'sql'

    COST 100
    STABLE
    ROWS 1000
AS $BODY$

	SELECT
		R1.id_excepcion,
		R1.id_persona,
		--R2.id_codigo_excepcion,
		R2.codigo,
		R2.descripcion,
		R1.fecha_excepcion
	FROM public.tbl_excepcion R1
	JOIN public.cat_codigo_excepcion R2 ON
		R1.id_codigo_excepcion = R2.id_codigo_excepcion
	WHERE R1.id_persona::VARCHAR = p_id_persona
	ORDER BY R2.id_codigo_excepcion, R1.fecha_excepcion ASC;


$BODY$;

ALTER FUNCTION public.fnc_errores_persona(character varying)
    OWNER TO usr_digitus;


-------------------------------- Disparador 18 ---------------------------------
-- FUNCTION: public.fnc_estatus()

-- DROP FUNCTION public.fnc_estatus();

CREATE OR REPLACE FUNCTION public.fnc_estatus(
	)
    RETURNS TABLE(id_estatus integer, descripcion character varying)
    LANGUAGE 'sql'

    COST 100
    STABLE
    ROWS 1000
AS $BODY$

	SELECT
    	id_estatus,
    	descripcion
  	FROM public.cat_estatus
	ORDER BY id_estatus;


$BODY$;

ALTER FUNCTION public.fnc_estatus()
    OWNER TO usr_digitus;


-------------------------------- Disparador 19 ---------------------------------
-- FUNCTION: public.fnc_latencia_promedio(integer, integer, timestamp without time zone, timestamp without time zone)

-- DROP FUNCTION public.fnc_latencia_promedio(integer, integer, timestamp without time zone, timestamp without time zone);

CREATE OR REPLACE FUNCTION public.fnc_latencia_promedio(
	p_id_secretaria integer,
	p_id_sitio integer,
	p_fecha_inicio timestamp without time zone,
	p_fecha_fin timestamp without time zone)
    RETURNS TABLE(campo text, valor text)
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE
    ROWS 1000
AS $BODY$



	BEGIN
		RETURN QUERY

			select
				'latencia' as campo ,
				COALESCE(trim(to_char(avg(EXTRACT(EPOCH FROM (R1.fecha_final - R1.fecha_creacion)) ), '99999999999999999D99')), '') as valor
			from
				 public.tbl_persona R1
			join public.cat_sitio R3 on R1.id_sitio = R3.id_sitio
			join public.cat_secretaria R4 on R3.id_secretaria = R4.id_secretaria
			where R1.fecha_creacion >= p_fecha_inicio and R1.fecha_final <= p_fecha_fin
			 and R3.id_secretaria = p_id_secretaria
			 and R3.id_sitio = case when p_id_sitio > 0 then p_id_sitio else R3.id_sitio end;

	END;


$BODY$;

ALTER FUNCTION public.fnc_latencia_promedio(integer, integer, timestamp without time zone, timestamp without time zone)
    OWNER TO usr_digitus;


-------------------------------- Disparador 20 ---------------------------------
-- FUNCTION: public.fnc_persona(character varying)

-- DROP FUNCTION public.fnc_persona(character varying);

CREATE OR REPLACE FUNCTION public.fnc_persona(
	p_id_persona character varying)
    RETURNS TABLE(id_persona uuid, fecha_creacion timestamp with time zone, fecha_captura timestamp with time zone, fecha_final timestamp without time zone, id_estatus integer, estatus character varying, id_sitio integer, sitio character varying, id_secretaria integer, secretaria character varying, biometricos text[])
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE
    ROWS 1000
AS $BODY$

BEGIN
	RETURN QUERY
	SELECT
		R1.id_persona,
		R1.fecha_creacion,
		R1.fecha_captura,
		R1.fecha_final,
		R2.id_estatus,
		R2.descripcion as estatus,
		R3.id_sitio,
		R3.descripcion as sitio,
		R4.id_secretaria,
		R4.secretaria,
		fnc_biograficos_persona(p_id_persona) as biometricos
	FROM public.tbl_persona R1
	JOIN public.cat_estatus R2 ON
		R1.id_estatus = R2.id_estatus
	JOIN public.cat_sitio R3 ON
		R1.id_sitio = R3.id_sitio
	JOIN public.cat_secretaria R4 ON
		R3.id_secretaria = R4.id_secretaria
	WHERE R1.id_persona::VARCHAR = p_id_persona;
END;

$BODY$;

ALTER FUNCTION public.fnc_persona(character varying)
    OWNER TO usr_digitus;


-------------------------------- Disparador 21 ---------------------------------
-- FUNCTION: public.fnc_personas_con_fechas(integer, integer, integer, timestamp without time zone, timestamp without time zone, integer, integer)

-- DROP FUNCTION public.fnc_personas_con_fechas(integer, integer, integer, timestamp without time zone, timestamp without time zone, integer, integer);

CREATE OR REPLACE FUNCTION public.fnc_personas_con_fechas(
	p_id_secretaria integer,
	p_id_sitio integer,
	p_id_estatus integer,
	p_fecha_inicio timestamp without time zone,
	p_fecha_fin timestamp without time zone,
	p_offset integer,
	p_limit integer)
    RETURNS TABLE(id_persona uuid, fecha_creacion timestamp with time zone, fecha_captura timestamp with time zone, fecha_final timestamp without time zone, id_estatus integer, estatus character varying, id_sitio integer, sitio character varying, id_secretaria integer, secretaria character varying)
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE
    ROWS 1000
AS $BODY$



DECLARE
    persona RECORD;

BEGIN
	--Todas las personas de un secretaria, por rango de fechas. Incluye registros por pagina y número de pagina.

		FOR persona IN
				SELECT
					R1.id_persona,
					R1.fecha_creacion,
					R1.fecha_captura,
					R1.fecha_final,
					R2.id_estatus,
					R2.descripcion as estatus,
					R3.id_sitio,
					R3.descripcion as sitio,
					R4.id_secretaria,
					R4.secretaria
				FROM public.tbl_persona R1
				JOIN public.cat_estatus R2 ON
					R1.id_estatus = R2.id_estatus
				JOIN public.cat_sitio R3 ON
					R1.id_sitio = R3.id_sitio
				JOIN public.cat_secretaria R4 ON
					R3.id_secretaria = R4.id_secretaria
				WHERE (R1.fecha_creacion  BETWEEN  p_fecha_inicio AND  p_fecha_fin)
				AND R1.id_estatus = case when p_id_estatus > 0 then p_id_estatus else R1.id_estatus end
				AND R1.id_estatus <> 2
			    AND R1.tipo_transaccion <> 'IMP'
				AND R3.id_sitio = case when p_id_sitio > 0 then p_id_sitio else R3.id_sitio end
				AND R3.id_secretaria =  p_id_secretaria
				ORDER BY R1.fecha_creacion DESC
				LIMIT p_limit
				OFFSET p_offset
		LOOP
			id_persona := persona.id_persona;
			fecha_creacion := persona.fecha_creacion;
			fecha_captura := persona.fecha_captura;
			fecha_final := persona.fecha_final;
			id_estatus := persona.id_estatus;
			estatus := persona.estatus;
			id_sitio := persona.id_sitio;
			sitio := persona.sitio;
			id_secretaria := persona.id_secretaria;
			secretaria := persona.secretaria;
			RETURN NEXT;
		END LOOP;
		RETURN;

END;


$BODY$;

ALTER FUNCTION public.fnc_personas_con_fechas(integer, integer, integer, timestamp without time zone, timestamp without time zone, integer, integer)
    OWNER TO usr_digitus;


-------------------------------- Disparador 22 ---------------------------------
-- FUNCTION: public.fnc_personas_sin_fechas(integer, integer, integer, integer, integer)

-- DROP FUNCTION public.fnc_personas_sin_fechas(integer, integer, integer, integer, integer);

CREATE OR REPLACE FUNCTION public.fnc_personas_sin_fechas(
	p_id_secretaria integer,
	p_id_sitio integer,
	p_id_estatus integer,
	p_offset integer,
	p_limit integer)
    RETURNS TABLE(id_persona uuid, fecha_creacion timestamp with time zone, fecha_captura timestamp with time zone, fecha_final timestamp without time zone, id_estatus integer, estatus character varying, id_sitio integer, sitio character varying, id_secretaria integer, secretaria character varying)
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE
    ROWS 1000
AS $BODY$



DECLARE
    persona RECORD;

BEGIN
	--Todas las personas de un secretaria, por rango de fechas. Incluye registros por pagina y número de pagina.

		FOR persona IN
				SELECT
					R1.id_persona,
					R1.fecha_creacion,
					R1.fecha_captura,
					R1.fecha_final,
					R2.id_estatus,
					R2.descripcion as estatus,
					R3.id_sitio,
					R3.descripcion as sitio,
					R4.id_secretaria,
					R4.secretaria
				FROM public.tbl_persona R1
				JOIN public.cat_estatus R2 ON
					R1.id_estatus = R2.id_estatus
				JOIN public.cat_sitio R3 ON
					R1.id_sitio = R3.id_sitio
				JOIN public.cat_secretaria R4 ON
					R3.id_secretaria = R4.id_secretaria
				WHERE R1.id_estatus = case when p_id_estatus > 0 then p_id_estatus else R1.id_estatus end
				AND R1.id_estatus <> 2
			    AND R1.tipo_transaccion <> 'IMP'
				AND R3.id_sitio = case when p_id_sitio > 0 then p_id_sitio else R3.id_sitio end
				AND R3.id_secretaria =  p_id_secretaria
				ORDER BY R1.fecha_creacion DESC
				LIMIT p_limit
				OFFSET p_offset
		LOOP
			id_persona := persona.id_persona;
			fecha_creacion := persona.fecha_creacion;
			fecha_captura := persona.fecha_captura;
			fecha_final := persona.fecha_final;
			id_estatus := persona.id_estatus;
			estatus := persona.estatus;
			id_sitio := persona.id_sitio;
			sitio := persona.sitio;
			id_secretaria := persona.id_secretaria;
			secretaria := persona.secretaria;
			RETURN NEXT;
		END LOOP;
		RETURN;

END;


$BODY$;

ALTER FUNCTION public.fnc_personas_sin_fechas(integer, integer, integer, integer, integer)
    OWNER TO usr_digitus;


-------------------------------- Disparador 23 ---------------------------------
-- FUNCTION: public.fnc_secretaria(integer)

-- DROP FUNCTION public.fnc_secretaria(integer);

CREATE OR REPLACE FUNCTION public.fnc_secretaria(
	p_id_secretaria integer)
    RETURNS TABLE(id_secretaria integer, secretaria character varying, descripcion character varying)
    LANGUAGE 'sql'

    COST 100
    STABLE
    ROWS 1000
AS $BODY$

	SELECT
    	id_secretaria,
    	secretaria,
		descripcion
  	FROM public.cat_secretaria
	WHERE id_secretaria = p_id_secretaria;


$BODY$;

ALTER FUNCTION public.fnc_secretaria(integer)
    OWNER TO usr_digitus;


-------------------------------- Disparador 24 ---------------------------------
-- FUNCTION: public.fnc_secretaria_externa_permisos(integer, character varying)

-- DROP FUNCTION public.fnc_secretaria_externa_permisos(integer, character varying);

CREATE OR REPLACE FUNCTION public.fnc_secretaria_externa_permisos(
	p_id_secretaria integer,
	p_id_persona character varying)
    RETURNS TABLE(id_persona_externa integer, id_transaccion_externa character, id_persona uuid, coincidencia boolean, comentarios character varying, id_encuentro character, id_identidad character, descripcion_identidad character, codigo_lista_verificacion character, fecha_inicio timestamp without time zone, fecha_fin timestamp without time zone)
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE
    ROWS 1000
AS $BODY$

--DECLARE cnt INTEGER;

	BEGIN

		  --SELECT count(id_secretaria) INTO cnt FROM tbl_secretaria_permiso WHERE id_secretaria=p_id_secretaria AND id_secretaria_ver IN
						--	(SELECT id_secretaria FROM cat_secretaria WHERE dependencia_ext=true) AND permiso=true;

			--IF cnt>0 then
				RETURN QUERY
					SELECT
				    	pe.id_persona_externa,
				    	pe.id_transaccion_externa,
						pe.id_persona,
						pe.coincidencia,
						pe.comentarios,
						pe.id_encuentro,
						pe.id_identidad,
						pe.descripcion_identidad,
						pe.codigo_lista_verificacion,
						pe.fecha_inicio,
						pe.fecha_fin
				  	FROM public.tbl_persona_externa pe
					WHERE pe.id_persona::VARCHAR = p_id_persona;
				--RETURN;
			--END IF;
	 END;

$BODY$;

ALTER FUNCTION public.fnc_secretaria_externa_permisos(integer, character varying)
    OWNER TO usr_digitus;


-------------------------------- Disparador 25 ---------------------------------
-- FUNCTION: public.fnc_secretarias()

-- DROP FUNCTION public.fnc_secretarias();

CREATE OR REPLACE FUNCTION public.fnc_secretarias(
	)
    RETURNS TABLE(id_secretaria integer, secretaria character varying, descripcion character varying, dependencia_ext boolean)
    LANGUAGE 'sql'

    COST 100
    STABLE
    ROWS 1000
AS $BODY$

	SELECT
    	id_secretaria,
    	secretaria,
		descripcion,
		dependencia_ext
  	FROM public.cat_secretaria
	ORDER BY id_secretaria;


$BODY$;

ALTER FUNCTION public.fnc_secretarias()
    OWNER TO usr_digitus;


-------------------------------- Disparador 26 ---------------------------------
-- FUNCTION: public.fnc_sitios_secretaria(integer)

-- DROP FUNCTION public.fnc_sitios_secretaria(integer);

CREATE OR REPLACE FUNCTION public.fnc_sitios_secretaria(
	p_id_secretaria integer)
    RETURNS TABLE(id_sitio integer, sitio character varying, descripcion character varying, id_secretaria integer, secretaria character varying)
    LANGUAGE 'sql'

    COST 100
    STABLE
    ROWS 1000
AS $BODY$

	SELECT
		R1.id_sitio,
		R1.sitio,
		R1.descripcion,
		R2.id_secretaria,
		R2.secretaria
	FROM public.cat_sitio R1
	JOIN public.cat_secretaria R2 ON
		R1.id_secretaria = R2.id_secretaria
	WHERE R2.id_secretaria=p_id_secretaria
	ORDER BY R1.id_sitio;


$BODY$;

ALTER FUNCTION public.fnc_sitios_secretaria(integer)
    OWNER TO usr_digitus;


-------------------------------- Disparador 27 ---------------------------------
-- FUNCTION: public.fnc_txtotal_con_fechas(integer, integer, integer, integer, integer, timestamp without time zone, timestamp without time zone)

-- DROP FUNCTION public.fnc_txtotal_con_fechas(integer, integer, integer, integer, integer, timestamp without time zone, timestamp without time zone);

CREATE OR REPLACE FUNCTION public.fnc_txtotal_con_fechas(
	p_id_secretaria integer,
	p_id_sitio integer,
	p_id_estatus integer,
	p_id_nacionalidad integer,
	p_id_estado integer,
	p_fecha_inicio timestamp without time zone,
	p_fecha_fin timestamp without time zone)
    RETURNS TABLE(valor text, total integer)
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE
    ROWS 1000
AS $BODY$


	DECLARE
		registro RECORD;
	BEGIN
	IF p_id_estado = -1 THEN
		FOR registro IN
			select
				count(r2.id_estatus) as total ,
				r2.descripcion as valor
			from
				 public.tbl_persona R1
			join public.cat_estatus R2 on R1.id_estatus = R2.id_estatus
			join public.cat_sitio R3 on R1.id_sitio = R3.id_sitio
			join public.cat_secretaria R4 on R3.id_secretaria = R4.id_secretaria
			where    R1.id_estatus = case when p_id_estatus > 0 then p_id_estatus else R1.id_estatus end
				 and R1.id_estatus <> 2
			 	 and R1.tipo_transaccion <> 'IMP'
				 and R1.fecha_creacion >= p_fecha_inicio and R1.fecha_creacion <= p_fecha_fin
				 and R3.id_secretaria = p_id_secretaria and R3.id_sitio = case when p_id_sitio > 0 then p_id_sitio else R3.id_sitio end
			group by r2.id_estatus
		loop
			total := registro.total;
			valor := registro.valor;
		return next;
		end loop;
	END IF;
		IF p_id_estado = 1 THEN
		FOR registro IN
			select
				count(R5.entidad) as total ,
				R5.iso_2 as valor
			from public.tbl_persona R1
				join public.tbl_persona_biografico R2 on
					R1.id_persona = R2.id_persona
				join public.cat_sitio R3 on
					R1.id_sitio = R3.id_sitio
				join public.cat_secretaria R4 on
					R3.id_secretaria = R4.id_secretaria
				join public.cat_entidad R5 on
					R2.valor = R5.entidad
			where
				R1.id_estatus = case when p_id_estatus > 0 then p_id_estatus else R1.id_estatus end
				and R1.fecha_creacion >= p_fecha_inicio and R1.fecha_creacion <= p_fecha_fin
			    and R1.tipo_transaccion <> 'IMP'
				--and R3.id_secretaria = 1
				and R3.id_secretaria = p_id_secretaria and R3.id_sitio = case when p_id_sitio > 0 then p_id_sitio else R3.id_sitio end
				--and	R2.id_atributo = 34
			group by R5.entidad, R5.iso_2
		loop
			total := registro.total;
			valor := registro.valor;
		return next;
		end loop;
	END IF;

END;


$BODY$;

ALTER FUNCTION public.fnc_txtotal_con_fechas(integer, integer, integer, integer, integer, timestamp without time zone, timestamp without time zone)
    OWNER TO usr_digitus;


-------------------------------- Disparador 28 ---------------------------------
-- FUNCTION: public.fnc_txtotal_sin_fechas(integer, integer, integer, integer, integer)

-- DROP FUNCTION public.fnc_txtotal_sin_fechas(integer, integer, integer, integer, integer);

CREATE OR REPLACE FUNCTION public.fnc_txtotal_sin_fechas(
	p_id_secretaria integer,
	p_id_sitio integer,
	p_id_estatus integer,
	p_id_nacionalidad integer,
	p_id_estado integer)
    RETURNS TABLE(valor text, total integer)
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE
    ROWS 1000
AS $BODY$

	DECLARE
		registro RECORD;
	BEGIN
	IF p_id_estado = -1 THEN
		FOR registro IN
			select
				count(r2.id_estatus) as total ,
				r2.descripcion as valor
			from
				 public.tbl_persona R1
			join public.cat_estatus R2 on R1.id_estatus = R2.id_estatus
			join public.cat_sitio R3 on R1.id_sitio = R3.id_sitio
			join public.cat_secretaria R4 on R3.id_secretaria = R4.id_secretaria
			where    R1.id_estatus = case when p_id_estatus > 0 then p_id_estatus else R1.id_estatus end
				 and R1.id_estatus <> 2
			 	 and R1.tipo_transaccion <> 'IMP'
				 and R3.id_secretaria = p_id_secretaria and R3.id_sitio = case when p_id_sitio > 0 then p_id_sitio else R3.id_sitio end
			group by r2.id_estatus
		loop
			total := registro.total;
			valor := registro.valor;
		return next;
		end loop;
	END IF;
		IF p_id_estado = 1 THEN
		FOR registro IN
			select
				count(R5.entidad) as total ,
				R5.iso_2 as valor
			from public.tbl_persona R1
				join public.tbl_persona_biografico R2 on
					R1.id_persona = R2.id_persona
				join public.cat_sitio R3 on
					R1.id_sitio = R3.id_sitio
				join public.cat_secretaria R4 on
					R3.id_secretaria = R4.id_secretaria
				join public.cat_entidad R5 on
					R2.valor = R5.entidad
			where
				R1.id_estatus = case when p_id_estatus > 0 then p_id_estatus else R1.id_estatus end
			    and R1.tipo_transaccion <> 'IMP'
				--and R3.id_secretaria = 1
				and R3.id_secretaria = p_id_secretaria and R3.id_sitio = case when p_id_sitio > 0 then p_id_sitio else R3.id_sitio end
				--and	R2.id_atributo = 34
			group by R5.entidad, R5.iso_2
		loop
			total := registro.total;
			valor := registro.valor;
		return next;
		end loop;
	END IF;

END;

$BODY$;

ALTER FUNCTION public.fnc_txtotal_sin_fechas(integer, integer, integer, integer, integer)
    OWNER TO usr_digitus;

---------------------------------------------------------------------------------
-- Trigger: trg_calidad_extraccion

-- DROP TRIGGER trg_calidad_extraccion ON public.cat_calidad_extraccion;

CREATE TRIGGER trg_calidad_extraccion
    AFTER INSERT OR DELETE OR UPDATE
    ON public.cat_calidad_extraccion
    FOR EACH ROW
    EXECUTE PROCEDURE public.trg_calidad_extraccion_his();
-------------------------------------------------------------------------------
-- Trigger: trg_umbral_conf

-- DROP TRIGGER trg_umbral_conf ON public.cat_umbral_conf;

CREATE TRIGGER trg_umbral_conf
    AFTER INSERT OR DELETE OR UPDATE
    ON public.cat_umbral_conf
    FOR EACH ROW
    EXECUTE PROCEDURE public.trg_umbral_conf_his();
----------------------------------------------------------------------------------
-- Trigger: tgr_fecha_creacion

-- DROP TRIGGER tgr_fecha_creacion ON public.tbl_persona;

CREATE TRIGGER tgr_fecha_creacion
    BEFORE INSERT
    ON public.tbl_persona
    FOR EACH ROW
    EXECUTE PROCEDURE public.tgr_fecha_creacion();

-- Trigger: tgr_fecha_final

-- DROP TRIGGER tgr_fecha_final ON public.tbl_persona;

CREATE TRIGGER tgr_fecha_final
    BEFORE UPDATE
    ON public.tbl_persona
    FOR EACH ROW
    EXECUTE PROCEDURE public.tgr_fecha_final();
---------------------------------------------------------------------------------------

-- Trigger: trg_deduplicacion

-- DROP TRIGGER trg_deduplicacion ON public.tbl_deduplicacion;

CREATE TRIGGER trg_deduplicacion
    BEFORE UPDATE OF id_estatus_deduplicacion
    ON public.tbl_deduplicacion
    FOR EACH ROW
    EXECUTE PROCEDURE public.trg_deduplicacion();
-----------------------------------------------------------------------------------------------
-- Trigger: tgr_fecha_excepcion

-- DROP TRIGGER tgr_fecha_excepcion ON public.tbl_excepcion;

CREATE TRIGGER tgr_fecha_excepcion
    BEFORE INSERT
    ON public.tbl_excepcion
    FOR EACH ROW
    EXECUTE PROCEDURE public.tgr_fecha_excepcion();
------------------------------------------------------------------------------------------------

-- Trigger: tgr_fecha_enrolamiento

-- DROP TRIGGER tgr_fecha_enrolamiento ON public.tbl_persona_motor;

CREATE TRIGGER tgr_fecha_enrolamiento
    BEFORE INSERT
    ON public.tbl_persona_motor
    FOR EACH ROW
    EXECUTE PROCEDURE public.tgr_fecha_enrolamiento();

-- Trigger: tgr_fecha_persona_motor

-- DROP TRIGGER tgr_fecha_persona_motor ON public.tbl_persona_motor;

CREATE TRIGGER tgr_fecha_persona_motor
    BEFORE UPDATE
    ON public.tbl_persona_motor
    FOR EACH ROW
    EXECUTE PROCEDURE public.tgr_fecha_borrado();
