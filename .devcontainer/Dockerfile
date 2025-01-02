FROM python:3.12-slim-bullseye

WORKDIR /app

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1
ENV TZ=Asia/Tokyo

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    wget \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir -U pip

