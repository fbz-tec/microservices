#!/bin/bash

export PGPASSWORD="${POSTGRESQL_PASSWORD}"

# Create the databases
psql -U postgres -tc "SELECT 1 FROM pg_database WHERE datname = 'accountsdb'" | grep -q 1 | psql -U postgres -c "CREATE DATABASE accountsdb"
psql -U postgres -tc "SELECT 1 FROM pg_database WHERE datname = 'cardsdb'" | grep -q 1 | psql -U postgres -c "CREATE DATABASE cardsdb"
psql -U postgres -tc "SELECT 1 FROM pg_database WHERE datname = 'loansdb'" | grep -q 1 | psql -U postgres -c "CREATE DATABASE loansdb"

# Create the schemas
psql -U postgres -d accountsdb -f /opt/schemas/accounts.sql
psql -U postgres -d cardsdb -f /opt/schemas/cards.sql
psql -U postgres -d loansdb -f /opt/schemas/loans.sql