FROM postgres:12.1-alpine

WORKDIR /

RUN chown postgres:postgres /var/lib/postgresql/data

# COPY docker-entrypoint-initdb.d /docker-entrypoint-initdb.d

ENV POSTGRES_USER companies-db
ENV POSTGRES_PASSWORD companies-db
ENV POSTGRES_DB companies-db
