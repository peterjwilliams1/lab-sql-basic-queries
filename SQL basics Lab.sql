

select *
from actor;

select*
from film;

select title, description
from film;

-- select first_name and last_name from actor;
select first_name, last_name from actor;

select distinct first_name from actor;

select avg(amount) from payment;

select max(amount) from payment;

select title, rating from film
order by rating DESC,title;

-- retrieve the number of actors per film(actor_id)
select film_id, count(actor_id) as number_of_actors from film_actor group by film_id
-- order the film_ids un descending order by the number of actors they have
order by number_of_actors DESC;

-- retrieve the total amount spent by each customer
-- order them by the total amount in desc order.

select customer_id, sum(amount) as total_amount from payment group by customer_id
order by total_amount DESC;

select DATE_FORMAT(return_date, "%d") - DATE_FORMAT(rental_date, "%d") as delay from rental;  -- this extracts the day.
select DATE_FORMAT(return_date, "%w") from rental; -- this extracts the week.
select DATE_FORMAT(return_date, "%m") from rental; -- this extracts the month.
select DATE_FORMAT(return_date, "%y") from rental; -- this extracts the year.

-- retrieve the number of cities for each country on the database.
select country_id, count(city_id) as total_city from city group by country_id;

-- retrieve the first and last name of actors
-- whose first name is "john".

select first_name, last_name from actor where first_name = "john";

-- retreive the total amount spent by customers 
-- but only those that have a customer_id between 100-200

select customer_id, sum(amount) as total_amount from payment where customer_id BETWEEN 100 and 200 group by customer_id
order by total_amount DESC;

-- retrieve the average length per rating
-- but only for ratings 'R' and 'PG'

select rating, avg(length) as average_length from film where rating  = "R" or rating = "PG" group by rating; -- rating in ("R", "PG") also works
select rating, avg(length) as average_length from film where rating  in("r", "pg") group by rating; -- rating in ("R", "PG") also works

-- retreive the total amount spent by customers 
-- but only those that have a customer_id between 100-200
-- and only those who spent more than 100$ in total

select customer_id, sum(amount) as total_amount from payment where customer_id BETWEEN 100 and 200 group by customer_id having total_amount > 100
order by total_amount DESC
limit 1; -- brings back the top entry i.e the highest amount

-- retrieve the title and the description of the 5 longest movies

select title, description from film
order by length DESC
limit 5;

-- we want to categorise film inot short medium and large

select title, description, 
	case 
		when length > 120 then "long"
		when length > 60 then "medium"
		else "short"
	end as length_type
from film;

select max(rental_rate) from film;

select format(10.2453,2);

select round(10.2453);

select first_name, last_name
from actor
where first_name LIKE "A%"; -- first name starts with "A"

select first_name, last_name
from actor
where first_name LIKE "%A"; -- first name ends with "A"

select first_name, last_name
from actor
where first_name LIKE "_A%"; -- first name has "A" as 2ns charachter

select first_name, last_name
from actor
where first_name LIKE "_A_T%"; -- first name has "A" as 2nd charachter and "T" as 4th;


show tables;

select * from actor,film,customer;

select title from film;

select name as language from language;

select first_name from staff;

select release_year as release_year from film;

select store_id, count(store_id) from store as stores group by store_id;

select staff_id, count(staff_id) from staff as staff_number group by staff_id;

SELECT rental_id, COUNT(rental_id) AS count_per_retalid FROM rental GROUP BY rental_id;
SELECT inventory_id, COUNT(inventory_id) AS count_per_inventoryid FROM rental GROUP BY inventory_id;
SELECT 
    (SELECT COUNT(rental_id) FROM rental) - 
    (SELECT COUNT(inventory_id) FROM rental) AS difference;
    
SELECT film_id, COUNT(film_id) AS count_per_rentalid FROM inventory GROUP BY film_id;
SELECT inventory_id, COUNT(inventory_id) AS count_per_inventoryid FROM inventory GROUP BY inventory_id;

select last_name, count(distinct last_name) as count_of_last_names from actor group by last_name;

select title, length from film
order by length DESC
limit 10;

select first_name, last_name from actor where first_name = "scarlett";

select title,length from film where title like "%armageddon%" having length > 100;

select special_features, count(special_features) from film where special_features like "%behind the scenes%" group by special_features;