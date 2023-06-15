FROM python:3.6-slim
MAINTAINER Mark Gituma <mark.gituma@gmail.com>

ENV PROJECT_ROOT /app
WORKDIR $PROJECT_ROOT

# Update and install dependencies
RUN apt-get update && apt-get install -y \
    libpq-dev \
    gcc

COPY requirements.txt requirements.txt

# Install Python dependencies
RUN pip install -r requirements.txt

# Remove unnecessary dependencies
RUN apt-get autoremove -y gcc

COPY . .

CMD python manage.py runserver 0.0.0.0:8000