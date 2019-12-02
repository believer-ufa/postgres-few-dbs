FROM postgres:12.1-alpine

WORKDIR /

ENV POSTGRES_USER main
ENV POSTGRES_PASSWORD main
ENV POSTGRES_DB main

# RUN chown postgres:postgres /var/lib/postgresql/data

# USER postgres

# RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/12.1/main/pg_hba.conf

# COPY docker-entrypoint-initdb.d /docker-entrypoint-initdb.d

# RUN cat /usr/local/share/postgresql/postgresql.conf.sample

# ENV FLASK_APP app.py
# ENV FLASK_RUN_HOST 0.0.0.0
# RUN apk add --no-cache gcc musl-dev linux-headers
# COPY requirements.txt requirements.txt
# RUN pip install -r requirements.txt
# COPY . .
# CMD ["flask", "run"]
