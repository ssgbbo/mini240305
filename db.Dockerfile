# 사용할 base 이미지 선택
ARG VERSION=11.3.2
FROM mariadb:${VERSION}

COPY init.sql /docker-entrypoint-initdb.d/

# 환경 변수 설정
ENV MYSQL_DATABASE sncdb
ENV MYSQL_USER scdb_0305
ENV MYSQL_PASSWORD snc369!@

# 유저 생성 및 권한 부여
COPY init.sql /docker-entrypoint-initdb.d/

# 포트 노출
EXPOSE 3306

# -- init.sql
# CREATE DATABASE IF NOT EXISTS sncdb;
# CREATE USER IF NOT EXISTS 'scdb_0305'@'localhost' IDENTIFIED BY 'snc369!@';
# GRANT ALL PRIVILEGES ON sncdb.* TO 'scdb_0305'@'localhost';
# FLUSH PRIVILEGES;

# docker build -t my-mariadb .
# docker run -p 3306:3306 --name mariadb-container -d my-mariadb