-- Création de la table Auteur
CREATE TABLE Auteur (
    id_auteur SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100)
);

-- Création de la table Editeur
CREATE TABLE Editeur (
    id_editeur SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL
);

-- Création de la table Genre
CREATE TABLE Genre (
    id_genre SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL
);

-- Création de la table Emplacement
CREATE TABLE Emplacement (
    id_emplacement SERIAL PRIMARY KEY,
    rangee VARCHAR(100) NOT NULL
);

-- Création de la table Livre
CREATE TABLE Livre (
    num_ISBN VARCHAR(13) PRIMARY KEY,
    titre VARCHAR(255) NOT NULL,
    id_editeur INT REFERENCES Editeur(id_editeur),
    date_publication DATE,
    id_genre INT REFERENCES Genre(id_genre),
    nb_exemplaire INT,
    id_emplacement INT REFERENCES Emplacement(id_emplacement)
);

-- Création de la table Role
CREATE TABLE Role (
    id_role SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL
);
-- Création de la table Utilisateur
CREATE TABLE Utilisateur (
    id_utilisateur SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    mail VARCHAR(255),
    num_tel VARCHAR(15),
    mot_de_passe VARCHAR(255),
    id_role INT REFERENCES Role(id_role)
);

-- Création de la table Membre
CREATE TABLE Membre (
    id_membre SERIAL PRIMARY KEY,
    adresse TEXT,
    date_naissance DATE,
    date_inscription DATE DEFAULT CURRENT_DATE,
    id_utilisateur INT REFERENCES Utilisateur(id_utilisateur)
);

-- Création de la table Emprunt
CREATE TABLE Emprunt (
    num_ISBN VARCHAR(13) REFERENCES Livre(num_ISBN),
    id_membre INT REFERENCES Membre(id_membre),
    date_emprunt DATE DEFAULT CURRENT_DATE,
    date_retour_prevu DATE,
    date_retour DATE,
    amende DECIMAL(8, 2),
    PRIMARY KEY (num_ISBN, id_membre)
);

-- Création de la table Creation
CREATE TABLE Creation (
    id_auteur INT REFERENCES Auteur(id_auteur),
    num_ISBN VARCHAR(13) REFERENCES Livre(num_ISBN),
    PRIMARY KEY (id_auteur, num_ISBN)
);

