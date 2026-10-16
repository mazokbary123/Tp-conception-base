CREATE TABLE serveur (
    id_serveur INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom        VARCHAR(100) NOT NULL
);


CREATE TABLE table_salle (
    id_table INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    numero   INTEGER NOT NULL UNIQUE CHECK (numero > 0)
);

INSERT INTO serveur (nom) VALUES
('Njaka Rakoto'),
('Lalao Rasoa');

INSERT INTO table_salle (numero) VALUES
(1), (2), (3), (4), (5), (6), (7), (8);


ALTER TABLE commande
    ADD COLUMN id_serveur INTEGER REFERENCES serveur (id_serveur);


ALTER TABLE commande
    ADD COLUMN id_table INTEGER REFERENCES table_salle (id_table);


UPDATE commande SET
    id_serveur = (SELECT id_serveur FROM serveur WHERE nom = 'Njaka Rakoto'),
    id_table   = (SELECT id_table FROM table_salle WHERE numero = 3)
WHERE id_commande = 1;

UPDATE commande SET
    id_serveur = (SELECT id_serveur FROM serveur WHERE nom = 'Lalao Rasoa'),
    id_table   = NULL                       -- a emporter
WHERE id_commande = 2;

UPDATE commande SET
    id_serveur = (SELECT id_serveur FROM serveur WHERE nom = 'Njaka Rakoto'),
    id_table   = (SELECT id_table FROM table_salle WHERE numero = 5)
WHERE id_commande = 3;

ALTER TABLE commande
    ALTER COLUMN id_serveur SET NOT NULL;