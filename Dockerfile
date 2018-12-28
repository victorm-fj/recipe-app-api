FROM python:3.7-alpine

# Recommended when running in Docker containers
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

# For security purposes, do not run app as root
RUN adduser -D user
USER user
