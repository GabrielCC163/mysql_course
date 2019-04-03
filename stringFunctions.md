String Functions

****Running SQL files*****
source file_name.sql
***********************

1. CONCAT(column, 'text', anotherColumn, 'more text');
select author_fname as first, author_lname as last, 
concat (author_fname, ' ', author_lname) as full from books;

2. CONCAT_WS
select concat_ws(' - ', title, author_fname, author_lname) from books;

3. SUBSTRING -> in sql starts at one
SELECT SUBSTRING('Hello World', 1, 4); // Hell
SELECT SUBSTRING('Hello World', 7); // World
SELECT SUBSTRING('Hello World', -3); // rld

4. SUBSTR() -> same as SUBSTRING

CONCAT AND SUBSTRING
select concat;
    (
        SUBSTRING(title, 1, 10), 
        '...'
    ) as 'title' 
from books;

5. REPLACE  -> is case sensitive
SELECT REPLACE('Hello World', ' ', ' - ');

select
    SUBSTR(
        replace(title, 'e', 3),
        1, 10
    )
from books;

5. SELECT REVERSE('Hello world');

6. select char_length('Hello World');
select author_lname, char_length(author_lname) as length from books;

8. select upper('Hello world'); // HELLOW WORLD
select lower('Hello World');

/*General example select*/
select 
    concat(SUBSTRING(title, 1, 10), '...') as 'short title', 
    concat(author_lname, ',', author_lname) as author, 
    concat(stock_quantity, ' in stock') as quantity 
from books;

select title, author_lname from books
where substr(author_lname, 1, 1) in ('C', 'S');

