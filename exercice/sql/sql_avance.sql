USE sakila;

SET lc_time_names = 'fr_FR';

#1. emprunt ayant été réalisé en 2006. Le mois doit ê écrit en toute lettre
SELECT *, 
	CONCAT(DAY(rental_date),' ', 
    CASE MONTH(rental_date)
         WHEN 1 THEN 'janvier'
         WHEN 2 THEN 'février'
         WHEN 3 THEN 'mars'
         WHEN 4 THEN 'avril'
         WHEN 5 THEN 'mai'
         WHEN 6 THEN 'juin'
         WHEN 7 THEN 'juillet'
         WHEN 8 THEN 'août'
         WHEN 9 THEN 'septembre'
         WHEN 10 THEN 'octobre'
         WHEN 11 THEN 'novembre'
         ELSE 'décembre'
	END, 
    ' ', YEAR(rental_date)) AS cas_du_case,
    CONCAT(DAY(rental_date),' ',MONTHNAME(rental_date),' ',YEAR(rental_date)),
    DATE_FORMAT(rental_date, '%d %M %Y')
FROM rental
WHERE YEAR(rental_date) = 2006 ;

#2. colonne qui donne la durée de location des films en jour
SELECT *, DATEDIFF(return_date, rental_date) AS duree_location
FROM rental;

#3. emprunt réalisé avt 1h du matin en 2005. date en format lisible
SELECT *,DATE_FORMAT(rental_date, '%d %M %Y')
FROM rental
WHERE YEAR(rental_date) = 2005
#and extract(HOUR from rental_date)<1;
#and hour(rental_date)<1;
AND TIME(rental_date) < '01:00:00';

#4. emprunt réalisé entre le mois d'avril et mai. trié du plus ancien au plus récent
SELECT * 
FROM rental
WHERE MONTH(rental_date) IN (4,5)
ORDER BY rental_date;

#5. film dt le nom ne commence pas par le "Le"
select title 
from film
#where title not like 'Le%';
where LEFT(title,2) <> 'Le';

#6. film ayant mention "PG-13" ou "NC-17". 
# Ajout colonne qui affichera "oui" si "NC-17" et "non" sinon.
SELECT	*, 
CASE rating
	WHEN 'NC-17' THEN 'oui'
	ELSE 'non'
	END AS 'oui ou non',
# on peut faire avec IF
IF(rating='NC-17','oui','non') AS 'avec_is'
FROM film
WHERE rating IN ('PG-13','NC-17');

#7. liste des categorie qui commence par un "A" ou "C"
SELECT * 
FROM category
WHERE LEFT(name,1) IN ('A','C');

#8. 3 1er catégorie des noms des categories
SELECT LEFT(name,3)
FROM category;

#9. 1er acteur en remplaçant dans leur prenom les E par des A
SELECT *, REPLACE(first_name,'E','A') AS modified_first_name
FROM actor
LIMIT 100;
