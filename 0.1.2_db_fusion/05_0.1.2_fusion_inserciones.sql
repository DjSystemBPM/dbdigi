\c db_fusion;

--Inserci�n de registros en la tabla cat_organizacion
INSERT INTO public.cat_organizacion(organizacion, unidad, subunidad) VALUES ('INAMI','central','principal');
INSERT INTO public.cat_organizacion(organizacion, unidad, subunidad) VALUES ('PGJ','norte','seccion 3');
INSERT INTO public.cat_organizacion(organizacion, unidad, subunidad) VALUES ('PFP','oriente','plaza 2');


--Inserci�n de registros en la tabla de cat_estatus
INSERT INTO public.cat_estatus(descripcion) VALUES ('No procesado');
INSERT INTO public.cat_estatus(descripcion) VALUES ('Enviado');
INSERT INTO public.cat_estatus(descripcion) VALUES ('Hit');
INSERT INTO public.cat_estatus(descripcion) VALUES ('No Hit');
INSERT INTO public.cat_estatus(descripcion) VALUES ('Error');
INSERT INTO public.cat_estatus(descripcion) VALUES ('Tiempo excedido');
INSERT INTO public.cat_estatus(descripcion) VALUES ('Gray');


--Inserci�n de registros en la tabla cat_biometrico
INSERT INTO public.cat_biometrico(tipo_biometrico) VALUES ('Huellas');
INSERT INTO public.cat_biometrico(tipo_biometrico) VALUES ('Iris');
INSERT INTO public.cat_biometrico(tipo_biometrico) VALUES ('Rostro');
INSERT INTO public.cat_biometrico(tipo_biometrico) VALUES ('Fusi�n');


--Inserci�n de registros en la tabla cat_posicion
INSERT INTO public.cat_posicion(id_posicion, posicion, descripcion_esp, descripcion_ing) VALUES (1,1, 'Pulgar derecho (rolado)', 'ROLL_RTHUMB');
INSERT INTO public.cat_posicion(id_posicion, posicion, descripcion_esp, descripcion_ing) VALUES (2,2,'Indice derecho (rolado)', 'ROLL_RINDEX');
INSERT INTO public.cat_posicion(id_posicion, posicion, descripcion_esp, descripcion_ing) VALUES (3,3, 'Medio derecho (rolado)', 'ROLL_RMIDDLE');
INSERT INTO public.cat_posicion(id_posicion, posicion, descripcion_esp, descripcion_ing) VALUES (4,4,'Anular derecho (rolado)','ROLL_RRING');
INSERT INTO public.cat_posicion(id_posicion, posicion, descripcion_esp, descripcion_ing) VALUES (5,5, 'Me�ique derecho (rolado)', 'ROLL_RLITTLE');
INSERT INTO public.cat_posicion(id_posicion, posicion, descripcion_esp, descripcion_ing) VALUES (6,6, 'Pulgar izquierdo (rolado)','ROLL_LTHUMB');
INSERT INTO public.cat_posicion(id_posicion, posicion, descripcion_esp, descripcion_ing) VALUES (7,7, 'Indice izquierdo (rolado)','ROLL_LINDEX');
INSERT INTO public.cat_posicion(id_posicion, posicion, descripcion_esp, descripcion_ing) VALUES (8,8, 'Medio izquierdo (rolado)','ROLL_LMIDDLE');
INSERT INTO public.cat_posicion(id_posicion, posicion, descripcion_esp, descripcion_ing) VALUES (9,9, 'Anular izquierdo (rolado)','ROLL_LRING');
INSERT INTO public.cat_posicion(id_posicion, posicion, descripcion_esp, descripcion_ing) VALUES (10,10, 'Me�ique izquierdo (rolado)','ROLL_LLITTLE');
INSERT INTO public.cat_posicion(id_posicion, posicion, descripcion_esp, descripcion_ing) VALUES (11,11, 'Pulgar derecho (flat)','SLAP_RTHUMB');
INSERT INTO public.cat_posicion(id_posicion, posicion, descripcion_esp, descripcion_ing) VALUES (12,12, 'Pulgar izquierdo (flat)','SLAP_LTHUMB');
INSERT INTO public.cat_posicion(id_posicion, posicion, descripcion_esp, descripcion_ing) VALUES (13,13, '4 dedos derechos (flat)','SLAP_RFOUR');
INSERT INTO public.cat_posicion(id_posicion, posicion, descripcion_esp, descripcion_ing) VALUES (14,14, '4 dedos izquierdos (flat)','SLAP_LFOUR');
INSERT INTO public.cat_posicion(id_posicion, posicion, descripcion_esp, descripcion_ing) VALUES (15,15, '2 pulgares juntos (flat)','SLAP_THUMBS');
INSERT INTO public.cat_posicion(id_posicion, posicion, descripcion_esp, descripcion_ing) VALUES (16,16, 'Iris derecho','RIGHT_IRIS');
INSERT INTO public.cat_posicion(id_posicion, posicion, descripcion_esp, descripcion_ing) VALUES (17,17, 'Iris izquierdo','LEFT_IRIS');
INSERT INTO public.cat_posicion(id_posicion, posicion, descripcion_esp, descripcion_ing) VALUES (18,18, 'Rostro','FRONTAL_FACE');
INSERT INTO public.cat_posicion(id_posicion, posicion, descripcion_esp, descripcion_ing) VALUES (19,19, 'Indice derecho (plano)','SLAP_RIGHT_INDEX');
INSERT INTO public.cat_posicion(id_posicion, posicion, descripcion_esp, descripcion_ing) VALUES (20,20, 'Medio derecho (plano)','SLAP_RIGHT_MIDDLE');
INSERT INTO public.cat_posicion(id_posicion, posicion, descripcion_esp, descripcion_ing) VALUES (21,21, 'Anular derecho (plano)','SLAP_RIGHT_RING');
INSERT INTO public.cat_posicion(id_posicion, posicion, descripcion_esp, descripcion_ing) VALUES (22,22, 'Me�ique derecho (plano)','SLAP_RIGHT_LITTLE');
INSERT INTO public.cat_posicion(id_posicion, posicion, descripcion_esp, descripcion_ing) VALUES (23,23, 'Indice izquierdo (plano)','SLAP_LEFT_INDEX');
INSERT INTO public.cat_posicion(id_posicion, posicion, descripcion_esp, descripcion_ing) VALUES (24,24, 'Medio izquierdo (plano)','SLAP_LEFT_MIDDLE');
INSERT INTO public.cat_posicion(id_posicion, posicion, descripcion_esp, descripcion_ing) VALUES (25,25, 'Anular izquierdo (plano)','SLAP_LEFT_RING');
INSERT INTO public.cat_posicion(id_posicion, posicion, descripcion_esp, descripcion_ing) VALUES (26,26, 'Me�ique izquierdo (plano)','SLAP_LEFT_LITTLE');


--Inserci�n de registros en la tabla cat_motorbio
INSERT INTO public.cat_motorbio(motor, descripcion) VALUES ('NEC', 'NEC proporciona soluciones IT');
INSERT INTO public.cat_motorbio(motor, descripcion) VALUES ('IWS', 'IWS Biometric Engine');


--Inserci�n de registros en la tabla cat_umbral_conf
INSERT INTO public.cat_umbral_conf(id_motorbio, id_organizacion, id_biometrico, umbral_minimo, umbral_maximo, fecha_modificacion, usuario)
	VALUES (1, 1, 1, 6500, 7500,  current_date,'usr_fusion');
INSERT INTO public.cat_umbral_conf(id_motorbio, id_organizacion, id_biometrico, umbral_minimo, umbral_maximo, fecha_modificacion, usuario)
	VALUES (1, 1, 2, 6500, 7500,  current_date,'usr_fusion');
INSERT INTO public.cat_umbral_conf(id_motorbio, id_organizacion, id_biometrico, umbral_minimo, umbral_maximo, fecha_modificacion, usuario)
	VALUES (1, 1, 3, 6500, 7500,  current_date,'usr_fusion');


--Inserci�n de registros en la tabla cat_factor
INSERT INTO public.cat_factor(factor, descripcion) VALUES ('factorOne','Factor UNO para el calculo de fusion');
INSERT INTO public.cat_factor(factor, descripcion) VALUES ('factorTwo','Factor DOS para el calculo de fusion');

--Inserci�n de registros en la tabla cat_algoritmo
INSERT INTO cat_algoritmo (id_algoritmo,version_algoritmo,formula,fecha_inicio,fecha_fin) VALUES
(1,'v1.0','n (x) = .5 (tanh (1.8 ((x -  �) / sx))+1)','2019-08-10 11:03:43.474','2019-08-10 11:03:43.474')
,(2,'v3','n (x) = .5 (tanh (1.8 ((x -  �) / sx))+1)','2019-11-06 12:20:41.870','2019-11-06 12:20:41.870')
,(3,'v1','n (x) = .05 (tanh (1.8 ((x -  �) / sx))+1)','2019-12-17 16:43:16.748','2019-12-17 16:43:16.748')
;
