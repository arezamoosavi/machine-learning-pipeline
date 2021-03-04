#!/bin/bash

set -o errexit
set -o nounset

# uncomment below when you see any issue with db...
# mlflow db upgrade $DB_URI

mlflow server \
    --host $SERVER_HOST \
    --port $SERVER_PORT \
    --backend-store-uri $DB_URI \
    --default-artifact-root $MLFLOW_ARTIFACT_STORE
