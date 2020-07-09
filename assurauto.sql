CREATE database assurauto;

USE assurauto;

CREATE TABLE Clients(
	CL_ID INT NOT NULL PRIMARY KEY,
	CL_nom VARCHAR(30) NOT NULL,
	CL_prenom VARCHAR(30) NOT NULL,
	CL_adresse VARCHAR(45) NOT NULL,
	CL_codepostale VARCHAR(5) NOT NULL,
	CL_ville VARCHAR(50) NOT NULL CHECK(CL_ville IN (Cannes)),
	CL_coordonées VARCHAR(50) NOT NULL
);

CREATE TABLE Contrat(
	CO_ID INT NOT NULL PRIMARY KEY,
	CO_NUM VARCHAR(45) NOT NULL,
	CO_DATE DATE NOT NULL,
	CO_CATEGORIE VARCHAR(15) NOT NULL,
	CO_AVENANT VARCHAR(45) NOT NULL,
	CO_BONUS VARCHAR(45) NOT NULL,
	CO_MALUS VARCHAR(45) NOT NULL,
	CO_Clients_FK INT NOT NULL,
    FOREIGN KEY (CO_Clients_FK) REFERENCES Clients(CL_ID)
);


INSERT INTO Clients (CL_ID, CL_nom, CL_tel, CL_prenom, CL_adresse, CL_codepostale, CL_ville) VALUE
(1, 'Courrier', 'Kaïs', '0634245890', 'Boulevard 1er', '06600', 'Cannes'),
(2, 'Dubois', 'Martin', '0892374083', 'Rue du train', '06630', 'Cannes'),
(3, 'Lanbert', 'Zelda', '0665453535', 'adfhk', '07656', 'Cannes');

INSERT INTO Contrat (CO_ID, CO_NUM, CO_DATE, CO_CATEGORIE, CO_BONUS, CO_MALUS, CO_Clients_FK) VALUE
(1, '19', '2001/03/19', 'tiers', '23', '0', 1),
(2, '45', '1988/06/04', 'tout rique', '16', '0', 2),
(3, '98', '1972/02/29', 'tiers', '0', '7', 3);
