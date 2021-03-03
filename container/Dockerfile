FROM python:3.7-slim-stretch

RUN apt-get update -y && apt-get install -y --no-install-recommends && \
    apt-get install -y libzbar-dev bash gcc git \
    libc-dev libssl-dev libffi-dev libsasl2-dev libldap2-dev curl wget \
    vim sudo build-essential \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


RUN pip install --upgrade pip
COPY container/requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt \
    && rm -rf requirements.txt


ENV MLFLOW_HOME /opt/mlflow
ENV FILE_STORE ${MLFLOW_HOME}/fileStore
ENV ARTIFACT_STORE ${MLFLOW_HOME}/artifactStore

RUN mkdir -p ${FILE_STORE} && \
    mkdir -p ${ARTIFACT_STORE}

RUN mkdir -p /main
COPY ./src ${MLFLOW_HOME}

COPY ./container/run.sh /run.sh
RUN chmod 777 /run.sh

RUN chmod -R 777 ${MLFLOW_HOME}
WORKDIR ${MLFLOW_HOME}

# ENTRYPOINT ["./run.sh"]