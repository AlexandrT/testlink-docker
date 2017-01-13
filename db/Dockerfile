FROM postgres:9.4

RUN /bin/bash -l -c 'PGPASSWORD=$POSTGRES_PASSWORD su postgres --command \
       "psql -h $POSTGRES_PORT_5432_TCP_ADDR -p \"5432\" -U $POSTGRES_USER -d $POSTGRES_DB -a -f /var/testlink/install/sql/postgres/testlink_create_tables.sql"'

RUN /bin/bash -l -c 'PGPASSWORD=$POSTGRES_PASSWORD su postgres --command \
       "psql -h $POSTGRES_PORT_5432_TCP_ADDR -p \"5432\" -U $POSTGRES_USER -d $POSTGRES_DB -a -f /var/testlink/install/sql/postgres/testlink_create_default_data.sql"'

RUN /bin/bash -l -c 'for i in $(ls -vd /var/testlink/install/sql/alter_tables/*); do find ${i} -wholename *postgres* -type f | sort -t \0; done | xargs -i su postgres --command "PGPASSWORD=$POSTGRES_PASSWORD psql -h $POSTGRES_PORT_5432_TCP_ADDR -p \"5432\" -U $POSTGRES_USER -d $POSTGRES_DB -a -f {}"'
