Refining Selections

/*Tools*/

1. DISTINCT
select distinct author_fname, author_lname from books;

select distinct concat( author_fname, ' ', author_lname) from books;

2. ORDER BY -> ascendind by default
select author_lname from books order by author_lname;

select title, author_fname, author_lname from books order by 2; -> order by author_fname

select author_fname, author_lname from books order by author_lname, author_fname;

3. LIMIT number
select title from books limit 3;

select title, released_year from books
order by 2 limit 5;

select title, released_year from books
order by 2 desc limit 0,5;    -> 0 : start | 5 : last point

select title, released_year from books
order by 2 desc limit 10, 1     -> 11º book;

select title from books
order by 2 desc limit 5, 912172717177271; -> from the 5º till the last book;
*****this big number after 5, means a param != of the numbers of itens, which could
be any number, but must to be != of the qtd of itens the table have

4. LIKE
select author_fname from books where author_fname like '%da%'; -> the itens that
could have anything before and after < da >.

select title, stock_quantity from books where stock_quantity like '____';
-> the iten(s) that have 4 digits. Tha character is the < _ >, repeat by 4 in the ex.

****matching patterns
(235)234-0987 -> uses :: like '(___)___-____';

****searching for % or _
like '%\%%';
like '%\_%';

** COUNT **
select count(*) from books;

** distinct **
select count(distinct author_fname) from books;

** group by ** => Always group by with all non calculated params
select author_lname, count(*) from books group by author_lname;

select title, author_fname, author_lname, count(*) from books group by 2,3;

select concat('In ', released_year, ' ', count(*), ' books') as year from books group by released_year;
  
** MIN / MAX **
select author_fname, author_lname, min(released_year) from books group by 1, 2;

** SUM **
select title, author_fname, sum(pages) from books group by 1,2;  

** AVG **
select released_year, avg(stock_quantity) from books group by 1;

** Silly things*
select concat(author_fname, ' ', author_lname), pages from books where pages = (select max(pages) from books);
** same result as 
select concat(author_fname, ' ', author_lname), pages from books order by pages desc limit 1;
*******
select released_year as year, count(*) as books, avg(pages) from books group by 1;

****** AND *******
works with &&

****** OR *******
works with ||

** BETWEEN **
equivalent to a query with greater than or equal (>=) and less than or equal (<=)
select title, released_year from books where released_year between 2004 and 2005;
:: DOES INCLUDE THE 2004 and 2015

** NOT BETWEEN **
outside of the interval (<) AND (>)
:: DOES NOT INCLUDE 2004 and 2015

** CAST **
select cast('2017-05-02' as datetime); // 2017-05-02 00:00:00
SELECT 
    name, 
    birthdt 
FROM people
WHERE 
    birthdt BETWEEN CAST('1980-01-01' AS DATETIME)
    AND CAST('2000-01-01' AS DATETIME);
    
** IN **
select title, author_lname from books where author_lname in ('Carver', 'Lahiri', 'Smith');
:: the list means OR

** NOT IN **
select title, released_year from books where released_year not in (2000, 2002, 2004);
:: the list means AND

select title, released_year from books where released_year not in (
                                select released_year from books where released_year > 2000);

select title, released_year from books where released_year >= 2000 
AND released_year % 2 != 0 order by 2;

*** CASE ***
SELECT title, released_year,
    CASE
        WHEN released_year >= 2000 THEN 'Modern Lit'
        ELSE '20th Century Lit'
    END AS Genre
FROM books;

** ROUND with AVG **
select title as Movie, round(avg(rating), 2) as 'Avg rating'
from series join reviews on series.id = reviews.series_id 
group by title
order by 2 DESC;

select genre, round(avg(rating), 2) 
from series ser join reviews rev on ser.id = rev.series_id 
group by 1;

** IF ** -> Used when there is no more than 2 condition, otherwise, use CASE

select first_name as Nome, last_name as Sobrenome, 
count(rating) as Count, ifnull(min(rating), 0) as MIN, 
ifnull(max(rating),0) as MAX, ifnull(round(avg(rating), 2), 0) as AVG,
if(count(rating) >= 1, 'Active', 'Inactive') as Status
from reviewers revw left join reviews rev on revw.id = rev.reviewer_id 
group by revw.id;