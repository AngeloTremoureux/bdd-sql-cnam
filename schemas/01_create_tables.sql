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
    PRIMARY KEY (num_ISBN, id_membre,date_emprunt)
);

-- Création de la table Creation
CREATE TABLE Creation (
    id_auteur INT REFERENCES Auteur(id_auteur),
    num_ISBN VARCHAR(13) REFERENCES Livre(num_ISBN),
    PRIMARY KEY (id_auteur, num_ISBN)
);

-- Table: public.user

-- DROP TABLE IF EXISTS public."user";

CREATE TABLE IF NOT EXISTS public."user"
(
    id integer NOT NULL,
    email character varying(180) COLLATE pg_catalog."default" NOT NULL,
    roles json NOT NULL,
    password character varying(255) COLLATE pg_catalog."default" NOT NULL,
    nom character varying(255) COLLATE pg_catalog."default" NOT NULL,
    prenom character varying(255) COLLATE pg_catalog."default" NOT NULL,
    
    num_tel VARCHAR(15)  COLLATE pg_catalog."default" NULL,
    CONSTRAINT user_pkey PRIMARY KEY (id)
);
 
-- Table: public.doctrine_migration_versions

-- DROP TABLE IF EXISTS public.doctrine_migration_versions;

CREATE TABLE IF NOT EXISTS public.doctrine_migration_versions
(
    version character varying(191) COLLATE pg_catalog."default" NOT NULL,
    executed_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    execution_time integer,
    CONSTRAINT doctrine_migration_versions_pkey PRIMARY KEY (version)
);
