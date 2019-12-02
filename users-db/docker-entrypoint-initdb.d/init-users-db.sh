#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE TABLE public.users
	(
		id BIGSERIAL,
		first_name character varying(255),
		last_name character varying(255),
		company_id bigint,
		PRIMARY KEY (id)
	);

	ALTER TABLE public.users OWNER to "users-db";

	insert into users (first_name, last_name, company_id) values
		('jobin','augustine',1),('avinash','vallarapu',1),('fernando','camargos',3);

	insert into users (first_name, last_name, company_id) values
		('alex','maxwell',2),('andrew','bixel',2),('alice','meshwel',2);

	CREATE EXTENSION postgres_fdw;
EOSQL
