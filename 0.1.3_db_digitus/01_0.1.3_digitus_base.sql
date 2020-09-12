--Creación del usuario usr_digitus
CREATE ROLE usr_digitus WITH LOGIN PASSWORD '#Usr3s4ll02$';

--Creación de la base de datos db_digitus
CREATE DATABASE db_digitus
    WITH  OWNER = usr_digitus
	  ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;
	  --tablespace = tsp_digitus;


COMMENT ON DATABASE db_digitus
    IS 'Es una base de datos transaccional que su objetivo es almacenar información que permita llevar un control preciso de las operaciones que se realizan a través de un cliente biométrico y un motor biométrico';

--Asiganción de permisos
GRANT ALL ON DATABASE "db_digitus" TO usr_digitus;
ALTER DATABASE db_digitus SET timezone TO 'Mexico/General';

REVOKE ALL ON DATABASE "postgres" FROM usr_digitus;
