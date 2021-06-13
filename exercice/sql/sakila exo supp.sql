#1- Quels acteurs ont le prénom "Scarlett "
SELECT * FROM actor
WHERE first_name = 'Scarlett';

#2- Quels acteurs ont le nom de famille "Johansson "
SELECT * FROM actor
WHERE last_name = 'Johansson';

#3- Combien de noms de famille d'acteurs distincts y a-t-il ? 
SELECT COUNT(DISTINCT(last_name)) FROM actor;

#4- Quels noms de famille ne sont pas répétés ? 
SELECT last_name FROM actor
GROUP BY last_name
HAVING COUNT(*) = 1;

#5- Quels noms de famille apparaissent plus d'une fois ? 
SELECT last_name FROM actor
GROUP BY last_name
HAVING COUNT(*) > 1;

#6- Quel acteur est apparu dans le plus grand nombre de films ? 
SELECT a.actor_id, a.last_name, a.first_name, COUNT(a.actor_id) AS film_count
FROM actor AS a
JOIN film_actor AS fa ON a.actor_id = fa.actor_id
JOIN film AS f ON fa.film_id = f.film_id
GROUP BY actor_id 
ORDER BY film_count DESC
LIMIT 1;

#7- Insérez un enregistrement représentant Mary Smith louant "Academy Dinosaur" de Mike Hillyer au magasin 1 aujourd'hui. 
INSERT INTO rental (first_name, last_name)



#8- Quand "Academy Dinosaur" doit-il sortir ? 
select title, release_year from film
where title = 'Academy Dinosaur';

#9- Quelle est la durée moyenne de tous les films ? 
select avg(length) from film;


#10- Quelle est la durée moyenne des films par catégorie ?
SELECT AVG(f.length), c.name FROM film AS f
JOIN film_category AS fc ON f.film_id = fc.film_id
JOIN category AS c ON fc.category_id = c.category_id
GROUP BY name
ORDER BY AVG(length) DESC;


