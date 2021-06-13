DELIMITER |
CREATE PROCEDURE supp_director (
							in director_id int,
                            in director varchar(100)

/*Label de sortie */
sortie :                            
BEGIN
START TRANSACTION;
if not exists(select* from director where director_id=id) then 
		signal sqlstate '50003' set message_text='ce director n existe pas ';
	end if;
	delete from director where director_id=id; 
    
if exists(select* from director where director_id=id) then 
		signal sqlstate '50003' set message_text='ce director existe' 
        ROLLBACK;
        LEAVE sortie;
	end if;

END IF;

/*Valider la transaction*/
COMMIT;    
END |
DELIMITER ;