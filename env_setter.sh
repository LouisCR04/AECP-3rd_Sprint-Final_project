#!/usr/bin/env bash
# Sets relevant environment variables

export MSQL_USER="aecp_dev"
export MSQL_PWD="aecp_dev_pwd"
export MSQL_HOST="localhost"
export MSQL_DB="aecp_dev_db"

# Check if variables are set
if [ -z "$MSQL_USER" ]; then
    echo "MSQL_USER is not set."
else
    echo "MSQL_USER is set to $MSQL_USER."
fi

if [ -z "$MSQL_PWD" ]; then
    echo "MSQL_PWD is not set."
else
    echo "MSQL_PWD is set to $MSQL_PWD."
fi

if [ -z "$MSQL_HOST" ]; then
    echo "MSQL_HOST is not set."
else
    echo "MSQL_HOST is set to $MSQL_HOST."
fi

if [ -z "$MSQL_DB" ]; then
    echo "MSQL_DB is not set."
else
    echo "MSQL_DB is set to $MSQL_DB."
fi
