#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    -- init main db samples, connect to companies & users dbs
	CREATE EXTENSION postgres_fdw;
	GRANT USAGE ON FOREIGN DATA WRAPPER postgres_fdw to main;

	CREATE SERVER users
	  FOREIGN DATA WRAPPER postgres_fdw
 	  OPTIONS (dbname 'users-db', host 'users-db', port '5432');

	CREATE SERVER companies
	  FOREIGN DATA WRAPPER postgres_fdw
 	  OPTIONS (dbname 'companies-db', host 'companies-db', port '5432');

	CREATE USER MAPPING for main SERVER users OPTIONS (user 'users-db', password 'users-db');
	CREATE USER MAPPING for main SERVER companies OPTIONS (user 'companies-db', password 'companies-db');

	CREATE SCHEMA "users" AUTHORIZATION main;
	CREATE SCHEMA "companies" AUTHORIZATION main;

	IMPORT FOREIGN SCHEMA "public" FROM SERVER "companies" INTO "companies";
	IMPORT FOREIGN SCHEMA "public" FROM SERVER "users" INTO "users";
EOSQL
