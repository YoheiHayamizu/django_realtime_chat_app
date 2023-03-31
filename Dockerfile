FROM python:3.10-slim
LABEL maintainer="YoheiHayamizu"

# The output from Python will be printed directly to the console
ENV PYTHONUNBUFFERD 1

COPY ./requirements.txt /tmp/requirements.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000
EXPOSE 6379

RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential libpq-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
RUN python -m venv /venv && \
    /venv/bin/pip install --upgrade pip && \
    /venv/bin/pip install -r /tmp/requirements.txt && \
    rm -rf /tmp && \
    adduser \
    --disabled-password \
    --no-create-home \
    yhayami1

ENV PATH="/venv/bin:$PATH"

USER yhayami1