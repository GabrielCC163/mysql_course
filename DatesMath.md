CURDATE() => The current DATE

CURTIME() => The current TIME

NOW() => The current DATETIME

====================
From a given datetime value, we can extract specific values;

** DAY(); **
select day(now()); // 25

** DAYNAME() **
select dayname(now()); //saturday

** DAYOFWEEK() **
select dayofweek(now()); // 7

** DAYOFYEAR() **
select dayofyear(now()); // the qtd of days since the first day of the given year
ex: if now = '2017-08-07', than output 219

/* MONTH(date and datetime) | MONTHNAME(date and datetime) | HOUR(time and datetime) | MINUTE(time and datetime) */

<<<<
some_date = '2017-04-01'
select concat(monthname(some_date), ' ', day(some_date), ' ', year(some_date);
displays == > 'April 21 2017'
>>>>

** DATE_FORMAT() **
some_date = '2017-04-01'
select date_format(some_date, '%m/%d/%Y'); // 04/01/2017
select date_format(some_date, '%m/%d/%Y at %h:%m'); // 04/01/2017 at 12:04 (random in this case);
select date_format(some_date, '%M %D %Y'); //April 4st 2017

** DATEDIFF ** => give the number of days between two dates (or datetime)
select datediff(now() - '1997-09-22'); // 7264

** DATE_ADD **
select date_add('2017-04-01', interval 1 day); // 2017-04-02
select now(), now() + interval 1 month;
select now(), now() - interval 5 month;
select now(), now() + interval 15 month + interval 10 hour;

CREATE TABLE comments2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW()
);

