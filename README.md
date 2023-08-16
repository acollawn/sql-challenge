# SQL-Challenge
Module 9 SQL Challenge

# Lecture Help
Don't forget to refresh Database to show tables

## Locate lines in table in lecture 9.1 - 34 minutes in
  SELECT column_name
  FROM table_name

  Filter
  SELECT column(s)_name
  FROM table_name
  WHERE column_name = 'value we are looking for'
  AND column_name =/<> 'value';

  Filter Example
    SELECT pet_name, pet_type
    FROM people
    WHERE pet_type = 'dog'
    AND pet_age > 5;

## Wild card
% sign signifies 0,1, or multiple different characters than what is searched for
  example
    SELECT *
    FROM actor
    WHERE last_name LIKE 'Will%';

  _ symbol signifies 1 character that is different from the searched value
  example
    SELECT *
    FROM actor
    WHERE first_name LIKE '_an';

## Join tables
  Inner Join - returns records that have matching values in both tables
  example
    SELECT names.name, commodity.commod, commodity.commod_tp, commodity.commod_group
    FROM names
    INNER JOIN commodity ON 
    commodity.dep_id=names.dep_id
 or you can abbreviate
 example
    SELECT n.name, c.commod, c.commod_tp, c.commod_group
    FROM names as n
    INNER JOIN commodity as c ON 
    c.dep_id=n.dep_id
