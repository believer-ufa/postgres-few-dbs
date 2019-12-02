#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE TABLE public.companies
	(
		id BIGSERIAL,
		name character varying(255),
		address character varying(255),
		PRIMARY KEY (id)
	);

	ALTER TABLE public.companies OWNER to "companies-db";

	insert into companies (name, address) values ('Google','US'),('Bed Inc','UK'),('Yandex','Moscow');

	CREATE EXTENSION postgres_fdw;
EOSQL
