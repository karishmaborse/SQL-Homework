use sakila;
#select* from actor
select first_name as name, last_name as surname from actor;
select concat(first_name,' ', last_name) as ACTOR_NAME from actor;
select actor_id, first_name, last_name from actor where first_name = 'joe';
select * from actor where last_name like '%gen';
select last_name, first_name from actor where last_name like '%li%';
select country_id, country from country
where country in ( 'Afghanistan', 'China','Bangladesh');
ALTER TABLE actor
ADD COLUMN description1 blob not null;
#select*from actor
alter table actor 
drop column description;
ALTER table actor
drop column description1;
SELECT COUNT(DISTINCT last_name)
FROM actor;
SELECT first_name, count(distinct last_name) as surname_count
FROM actor
GROUP BY first_name
having surname_count > 2;
select actor_id from actor
where first_name = 'GROUCHO' and last_name = 'WILLIAMS'; 
update actor
set first_name= 'HARPO'
where actor_id in ( 
select actor_id from actor
where first_name = 'GROUCHO' and last_name = 'WILLIAMS');
select first_name, last_name from actor
where actor_id = 172;
update actor
set first_name = 'GROUCHO' where actor_id = 172;
select first_name, last_name, address_id from staff
where address_id in
( select inaddress_id , address from address 
);
SELECT staff.first_name, staff.last_name, address.address
FROM staff
inner JOIN address 
ON staff.address_id=address.address_id;
select staff.first_name , staff.last_name, payment.amount, payment.payment_date
from staff
inner join  payment
on payment.staff_id= staff.staff_id;
SELECT staff.first_name , staff.last_name, payment.amount, payment.payment_date FROM payment CROSS JOIN staff;
select count(actor_id), film.title
from  film
inner join film_actor
on film_actor.film_id = film.film_id
group by film.title;
select film_id from film
where title = 'Hunchback Impossible';
select count(inventory_id) as number_of_copies_of_Hunchback_Impossible from inventory 
where film_id = '439';
select last_name,first_name , sum(amount) as total_amount_paid
from customer
inner join payment 
on payment.customer_id = customer.customer_id
group by last_name
order by last_name asc;

select language_id from language 
where name = 'english';
select title from film
where language_id = 1 and film.title like 'k%' or film.title like 'q%'; 

select  first_name , last_name , actor_id 
from actor 
where actor_id in 
(select actor_id 
from film_actor
where film_id in
( select film_id from film
where title = 'Alone Trip'));

select customer.first_name , customer.last_name , customer.email , country.country from customer 
 join address on address.address_id = customer.address_id
 join city on address.city_id = city.city_id
 join country on country.country_id = city.country_id
where country = 'canada';

select title , description from film_text
where description like '%family%';
select title, rental_duration from film 
order by rental_duration desc;

select staff.store_id, amount as $ from payment
inner join rental on rental.rental_id = payment.rental_id
inner join staff on rental.staff_id = staff.staff_id
join store on staff.store_id = store.store_id;

select store_id , city.city, country.country from store
join address on address.address_id =store.address_id
join city on address.city_id = city.city_id
join country on city.country_id = country.country_id;

select category.name, amount from payment 
inner join rental on payment.rental_id = rental.rental_id
inner join inventory on rental.inventory_id = inventory.inventory_id
inner join film_category on inventory.film_id = film_category.film_id 
inner join category on film_category.category_id = category.category_id
order by amount desc limit 5 ;

create view [Top five genres by gross revenue] as
(select category.name, amount from payment 
inner join rental on payment.rental_id = rental.rental_id
inner join inventory on rental.inventory_id = inventory.inventory_id
inner join film_category on inventory.film_id = film_category.film_id 
inner join category on film_category.category_id = category.category_id
order by amount desc limit 5 );

drop view [top five genres by gross revenue];

















