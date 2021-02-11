
FROM python:3.7-slim-buster
ARG FLOWER_VERSION=0.9.7
# Get latest root certificates
RUN apt-get install -y --no-install-recommends ca-certificates

# Install the required packages
RUN pip install --no-cache-dir flower==${FLOWER_VERSION}

# PYTHONUNBUFFERED: Force stdin, stdout and stderr to be totally unbuffered. (equivalent to `python -u`)
# PYTHONHASHSEED: Enable hash randomization (equivalent to `python -R`)
# PYTHONDONTWRITEBYTECODE: Do not write byte files to disk, since we maintain it as readonly. (equivalent to `python -B`)
ENV PYTHONUNBUFFERED=1 PYTHONHASHSEED=random PYTHONDONTWRITEBYTECODE=1
