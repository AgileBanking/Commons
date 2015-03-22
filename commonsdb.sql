CREATE USER 'client'@'localhost' IDENTIFIED BY 'agiler';
GRANT ALL ON *.* TO 'client'@'%' WITH GRANT OPTION;