ARG VERSION=3.10-slim
FROM python:${VERSION}
WORKDIR /usr/src/app

RUN apt-get update && \
apt-get -y install python3-dev default-libmysqlclient-dev \
build-essential pkg-config
COPY snc/django-community-board/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY snc/django-community-board/. .
RUN python manage.py makemigrations
COPY was_run.sh ./
RUN chmod +x ./was_run.sh
CMD ["/bin/bash", "-c", "./was_run.sh"]