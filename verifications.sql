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