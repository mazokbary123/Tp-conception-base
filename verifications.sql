SELECT nom, prix FROM plat ORDER BY prix DESC;

--Etape2
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


--Etape3
SELECT c.id_commande, c.date_commande,
       SUM(lc.quantite * p.prix) AS montant_total
FROM commande c
JOIN ligne_commande lc ON lc.id_commande = c.id_commande
JOIN plat p ON p.id_plat = lc.id_plat
GROUP BY c.id_commande, c.date_commande
ORDER BY c.id_commande;

--Etape4
SELECT c.id_commande,
       c.date_commande,
       COALESCE(cl.nom, 'client de passage') AS client
FROM commande c
LEFT JOIN client cl ON cl.id_client = c.id_client
ORDER BY c.id_commande;

--Etape5
SELECT s.nom AS serveur,
       COUNT(DISTINCT c.id_commande)          AS nb_commandes,
       COALESCE(SUM(lc.quantite * p.prix), 0) AS chiffre_affaires
FROM serveur s
LEFT JOIN commande c        ON c.id_serveur = s.id_serveur
LEFT JOIN ligne_commande lc ON lc.id_commande = c.id_commande
LEFT JOIN plat p            ON p.id_plat = lc.id_plat
GROUP BY s.id_serveur, s.nom
ORDER BY s.id_serveur;

--Etape6
WITH total AS (
    SELECT lc.id_commande, SUM(lc.quantite * p.prix) AS montant_du
    FROM ligne_commande lc
    JOIN plat p ON p.id_plat = lc.id_plat
    GROUP BY lc.id_commande
), paye AS (
    SELECT id_commande, SUM(montant) AS montant_paye
    FROM paiement
    GROUP BY id_commande
)
SELECT c.id_commande, c.date_commande, t.montant_du,
       COALESCE(pa.montant_paye, 0)                AS montant_paye,
       t.montant_du - COALESCE(pa.montant_paye, 0) AS reste_a_payer
FROM commande c
JOIN total t      ON t.id_commande = c.id_commande
LEFT JOIN paye pa ON pa.id_commande = c.id_commande
WHERE t.montant_du - COALESCE(pa.montant_paye, 0) > 0
ORDER BY c.id_commande;

--Etape7
-- Montant de chaque commande : maintenant calcule avec le prix fige
SELECT c.id_commande, c.date_commande,
       SUM(lc.quantite * lc.prix_unitaire) AS montant_total
FROM commande c
JOIN ligne_commande lc ON lc.id_commande = c.id_commande
GROUP BY c.id_commande, c.date_commande
ORDER BY c.id_commande;

-- Bonus : historique des prix du romazava
SELECT p.nom, h.date_debut, h.prix
FROM historique_prix h
JOIN plat p ON p.id_plat = h.id_plat
WHERE p.nom = 'Romazava'
ORDER BY h.date_debut;