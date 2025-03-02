FROM python:3.12-bookworm

WORKDIR /app

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1
ENV TZ=Asia/Tokyo

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    sudo \
    wget \
    passwd \
    git \
    bash \
    openssh-client \
    expect \
    coreutils \
    procps \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ARG USERNAME
ARG USER_PASSWORD
ARG ROOT_PASSWORD

ENV USERNAME=$USERNAME
ENV USER_PASSWORD=$USER_PASSWORD
ENV ROOT_PASSWORD=$ROOT_PASSWORD

RUN echo "root:$ROOT_PASSWORD" | chpasswd && \
    useradd -m -s /bin/bash "$USERNAME" && \
    echo "$USERNAME:$USER_PASSWORD" | chpasswd && \
    usermod -aG sudo "$USERNAME"

USER $USERNAME

RUN git config --global --add safe.directory /app \
    && pip install --no-cache-dir -U pip