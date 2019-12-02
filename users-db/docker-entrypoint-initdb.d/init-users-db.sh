#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    -- setup users db samples
	
	CREATE TABLE public.users
	(
		id bigint,
		first_name character varying(255),
		last_name character varying(255),
		PRIMARY KEY (id)
	);

	ALTER TABLE public.users OWNER to "users-db";
	
	insert into users values (1,'jobin','augustine'),(2,'avinash','vallarapu'),(3,'fernando','camargos');
	
	CREATE EXTENSION postgres_fdw;
	CREATE USER fdw_user WITH ENCRYPTED PASSWORD 'secret';
	GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE employee TO fdw_user;
EOSQL