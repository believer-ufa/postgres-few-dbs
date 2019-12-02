#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    -- init main db samples, connect to companies & users dbs
	CREATE EXTENSION postgres_fdw;
	CREATE USER fdw_user WITH ENCRYPTED PASSWORD 'secret';
	GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE employee TO fdw_user;
EOSQL