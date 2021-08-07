--Question 1
SELECT first_name, last_name
FROM customer
INNER JOIN address
ON address.address_id = customer.address_id
WHERE district ='Texas';


SELECT address_id, first_name, last_name
FROM customer 
WHERE address_id IN (
	SELECT address.address_id
	FROM customer
	INNER JOIN address
	ON address.address_id = customer.address_id
	WHERE district ='Texas'
);


--Question 2	
SELECT first_name, last_name, amount
FROM customer
INNER JOIN payment
ON customer.customer_id = payment.customer_id
WHERE payment.amount > 6.99;

--Question 3
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
);

--Question 4
SELECT first_name, last_name, city
FROM customer
INNER JOIN city
ON city.last_update = customer.last_update
WHERE city = 'Nepal';
--0

--Question 5
SELECT first_name, last_name, COUNT(rental.staff_id)
FROM staff
INNER JOIN rental
ON staff.staff_id = rental.staff_id
GROUP BY staff.staff_id;
--Mike Hillyer

--Question 6
---- result is differnt from expected
SELECT film.title, film.film_id, COUNT(film_actor.actor_id)
FROM film, film_actor
WHERE film.film_id = film_actor.film_id
GROUP BY film.film_id
ORDER BY COUNT(film_actor.film_id) DESC;
--film_id 508 has the most actors


--Question 7
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer.customer_id
	FROM customer
	INNER JOIN payment
	ON customer.customer_id = payment.customer_id
	WHERE amount > 6.99
	GROUP BY customer.customer_id);


-- Question 8
SELECT category_id, COUNT(category_id)
FROM film_category
GROUP BY category_id
ORDER BY COUNT(category_id) DESC;
--category_id #15