FROM python:3.10.6-slim-buster
LABEL maintainer="BhattraiDeb"

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip
COPY ../requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

COPY ../src /app

CMD ["python", "web/app.py"]