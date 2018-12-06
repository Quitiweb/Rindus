FROM python:3

ARG requirements=requirements/production.txt

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DJANGO_SETTINGS_MODULE=djangodocker.settings.production

WORKDIR /code
COPY . /code/
RUN pip install -r $requirements && \
  python /code/rindus/manage.py collectstatic --noinput
