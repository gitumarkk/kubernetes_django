FROM python:3-slim
MAINTAINER Mark Gituma <mark.gituma@gmail.com>

ENV PROJECT_ROOT /app
WORKDIR $PROJECT_ROOT

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . .
CMD python manage.py runserver 0.0.0.0:8000
