FROM python:3.7-slim-buster
ENV DEBIAN_FRONTEND=noninteractive
ARG AIRFLOW_VERSION="2.0.1"
ARG AIRFLOW_HOME="/app/airflow"
ENV AIRFLOW_HOME=${AIRFLOW_HOME}
RUN mkdir -p "${AIRFLOW_HOME}"; \
    mkdir -p "${AIRFLOW_HOME}/dags"; \
    mkdir -p "${AIRFLOW_HOME}/logs"; \
    mkdir -p "${AIRFLOW_HOME}/plugins"
ARG DEV_APT_DEPS="\
     apt-transport-https \
     apt-utils \
     build-essential \
     ca-certificates \
     gnupg \
     dirmngr \
     freetds-bin \
     freetds-dev \
     gosu \
     krb5-user \
     ldap-utils \
     libffi-dev \
     libkrb5-dev \
     libldap2-dev \
     libpq-dev \
     libsasl2-2 \
     libsasl2-dev \
     libsasl2-modules \
     libssl-dev \
     locales  \
     lsb-release \
     nodejs \
     openssh-client \
     postgresql-client \
     python-selinux \
     sasl2-bin \
     software-properties-common \
     sqlite3 \
     sudo \
     unixodbc \
     unixodbc-dev \
     yarn"
RUN apt-get update \
    && apt-get install -y --no-install-recommends default-libmysqlclient-dev gcc \
    && apt-get install -y --no-install-recommends ${DEV_APT_DEPS}\
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade pip setuptools
RUN pip install --upgrade --upgrade-strategy eager apache-airflow[celery,crypto,mysql,password,rabbitmq,ldap,aws]==${AIRFLOW_VERSION}
RUN pip install flower
WORKDIR /app/airflow
COPY . .


# RUN export FERNET_KEY = python -c “from cryptography.fernet import Fernet; FERNET_KEY = Fernet.generate_key().decode(); print(FERNET_KEY)