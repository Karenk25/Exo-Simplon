# 8. afficher les balises d’une page HTML

CodePageWeb = "<html><head><title>Mon Titre</title></head><body>Texte sur la page</body></html>"
print(CodePageWeb)

for i in range(len(CodePageWeb)):
    if CodePageWeb[i] == "<" :
        ifin = CodePageWeb.find(">", i)
        print(CodePageWeb[i+1:ifin])
		
		
		
# afficher le calendrier du mois

print("Entrez le nombre de jours dans le mois : ")
nbjours = int(input())
print("Entrez le premier jour du mois : 1 pour lundi, 7 pour dimanche")
ColDepart = int(input())
print("LUN MAR MER JEU VEN SAM DIM")
NbColVides = ColDepart - 1
LargeurCol = 4
print( " " * LargeurCol * NbColVides, end="")
ColCourante = ColDepart # 1 col du lundi, 7 col du dimanche

for i in range(nbjours) :
    print("{0:3d} ".format(i+1), end="")
    ColCourante = ColCourante + 1
    if ColCourante == 8 :
        print() # une nouvelle ligne commence
        ColCourante = 1


nb_jour = int(input("Entrez le nombre de jours dans le mois : "))
jour_mois = int(input("Entrez le premier jour du mois : 1 pour lundi, 7 pour dimanche : "))
print("LUN MAR MER JEU VEN SAM DIM")
col_vide = jour_mois - 1
largeur_colonne = 4
print( " "  * largeur_colonne * col_vide, end="")
colCourante = jour_mois # 1 col du lundi, 7 col du dimanche

for i in range(nb_jour):
    print("{0:3d} ".format(i+1), end="")
    colCourante =+ 1
    if colCourante == 8:
        print() #une nouvelle ligne commence
        colCourante = 1
