#!/bin/bash

export BASE_NAME=$DBNAME
export USER_NAME=$DBUSER
export DB_PASS=$USERPASS

/etc/init.d/postgresql start

su -c "psql -U postgres -c \"create user $USER_NAME with password '$DB_PASS';\" && \
       psql -U postgres -c \"create database $BASE_NAME;\" && \
       psql -U postgres -c \"grant all privileges on database $BASE_NAME to $USER_NAME;\"" postgres
#psql -U postgres -c "create database portal;"
#psql -U postgres -c "grant all privileges on database portal to pguser;"
