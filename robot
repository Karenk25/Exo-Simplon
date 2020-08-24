#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Aug 19 11:07:03 2020

@author: simplon
"""
import random

demarrage = ["Comment allez-vous ?",
             "Pourquoi venez-vous me voir?",
             "Comment s'est passée votre journée ?"
             ]
mot_cle = ["père", "mère", "copain", "copine",
           "maman", "ami", "amie"]

premiere_reponse = ["Commant va votre {0}",
                    "La relation avec {0} vous pose-t-elle problème ?",
                    "Pourquoi pensez-vous en ce moment à votre {0} ?"]

reponse_interrogation = ["Pourquoi me posez-vous cette question",
                         "Oseriez-vous poser cette question à un humain ?",
                         "Je ne peux malheureusement pas répondre à cette question."]

phrase_vague = ["J'entends bien.",
                "Je sens une pointe de regret.",
                "Est-ce une bonne nouvelle ?",
                "Oui, c'est ça le problème.",
                "Pensez-vous ce que vous dites ?",
                "Hum... Il se peut."]

           
demarrage_random = random.randint(0, len(demarrage)-1)
print(demarrage[demarrage_random])

reponse = input()
while reponse != "":
    for mot in mot_cle:
        if reponse.find(mot) != -1:
            rp = random.randint(0, len(premiere_reponse)-1)
            reponse = input(premiere_reponse[rp].format(mot))

    if reponse.find("?") != -1:
        rp = random.randint(0, len(reponse_interrogation)-1)
        reponse = input(reponse_interrogation[rp])
    else:
        rp = random.randint(0, len(phrase_vague)-1)
        reponse = input(phrase_vague[rp])



