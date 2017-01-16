#!/bin/bash


PGPASSWORD=$POSTGRES_PASSWORD su postgres --command 'psql -h $HOSTNAME -p "5432" -U $POSTGRES_USER -d $POSTGRES_DB -a -f /var/testlink/install/sql/postgres/testlink_create_tables.sql'
#for i in $(ls -vd /var/testlink/install/sql/alter_tables/*); do find ${i} -wholename *postgres* -type f | sort -t \0; done | xargs -i su postgres --command 'PGPASSWORD=$POSTGRES_PASSWORD psql -h $HOSTNAME -p "5432" -U $POSTGRES_USER -d $POSTGRES_DB -a -f {}'
PGPASSWORD=$POSTGRES_PASSWORD su postgres --command 'psql -h $HOSTNAME -p "5432" -U $POSTGRES_USER -d $POSTGRES_DB -a -f /var/testlink/install/sql/postgres/testlink_create_default_data.sql'
