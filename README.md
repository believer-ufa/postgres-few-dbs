## Example of triple PostgreSQL servers configuation.

This example show how you can configure main server to
connect full schemas from users and companies servers.

### Starting:

```bash
docker-compose up
```

### Queyring

After successfull start, you can, for example, use PgAdmin to connect
to main server (127.0.0.1:5432, login and pass are "main") and check that
connection to different tables and joins are works with that example query:

```
select users.first_name, users.last_name, companies.name
from users.users
JOIN companies.companies ON (users.company_id = companies.id);
```

Both tables, users and companies, located on different PgSQL servers.
