# Completely drop and recreate the database

# show all commands as they are run:
set -x

# --force: because SQLTools may be maintaing a db connection
# environment variables: use injected, or fall back to default
dropdb --if-exists --force ${PGDATABASE:-$PGUSER}

createdb

psql -f create.sql
psql -f vaccine.sql
psql -f needs.sql
psql -f census.sql
psql -f homes.sql

# run one sample query to demonstrate data has been loaded:
psql -a -f query-client-requirements.sql
