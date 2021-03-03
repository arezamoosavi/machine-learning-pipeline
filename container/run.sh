#!/bin/bash

set -o errexit
set -o nounset

mlflow server \
    --backend-store-uri $DB_URI \
    --host $SERVER_HOST \
    --port $SERVER_PORT \
    --default-artifact-root $ARTIFACT_STORE

# mlflow ui --port $SERVER_PORT