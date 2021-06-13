#1. 10 premier films ainsi que leur langues
SELECT title, name FROM film AS f
JOIN language AS l ON f.language_id = l.language_id
LIMIT 10;

#2. film dans les quel à joué "JENNIFER DAVIS" sortie en 2006
SELECT title, release_year, first_name, last_name FROM film AS f
JOIN film_actor AS fa ON f.film_id = fa.film_id
JOIN actor AS a ON fa.actor_id = a.actor_id
WHERE (first_name = 'JENNIFER' AND last_name = 'DAVIS')
AND release_year = 2006;

#3. nom des client ayant emprunté "ALABAMA DEVIL"
SELECT first_name, last_name, title FROM customer AS c
JOIN rental AS r ON c.customer_id = r.customer_id
JOIN inventory AS i ON r.inventory_id = i.inventory_id
JOIN film AS f ON i.film_id = f.film_id
WHERE title = 'ALABAMA DEVIL';

#4. films louer par des personne habitant à « Woodridge ».
#union tout les films non loués et non pas seulement ceux de "Woodridge".
SELECT title FROM film AS f
JOIN inventory AS i ON f.film_id = i.film_id
JOIN rental AS r ON i.inventory_id = r.inventory_id
JOIN customer AS cu ON r.customer_id = cu.customer_id
JOIN address AS a ON cu.address_id = a.address_id
JOIN city AS c ON a.city_id = c.city_id
WHERE city = 'Woodridge'
UNION
SELECT title FROM film AS f
JOIN inventory AS i ON f.film_id = i.film_id
LEFT JOIN rental AS r ON i.inventory_id = r.inventory_id
WHERE r.inventory_id IS NULL;

#5 10 films dont la durée d'emprunt ont été le plus courtes
SELECT F.title,
TIMESTAMPDIFF(HOUR, UNIX_TIMESTAMP(RE.rental_date), UNIX_TIMESTAMP(RE.return_date)) as Duree
FROM rental AS RE
INNER JOIN inventory AS INV 
ON INV.inventory_ID=RE.inventory_id 
INNER JOIN film AS F 
ON F.film_id=INV.film_id 
HAVING Duree IS NOT NULL 
ORDER BY Duree ASC 
LIMIT 10;
select title,datediff(R.return_date,R.rental_date) 
from film as F
join inventory as I on F.film_id = I.film_id
join rental as R on I.inventory_id = R.inventory_id
where datediff(R.return_date,R.rental_date)  IS NOT NULL
ORDER BY datediff(R.return_date,R.rental_date) 
LIMIT 10;

#6 Liste les film de la catégorie "action" ordonnés par ordre alphabétique
SELECT title, name FROM film as f
JOIN film_category AS fc ON f.film_id = fc.film_id
JOIN category AS c ON fc.category_id = c.category_id
WHERE name = 'Action'
ORDER BY title ASC;

#7. films dont la duré d'emprunt à été inférieur à 2 jour
SELECT title, TIMESTAMPDIFF(DAY, UNIX_TIMESTAMP(r.return_date), UNIX_TIMESTAMP(r.rental_date)) as duree
FROM rental AS r
JOIN inventory AS i ON r.inventory_id = i.inventory_id
JOIN film AS f ON i.film_id = f.film_id
HAVING duree < 2;

SELECT DISTINCT f.title#, TIMEDIFF(r.return_date, r.rental_date)
FROM film AS f 
JOIN inventory AS i ON f.film_id = i.film_id
JOIN rental AS r ON i.inventory_id = r.inventory_id
WHERE TIMEDIFF(r.return_date, r.rental_date) < '47:00:00'
AND TIMEDIFF(r.return_date, r.rental_date) IS NOT NULL;





