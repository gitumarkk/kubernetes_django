FROM python:3.6-slim
MAINTAINER Mark Gituma <mark.gituma@gmail.com>

RUN apt-get update && apt-get install -y \
    curl \
    wget \
    vim \
    procps && \
    rm -rf /var/lib/apt/lists/*

ENV PROJECT_ROOT /app
WORKDIR $PROJECT_ROOT

COPY requirements.txt requirements.txt

# Install Python dependencies
RUN pip install -r requirements.txt

COPY . .

CMD python manage.py runserver 0.0.0.0:8000