MYSQL INITIAL STEPS
1. mysql-ctl cli;
2. remember to add the ' ; ' to the end of every query
3. show databases;
4. 2. use database_name;
5. select database();
6. show tables;
7. create table shirts (id not null auto_increment primary key);
8. desc shirts;
9. INSERT INTO shirts(article, color, shirt_size, last_worn) VALUES
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200);
10. delete from shirts => remove all files of the table
**** RUN A FILE.sql ON THE TERMINAL ****
mysql> source sql_files/file.sql
