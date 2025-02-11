-- # create wp1 user and grant rights permissions
CREATE USER `wp1`@`%` IDENTIFIED BY 'Admin@123';
-- GRANT USAGE ON *.* TO `wp1`@`%` REQUIRE NONE WITH `MAX_QUERIES_PER_HOUR` 0 `MAX_CONNECTIONS_PER_HOUR` 0 `MAX_UPDATES_PER_HOUR` 0 `MAX_USER_CONNECTIONS` 0;
CREATE DATABASE IF NOT EXISTS `wp1`;
GRANT ALL PRIVILEGES ON `wp1`.* TO 'wp1'@'%';
FLUSH PRIVILEGES;

-- # create wp2 user and grant rights permissions
CREATE USER `wp2`@`%` IDENTIFIED BY 'Admin@123';
CREATE DATABASE IF NOT EXISTS `wp2`;
GRANT ALL PRIVILEGES ON `wp2`.* TO 'wp2'@'%';
FLUSH PRIVILEGES;

-- # create wp3 user and grant rights permissions
CREATE USER `wp3`@`%` IDENTIFIED BY 'Admin@123';
CREATE DATABASE IF NOT EXISTS `wp3`;
GRANT ALL PRIVILEGES ON `wp3`.* TO 'wp3'@'%';
FLUSH PRIVILEGES;