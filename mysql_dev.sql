-- Prepares a MySQL server

CREATE DATABASE IF NOT EXISTS aecp_dev_db;
CREATE USER IF NOT EXISTS 'aecp_dev'@'localhost' IDENTIFIED BY 'aecp_dev_pwd';
GRANT ALL PRIVILEGES ON `aecp_dev`.* TO 'aecp_dev'@'localhost';
GRANT SELECT ON `performance_schema`.* TO 'aecp_dev'@'localhost';
FLUSH PRIVILEGES
