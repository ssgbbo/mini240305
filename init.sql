CREATE DATABASE IF NOT EXISTS sncdb;
CREATE USER IF NOT EXISTS 'scdb_0305'@'localhost' IDENTIFIED BY 'snc369!@';
GRANT ALL PRIVILEGES ON sncdb.* TO 'scdb_0305'@'localhost';
FLUSH PRIVILEGES;