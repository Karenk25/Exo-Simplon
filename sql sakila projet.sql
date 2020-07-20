#1- Afficher les 10 locations les plus longues (nom/prenom client, film, video club, durée)
SELECT rental_id, c.first_name, c.last_name, max(f.length) AS longueur FROM rental AS r
JOIN customer AS c ON r.customer_id = c.customer_id
JOIN store AS s ON c.store_id = s.store_id
JOIN inventory AS i ON s.store_id = i.store_id
JOIN film AS f ON i.film_id = f.film_id
GROUP BY rental_id
LIMIT 10;

#2- Afficher les 10 meilleurs clients actifs par montant dépensé (nom/prénom client, montant dépensé)
SELECT c.first_name, c.last_name, amount FROM customer AS c
JOIN rental AS r ON c.customer_id = r.customer_id
JOIN payment AS p ON r.rental_id = p.rental_id
ORDER BY amount DESC
LIMIT 10;

#3- Afficher la durée moyenne de location par film triée de manière descendante
SELECT AVG(TIMEDIFF(r.return_date, r.rental_date)), title FROM rental AS r
JOIN inventory AS i ON r.inventory_id = i.inventory_id
JOIN film AS f ON i.film_id= f.film_id
GROUP BY title
ORDER BY AVG(TIMEDIFF(r.return_date, r.rental_date)) DESC

#4- Afficher tous les films n'ayant jamais été empruntés
SELECT title, TIMEDIFF(r.return_date, r.rental_date) FROM film AS f
JOIN inventory AS i ON f.film_id = i.film_id
JOIN rental AS r ON i.inventory_id = r.inventory_id
WHERE TIMEDIFF(r.return_date, r.rental_date) IS NULL;

#5- Afficher le nombre d'employés (staff) par video club (store)
SELECT COUNT(*) FROM staff AS s
JOIN store AS st ON s.store_id = st.store_id;

#6- Afficher les 10 villes avec le plus de video clubs
SELECT city FROM city AS c
JOIN address AS a ON c.city_id = a.city_id
JOIN store AS s ON a.address_id = s.address_id
LIMIT 10;

#7- Afficher le film le plus long dans lequel joue JOHNNY LOLLOBRIGIDA
SELECT title, max(length), first_name, last_name FROM film AS f
JOIN film_actor AS fa ON f.film_id = fa.film_id
JOIN actor AS a ON fa.actor_id = a.actor_id
WHERE (first_name = 'JOHNNY' AND last_name = 'LOLLOBRIGIDA')
GROUP BY title
LIMIT 1;

#8- Afficher le temps moyen de location du film 'Academy dinosaur'
SELECT title, AVG(DATEDIFF(return_date, rental_date)) FROM rental AS r
JOIN inventory AS i ON r.inventory_id = i.inventory_id
JOIN film AS f ON i.film_id = f.film_id
WHERE title = 'Academy dinosaur'
GROUP BY title;

#9- Afficher les films avec plus de deux exemplaires en invenataire (store id, titre du film, nombre d'exemplaires)
SELECT title, COUNT(inventory_id) FROM inventory AS i
JOIN film AS f ON i.film_id = f.film_id
JOIN store AS s ON i.store_id = s.store_id
GROUP BY title
HAVING COUNT(inventory_id) >= 2;

#10- Lister les films contenant 'din' dans le titre
SELECT title FROM film
WHERE title LIKE '%din%';

#11- Lister les 5 films les plus empruntés
SELECT title, COUNT(rental_date) FROM film AS f
JOIN inventory AS i ON f.film_id = i.film_id
JOIN rental AS r ON i.inventory_id = r.inventory_id
GROUP BY title
ORDER BY COUNT(rental_date) DESC
LIMIT 5;

#12- Lister les films sortis en 2003, 2005 et 2006
SELECT title, release_year FROM film
WHERE release_year IN ('2003', '2005', '2006');

#13- Afficher les films ayant été empruntés mais n'ayant pas encore été restitués, triés par date d'emprunt. 
#Afficher seulement les 10 premiers.
SELECT title, rental_date, return_date FROM film AS f
JOIN inventory AS i ON f.film_id = i.film_id
JOIN rental AS r ON i.inventory_id = r.inventory_id
WHERE (rental_date IS NOT NULL AND return_date IS NULL)
ORDER BY rental_date ASC
LIMIT 10;

#14- Afficher les films d'action durant plus de 2h
SELECT title, length, name FROM film AS f
JOIN film_category AS fa ON f.film_id = fa.film_id
JOIN category AS c ON fa.category_id = c.category_id
WHERE name ='action'
AND length >= 120;

#15- Afficher tous les utilisateurs ayant emprunté des films avec la mention NC-17
SELECT c.first_name, c.last_name, f.rating FROM film AS f
JOIN inventory AS i ON f.film_id = i.film_id
JOIN rental AS r ON i.inventory_id = r.inventory_id
JOIN customer AS c ON r.customer_id = c.customer_id
WHERE rating IN ('NC-17');

#16- Afficher les films d'animation dont la langue originale est l'anglais
SELECT c.name, f.title, l.name FROM category AS c
JOIN film_category AS fa ON c.category_id = fa.category_id
JOIN film AS f ON fa.film_id = f.film_id
JOIN language AS l ON f.language_id = l.language_id
WHERE (c.name = 'animation' AND l.name ='english')

#17- Afficher les films dans lesquels une actrice nommée Jennifer a joué (bonus: en même temps qu'un acteur nommé Johnny)
SELECT title, first_name FROM film AS f
JOIN film_actor AS fa ON f.film_id = fa.film_id
JOIN actor AS a ON fa.actor_id = a.actor_id
WHERE first_name IN ('Jennifer','Johnny');

#18- Quelles sont les 3 catégories les plus empruntées?
SELECT c.name, COUNT(rental_date) FROM category AS c
JOIN film_category AS fa ON c.category_id = fa.category_id
JOIN film AS f ON fa.film_id = f.film_id
JOIN inventory AS i ON f.film_id = i.film_id
JOIN rental AS r ON i.inventory_id = r.inventory_id
GROUP BY c.name
ORDER BY COUNT(rental_date) DESC
LIMIT 3;

#19- Quelles sont les 10 villes où on a fait le plus de locations?
SELECT city, COUNT(rental_date) FROM city AS c
JOIN address AS a ON c.city_id = a.city_id
JOIN customer AS cu ON a.address_id = cu.address_id
JOIN rental AS r ON cu.customer_id = r.customer_id
GROUP BY city
ORDER BY COUNT(rental_date) DESC
LIMIT 10;

#20- Lister les acteurs ayant joué dans au moins 1 film
SELECT first_name, last_name, COUNT(title) FROM actor AS a
JOIN film_actor AS fa ON a.actor_id = fa.actor_id
JOIN film AS f ON fa.film_id = f.film_id
GROUP BY first_name, last_name
HAVING COUNT(title) >=1;
