FROM postgres:12.1

WORKDIR /

RUN    chown postgres:postgres /var/lib/postgresql/data

# COPY docker-entrypoint-initdb.d /docker-entrypoint-initdb.d

ENV POSTGRES_USER users-db
ENV POSTGRES_PASSWORD users-db
ENV POSTGRES_DB users-db