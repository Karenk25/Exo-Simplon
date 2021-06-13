#Faire la procédure de mise à jour de Film
#Créer un test unitaire sur cette procédure

DELIMITER $$
CREATE PROCEDURE PIU_film(IN idfilm SMALLINT(5), IN titre VARCHAR(45), IN descriptif TEXT(45),IN DateSortie YEAR,IN languageId TINYINT,IN LanguageOriginalId TINYINT,IN DureeLoc TINYINT,
IN DateRentre DECIMAL(4,2),IN longueur SMALLINT(5), IN coupRemplace DECIMAL(4,2), IN rat ENUM('G', 'PG', 'PG-13', 'R', 'NC-17'), IN special SET('Trailers', 'Commentaries', 'Deleted Scenes', 'Behind the Scenes') )
BEGIN
    IF EXISTS (SELECT * FROM language WHERE language_id = languageId)
    THEN
        IF EXISTS(SELECT * FROM film WHERE film_id = idfilm)
        THEN 
            UPDATE film
                SET title = titre,
                    description = descriptif,
                    release_year = DateSortie,
                    language_id = languageId,
                    original_language_id = LanguageOriginalId,
                    rental_duration = DureeLoc,
                    rental_rate = DateRentre,
                    length = longueur,
                    remplacement_cost = coupRemplace,
                    rating = rat,
                    special_features = special
            WHERE film_id = idfilm;
        ELSE
            INSERT INTO film(title,description,release_year, language_id,original_language_id,rental_duration, 
            rental_rate,length,remplacement_cost, rating,special_features) 
            VALUES(idfilm, titre,descriptif,DateSortie,languageId,LanguageOriginalId,DureeLoc, 
            DateRentre,longueur,coupRemplace,rat,special);
        END IF;
    ELSE
        SIGNAL SQLSTATE '3458'
            SET MESSAGE_TEXT = " Ce film n'existe pas ";
    END IF;
END$$


DELIMITER ;
start transaction;
	INSERT INTO language VALUES(8, 'francpagne',now())
    INSERT INTO film (film_id, title,language_id) VALUES('Antho Flash',8)
    SELECT * FROM film WHERE film_id = 1500;
    CALL PIU_film (1500, 'Regarder autre chose','Antho Flash', '2007', '1', '', '5', '3,55', '80', '20,99', 'PG', 'Nothing', '2006-01-15 04:44:33')
    
    
DELIMITER;



select * from film;




