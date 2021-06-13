# 4. L’infiniment petit

val = 1
print("XX" + "0123456789" * 5)
for i in range(50):
    val = val / 2
    print("{0:51.50f}".format(val))
	
	
# 5. Compter les nombres à deux chiffres contenant le chiffre 7

nb = 0

for i in range(10,99) :
    dizaine = i // 10
    unite = i - 10 * dizaine
    if dizaine == 7 or unite == 7 :
        nb = nb + 1

print("Réponse : ",nb)


# 6. Compter les consommes dans un mot

print("Entrez un mot")

mot = input()
mot = mot.upper()
nb_voyelles = 0
nb_lettres = len(mot)

for i in range(nb_lettres) :
    lettre = mot[i]
    if lettre == "A" or lettre == "E" or lettre == "I" or lettre == "O" or lettre == "U" or lettre == "Y" :
        nb_voyelles = nb_voyelles + 1

nb_consonnes = nb_lettres - nb_voyelles

print ("Nombre de consommes : ", nb_consonnes )



# 7. Encoder et décrypter un nom

print("Entrez le nom à coder : ")

nom = input()
nom = nom.upper()
SECRET = ""

for i in range(len(nom)):
    ascii = ord(nom[i])
    code = ascii + 3
    if code > ord('Z') :
        code -= 26 # code = code - 26
    SECRET += chr(code) # secret = secret + chr(code)
    
print("CODE : ",SECRET)
print("\n----------")

print("Entrez le nom à décoder : ")

nom = input()
nom = nom.upper()
DECODE = ""

for i in range(len(nom)):
    ascii = ord(nom[i])
    code = ascii - 3
    if code < ord('A') :
        code += 26 # code = code + 26
    DECODE += chr(code) # DECODE = DECODE + chr(ord)
    
print("EN CLAIR : ",DECODE)