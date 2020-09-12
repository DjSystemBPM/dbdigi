\c db_fusion;

CREATE OR REPLACE FUNCTION trg_factor_calculo_his()
  RETURNS trigger AS
$BODY$
BEGIN
        IF (TG_OP = 'UPDATE') THEN
           INSERT INTO trg_factor_calculo_his(id_factor_calculo,id_factor, id_biometrico, valor, usuario, operacion, fecha_modificacion)
           VALUES (old.id_factor_calculo, old.id_factor, old.id_biometrico, old.valor, old.usuario,'A', old.fecha_modificacion);
		ELSE
		IF (TG_OP = 'INSERT') THEN
           INSERT INTO trg_factor_calculo_his(id_factor_calculo,id_factor, id_biometrico, valor, usuario, operacion, fecha_modificacion)
           VALUES (new.id_factor_calculo, new.id_factor, new.id_biometrico, new.valor, new.usuario,'I', new.fecha_modificacion);
		ELSE
		IF (TG_OP = 'DELETE') THEN
           INSERT INTO trg_factor_calculo_his(id_factor_calculo,id_factor, id_biometrico, valor, usuario, operacion, fecha_modificacion)
           VALUES (old.id_factor_calculo, old.id_factor, old.id_biometrico, old.valor, old.usuario,'B', old.fecha_modificacion);
	  END IF;
	  END IF;
      END IF;

      RETURN NEW;
END$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

---------------------------------------------------------------------
CREATE TRIGGER trg_factor_calculo
  AFTER UPDATE OR INSERT OR DELETE
  ON cat_factor_calculo
  FOR EACH ROW
  EXECUTE PROCEDURE trg_factor_calculo_his();
------------------------------------------------------------------------------------
  CREATE OR REPLACE FUNCTION trg_umbral_conf_his()
  RETURNS trigger AS
$BODY$
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
END$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

---------------------------------------------------------------------
CREATE TRIGGER trg_umbral_conf
  AFTER UPDATE OR INSERT OR DELETE
  ON cat_umbral_conf
  FOR EACH ROW
  EXECUTE PROCEDURE trg_umbral_conf_his();
