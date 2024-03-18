ARG VERSION=1.25.4
FROM nginx:${VERSION}
COPY lb_init.sh /
COPY snc/nginx/conf.d/lb_web/. /etc/nginx/conf.d/
EXPOSE 2000/tcp

# RUN chmod +x /lb_init.sh
# CMD ["/lb_init.sh"]