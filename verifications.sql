SELECT nom, prix FROM plat ORDER BY prix DESC;

//Etape2
SELECT c.libelle, COUNT(p.id_plat) AS nb_plats
FROM categorie c
LEFT JOIN plat p ON p.id_categorie = c.id_categorie
GROUP BY c.id_categorie, c.libelle
ORDER BY c.id_categorie;

SELECT p.nom       AS plat,
       c.libelle   AS categorie,
       p.prix
FROM plat p
JOIN categorie c ON c.id_categorie = p.id_categorie
ORDER BY c.id_categorie, p.prix DESC;


//Etape3
SELECT c.id_commande, c.date_commande,
       SUM(lc.quantite * p.prix) AS montant_total
FROM commande c
JOIN ligne_commande lc ON lc.id_commande = c.id_commande
JOIN plat p ON p.id_plat = lc.id_plat
GROUP BY c.id_commande, c.date_commande
ORDER BY c.id_commande;

//Etape4
SELECT c.id_commande,
       c.date_commande,
       COALESCE(cl.nom, 'client de passage') AS client
FROM commande c
LEFT JOIN client cl ON cl.id_client = c.id_client
ORDER BY c.id_commande;
