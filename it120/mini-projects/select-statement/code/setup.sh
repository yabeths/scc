# To run: from the VSCode Terminal, type:
#   bash ./setup.sh

# IMPORTANT: this file is part of the setup process for the
# select-vehicle activity. You should not need to make any changes
# to this file!

# Ask this bash shell to show each command as it is run:
set -x

# Clear out any existing database ans start a new one:
dropdb --if-exists ${PGDATABASE-${PGUSER}}
createdb

# Pass the code in create.sql to the database for interpreting:
#  -a option: show the commands as they are executed
#  -f option: use the supplied file as the commands to send
psql -a -f create.sql
