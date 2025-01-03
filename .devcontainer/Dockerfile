FROM python:3.12-slim-bullseye

WORKDIR /app

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1
ENV TZ=Asia/Tokyo

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    sudo\
    wget \
    git \
    openssh-client\
    bash\
    expect\
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN usermod -aG sudo root \
    git config --global --add safe.directory /app \
    && pip install --no-cache-dir -U pip