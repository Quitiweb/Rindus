FROM python:3

WORKDIR /code

ARG requirements=requirements/development.txt

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DJANGO_SETTINGS_MODULE=rindus.settings.development

COPY rindus/ /code/rindus/
COPY requirements/ /code/requirements/

RUN pip install -r $requirements && \
  python /code/rindus/manage.py collectstatic --noinput

CMD ["python", "rindus/manage.py", "runserver", "127.0.0.1:8000"]