CREATE TABLE client (
    id_client INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom       VARCHAR(100) NOT NULL
);
ALTER TABLE commande
    ADD COLUMN id_client INTEGER REFERENCES client (id_client);


INSERT INTO client (nom) VALUES
('Hery Randria'),
('Voahangy Rakoto');

UPDATE commande SET id_client = (SELECT id_client FROM client WHERE nom = 'Hery Randria')
WHERE id_commande = 1;

UPDATE commande SET id_client = (SELECT id_client FROM client WHERE nom = 'Voahangy Rakoto')
WHERE id_commande = 3;