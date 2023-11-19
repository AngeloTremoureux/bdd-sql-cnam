-- Ajout de contraintes à la table Livre
ALTER TABLE Livre
ADD CONSTRAINT check_nb_exemplaire_positive CHECK (nb_exemplaire >= 0),
ADD CONSTRAINT check_date_publication CHECK (date_publication <= CURRENT_DATE);

-- Ajout de contraintes à la table Emprunt
ALTER TABLE Emprunt
ADD CONSTRAINT check_date_retour CHECK (date_retour IS NULL OR date_retour >= date_emprunt);

-- Ajout de contraintes à la table Membre
ALTER TABLE Membre
ADD CONSTRAINT check_date_inscription CHECK (date_inscription >= date_naissance);
