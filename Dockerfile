# See the walkthrough at http://aidanlister.com/2014/12/how-to-containerize-your-django-application-with-docker-and-fig/
FROM python:2.7.8
MAINTAINER Aidan Lister
EXPOSE 8000

RUN mkdir -p /usr/src/app
COPY requirements.txt /usr/src/requirements.txt

WORKDIR /usr/src/python
RUN pip install -r /usr/src/requirements.txt

ENV REDISTOGO_URL redis://redis:6379
ENV DJANGO_SETTINGS_MODULE myapp.settings
ENV DATABASE_URL postgres://postgres@db/postgres

WORKDIR /usr/src/app
CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]
