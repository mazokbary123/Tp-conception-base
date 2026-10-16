## Etape1
PLAT(**id_plat**, nom, prix) (nouveau)
## Etape2
CATEGORIE(**id_categorie**, libelle) (nouveau)
PLAT(**id_plat**, nom, prix, #id_categorie) (modifie)

## Etape3
COMMANDE(**id_commande**, date_commande) (nouveau)
LIGNE_COMMANDE(**#id_commande**, **#id_plat**, quantite) (nouveau)

## Etape4
CLIENT(**id_client**, nom, telephone?) (nouveau)
COMMANDE(**id_commande**, date_commande, #id_client?) (modifie)

## Etape5
SERVEUR(**id_serveur**, nom) (nouveau)
TABLE_SALLE(**id_table**, numero) (nouveau)
COMMANDE(**id_commande**, date_commande, #id_client?, #id_serveur, #id_table?) (modifie)