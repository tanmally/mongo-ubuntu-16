#!/bin/bash

MONGODB_SKIP_AUTH_SETUP="No"

if [ ! "$MONGODB_SKIP_AUTH_SETUP" = 'yes' ]; 
then

USER={{MONGODB_USERNAME}}
PASS={{MONGODB_PASSWORD}}
DB="admin"
ROLE="userAdminAnyDatabase"


# Create User
echo "Creating user: \"$USER\"..."
mongo $DB --eval "db.createUser({ user: '$USER', pwd: '$PASS', roles: [ { role: '$ROLE', db: '$DB' } ] });"

# Stop MongoDB service
systemctl restart mongod

echo "========================================================================"
echo "MongoDB User: \"$USER\""
echo "MongoDB Password: \"$PASS\""
echo "MongoDB Database: \"$DB\""
echo "MongoDB Role: \"$ROLE\""
echo "========================================================================"

rm -f /.db_config

fi
