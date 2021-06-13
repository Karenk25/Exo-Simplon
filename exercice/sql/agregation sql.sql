#1. Afficher le nombre de films dans les quels à joué l'acteur « JOHNNY LOLLOBRIGIDA »
# regroupé par catégorie.
SELECT COUNT(title) AS nb, c.name, first_name, last_name FROM actor AS a
JOIN film_actor AS fa ON a.actor_id = fa.actor_id
JOIN film AS f ON fa.film_id = f.film_id
JOIN film_category as fc ON f.film_id = fc.film_id
JOIN category AS c ON fc.category_id = c.category_id
WHERE first_name = 'JOHNNY' AND last_name = 'LOLLOBRIGIDA'
GROUP BY c.name;

#2. requete qui affiche les categories dans les quels 'JOHNNY LOLLOBRIGIDA" totalise plus de 3 films
SELECT COUNT(title), c.name, first_name, last_name FROM actor AS a
JOIN film_actor AS fa ON a.actor_id = fa.actor_id
JOIN film AS f ON fa.film_id = f.film_id
JOIN film_category as fc ON f.film_id = fc.film_id
JOIN category AS c ON fc.category_id = c.category_id
WHERE (first_name = 'JOHNNY' AND last_name = 'LOLLOBRIGIDA')
GROUP BY c.name
HAVING COUNT(title) > 3;

#3. afficher la durée moyenne d'emprunt des films par acteurs
SELECT AVG(rental_duration) FROM film AS f
JOIN film_actor AS fa ON f.film_id = fa.film_id
JOIN actor AS a ON fa.actor_id = a.actor_id
GROUP BY first_name, last_name;

SELECT AVG(DATEDIFF(return_date, rental_date)), first_name, last_name FROM rental AS r
JOIN inventory AS i ON r.inventory_id = i.inventory_id
JOIN film AS f ON i.film_id = f.film_id
JOIN film_actor AS fa ON i.film_id = fa.film_id
JOIN actor AS a ON fa.actor_id = a.actor_id
GROUP BY a.first_name, a.last_name;

#4. argent depensé au video club par chaque client, classé par ordre décroissant
SELECT SUM(payment.amount), customer.last_name, customer.first_name FROM payment
JOIN customer ON customer.customer_id = payment.customer_id
JOIN store ON store.store_id = customer.store_id
GROUP BY customer.first_name, customer.last_name
ORDER BY SUM(payment.amount) DESC;

#5. afficher tout les films ayant été loués 10 fois ou plus
