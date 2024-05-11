-- Write a query to display for each store its store ID, city, and country.

select * from sakila.store;

select * from sakila.country;

select * from sakila.city;

select * from sakila.address;

select distinct st.store_id, sc.city, sco.country
from sakila.store as st
left join sakila.address sa
on st.address_id = sa.address_id
left join sakila.city sc
on sa.city_id = sc.city_id
left join sakila.country sco
on sc.country_id = sco.country_id
;

-- Write a query to display how much business, in dollars, each store brought in.



select * from sakila.rental;

select * from sakila.staff;

select * from sakila.payment;

select * from sakila.store;

select  * from sakila.film;

select * from sakila.film_text;

select * from sakila.category;

select st.store_id, sum(pay.amount) as total_amount_per_staff
from sakila.store st
left join sakila.staff stf
on st.store_id = stf.store_id
left join sakila.payment pay
on stf.staff_id = pay.staff_id
group by 1
order by 2 desc;

-- What is the average running time of films by category?

select * from sakila.film;

select * from sakila.category;

select * from sakila.film_Text;

select * from sakila.rental;

select * from sakila.store;

select * from sakila.inventory;

select * from sakila.film_actor;

select * from sakila.film_category;

select * from sakila.actor;

select fct.category_id, fct.name, avg(fm.length)
from sakila.category fct
left join sakila.film_category fctg
on fct.category_id = fctg.category_id 
left join sakila.film fm
on fctg.film_id = fm.film_id
group by 2, 1
order by 3 desc;

select fct.category_id, fct.name, avg(fm.length)
from sakila.category fct
left join sakila.film_category fctg
on fct.category_id = fctg.category_id 
left join sakila.film fm
on fctg.film_id = fm.film_id
group by 2, 1
order by 3 desc;


-- Which film categories are longest?

select fct.category_id, fct.name, avg(fm.length)
from sakila.category fct
left join sakila.film_category fctg
on fct.category_id = fctg.category_id 
left join sakila.film fm
on fctg.film_id = fm.film_id
group by 2, 1
order by 3 desc
limit 3;

-- Display the most frequently rented movies in descending order


select fm.title, count(skr.rental_id) as total_rentings_per_film
from sakila.film fm
left join sakila.inventory sid
on fm.film_id = sid.film_id
left join sakila.rental skr
on sid.inventory_id = skr.inventory_id
group by 1
order by 2 desc;

-- List the top five genres in gross revenue in descending order.

select * from sakila.store;

select * from sakila.film;

select * from sakila.category;

select * from sakila.film_text;

select * from sakila.rental;

select * from sakila.payment;

select * from sakila.film_category;

select * from sakila.inventory;

select fct.name, sum(p.amount)
from sakila.category fct
left join sakila.film_category ctg
on fct.category_id = ctg.category_id
left join sakila.inventory as inv
on ctg.film_id = inv.film_id
left join sakila.rental r
on inv.inventory_id = r.inventory_id
left join sakila.payment p
on r.rental_id = p.rental_id
group by 1
order by 2 desc
limit 5;


-- Is "Academy Dinosaur" available for rent from Store 1?


SELECT s.store_id, fml.title
from sakila.inventory inv
left join sakila.film fml
on inv.film_id = fml.film_id
left join sakila.store s
on inv.store_id = s.store_id
where fml.title = 'Academy Dinosaur' AND s.store_id = 1;




FROM sakila.inventory ski
left JOIN film f ON i.film_id = f.film_id
JOIN store s ON i.store_id = s.store_id
WHERE f.title = 'Academy Dinosaur' AND s.store_id = 1;









