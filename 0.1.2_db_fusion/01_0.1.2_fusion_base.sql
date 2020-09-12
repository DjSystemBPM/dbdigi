--Creación del usuario usr_fusion
CREATE ROLE usr_fusion WITH ENCRYPTED PASSWORD '$UsrFs10n$';

--Creaci�n de la base de datos db_fusion
CREATE DATABASE db_fusion
    WITH  OWNER = usr_fusion
	  ENCODING = 'UTF8'
          CONNECTION LIMIT = -1;
		  -- TABLESPACE = tsp_fusion;

COMMENT ON DATABASE db_fusion
    IS 'Es una base de datos transaccional que su objetivo es almacenar informaci�n que permita llevar un control preciso de las operaciones que se realizan para el proceso de fusi�n';

--Asiganci�n de permisos
GRANT ALL PRIVILEGES ON DATABASE "db_fusion" TO usr_fusion;
ALTER DATABASE db_fusion SET timezone TO 'Mexico/General';

REVOKE ALL PRIVILEGES  ON DATABASE "postgres" FROM usr_fusion;
REVOKE ALL PRIVILEGES  ON DATABASE "db_digitus" FROM usr_fusion;
REVOKE ALL PRIVILEGES  ON DATABASE "db_digitus_staging" FROM usr_fusion;
REVOKE ALL PRIVILEGES  ON DATABASE "db_mejorminucias" FROM usr_fusion;
