USE netflix;

DROP PROCEDURE IF EXISTS checkDirector;

DELIMITER fin
CREATE PROCEDURE checkDirector(IN director_name VARCHAR(100))
IF EXISTS(SELECT * FROM director WHERE director.director_name = director_name)
THEN
    IF NOT EXISTS(SELECT * FROM catalog_director JOIN director ON catalog_director.director_id = director.director_id WHERE director.director_name = director_name)
    THEN
        DELETE FROM director WHERE director.director_id = director_id;
    END IF;
END IF fin