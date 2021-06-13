#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Jul 22 10:52:01 2020

@author: simplon
"""
import pandas as pd
import sqlalchemy
from sqlalchemy import create_engine
import matplotlib.pyplot as plt

engine = create_engine('mysql+pymysql://Simplon:Simplon123!@localhost:3306/sakila')
city = pd.read_sql_query('SELECT city FROM city as c join address as a on c.city_id = a.city_id join store as s on a.address_id = s.address_id order by store_id;', engine)
print(city)


print("Taper 1 pour Lethbridge")
print("Taper 2 pour Woodridge")
choice = input("Sélectionner le nombre d'une ville parmi celle proposé : ") 
print(choice)

while not choice in ["1", "2"]:
    choice = input("Veuillez entrez un nombre valable :")

location = pd.read_sql_query('select count(r.rental_id) as nbr_location, date(rental_date) as date, s.store_id from rental as r join inventory as i on r.inventory_id = i.inventory_id join store as s on i.store_id = s.store_id join address as a on s.address_id = a.address_id join city as c on a.city_id = c.city_id where s.store_id = %s group by date;' %(choice), engine)

location.plot(kind='line', x='date', y='nbr_location', title= 'Evolution des locations', grid='default', figsize=(20,10))
print(location)


num_category = pd.read_sql_query('select category_id as n°, name from category;', engine)
selection = input("Veuillez choissir une categorie parmi les propositions : ")
while (not (selection.isdecimal() and int(selection) in range(17))):
    selection = input("Veuillez choissir un nombre entre 1 et 16 :")
    
category = pd.read_sql_query('select count(r.rental_id) as nbr_location, date(rental_date) as date from rental as r join inventory as i on r.inventory_id = i.inventory_id join store as s on i.store_id = s.store_id join address as a on s.address_id = a.address_id join city as c on a.city_id = c.city_id join film as f on i.film_id = f.film_id join film_category as fa on f.film_id = fa.film_id join category as ca on fa.category_id = ca.category_id where s.store_id = %s and ca.category_id = %s group by date;;' %(choice, selection), engine)

category.plot(kind='line', x='date', y='nbr_location', title= 'Evolution des locations de la categorie', grid='default', figsize=(20,10))
print(selection)


