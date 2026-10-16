CREATE TABLE mode_paiement (
    id_mode INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    libelle VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE paiement (
    id_paiement INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_commande INTEGER NOT NULL REFERENCES commande (id_commande),
    id_mode     INTEGER NOT NULL REFERENCES mode_paiement (id_mode),
    montant     INTEGER NOT NULL CHECK (montant > 0),
    reference   VARCHAR(50)          -- facultatif : référence de la transaction mobile money
);

-- Données de test
INSERT INTO mode_paiement (libelle) VALUES
('Espèces'),
('MVola'),
('Orange Money'),
('Airtel Money');

INSERT INTO paiement (id_commande, id_mode, montant, reference) VALUES
(1, (SELECT id_mode FROM mode_paiement WHERE libelle = 'Espèces'), 10000, NULL),
(1, (SELECT id_mode FROM mode_paiement WHERE libelle = 'MVola'),    5000, 'MV261012A01');

INSERT INTO paiement (id_commande, id_mode, montant, reference) VALUES
(2, (SELECT id_mode FROM mode_paiement WHERE libelle = 'Orange Money'), 6000, 'OM261013B07');