#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jul 20 12:30:36 2020

@author: simplon
"""

import pandas as pd
import sqlalchemy
from sqlalchemy import create_engine

engine = create_engine('mysql+pymysql://Simplon:Simplon123!@localhost:3306/simplon')
data = pd.read_sql_query('SELECT * FROM jeux_video', engine)
print(data)

engine = create_engine('mysql+pymysql://Simplon:Simplon123!@localhost:3306/assurauto')
data2 = pd.read_sql_query('SELECT * FROM clients', engine)
print(data2)


CL_ID =pd.read_sql_query('select max(Cl_ID) from clients',engine)
CL_ID = CL_ID.iloc [0,0] + 1

CL_nom = str.upper(input("Entrez votre nom : "))
CL_prenom = str(input("Entrez votre prenom : "))
CL_adresse = str(input("Entrez votre adresse : "))

CL_codepostale = input("Entrez votre codepostale : ")
while not CL_codepostale.isdigit():
    print("Veuiller entrez un codepostal valable")
    CL_codepostale = input("Entrez votre codepostale : ")

CL_ville = str(input("Entrez votre ville : "))
CL_coordonées = str(input("Entrez vos coordonnées : "))


N = engine.execute('INSERT INTO clients (CL_ID, CL_nom, CL_prenom, CL_adresse, CL_codepostale, CL_ville, CL_coordonées) VALUES (%s, "%s", "%s", "%s", "%s", "%s", "%s");' %(CL_ID, CL_nom, CL_prenom, CL_adresse, CL_codepostale, CL_ville, CL_coordonées));
print(N)


co_id =pd.read_sql_query('select max(co_id) from contrat',engine)
co_id = co_id.iloc [0,0] + 1
co_num = input("Entrez votre numéro de contrat : ")
co_date = "2020-12-06"
co_categorie = 'Tout risque'
co_bonus = '18'
co_malus = '0'
cl_id_fk = CL_ID

engine.execute('INSERT INTO contrat (co_id, co_num, co_date, co_categorie, co_bonus, co_malus, cl_id_fk) VALUES (%s, "%s", "%s", "%s", "%s", "%s", %s);' %(co_id, co_num, co_date, co_categorie, co_bonus, co_malus, cl_id_fk));




