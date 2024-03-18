ARG VERSION=1.25.4
FROM nginx:${VERSION}
COPY snc/django-community-board/static /usr/share/nginx/html/static
COPY snc/nginx/conf.d/web/. /etc/nginx/conf.d/

# /django-community-board/attendance/templates/attendance/

