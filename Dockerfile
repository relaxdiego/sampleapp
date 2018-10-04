FROM python:3.6.6-slim-stretch

USER root
WORKDIR /opt/app

RUN pip install flask
COPY app/ .

ENV FLASK_ENV="development"
ENV FLASK_APP="/opt/app/server.py"

ENTRYPOINT  ["/usr/local/bin/flask", "run", "--host=0.0.0.0"]
