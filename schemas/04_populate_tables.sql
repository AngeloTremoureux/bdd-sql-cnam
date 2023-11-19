
-- Auteur
INSERT INTO Auteur (nom, prenom) VALUES
('Tolkien', 'J.R.R.'),
('Orwell', 'George'),
('Rowling', 'J.K.'),
('Dahl', 'Roald'),
('Adams', 'Douglas');

-- Editeur
INSERT INTO Editeur (nom) VALUES
('Hachette'),
('Penguin'),
('Bloomsbury'),
('Puffin'),
('Del Rey');

-- Genre
INSERT INTO Genre (nom) VALUES
('Fantasy'),
('Dystopian'),
('Childrens Literature'),
('Science Fiction');

-- Emplacement
INSERT INTO Emplacement (rangee) VALUES
('A1'),
('B2'),
('C3'),
('D4'),
('E5');

-- Livre
INSERT INTO Livre (num_ISBN, titre, id_editeur, date_publication, id_genre, nb_exemplaire, id_emplacement) VALUES
('9780123456789', 'Le Seigneur des Anneaux', 1, '1954-07-29', 1, 10, 1),
('9780451524935', '1984', 2, '1949-06-08', 2, 8, 2),
('9780061120084', 'Harry Potter à lecole des sorciers', 3, '1997-06-26', 1, 15, 3),
('9780140328721', 'Matilda', 4, '1988-10-01', 3, 12, 4),
('9780553382563', 'The Hitchhikers Guide to the Galaxy', 5, '1979-10-12', 4, 7, 5);

-- Role
INSERT INTO Role (nom) VALUES
('Admin'),
('Utilisateur');

-- Utilisateur
INSERT INTO Utilisateur (nom, prenom, mail, num_tel, mot_de_passe, id_role) VALUES
('Dupont', 'Pierre', 'pierre.dupont@email.com', '0123456789', 'motdepasse123', 1),
('Martin', 'Sophie', 'sophie.martin@email.com', '9876543210', 'mdp456', 2);

-- Membre
INSERT INTO Membre (adresse, date_naissance, date_inscription, id_utilisateur) VALUES
('15 rue de la Bibliotheque', '1980-01-01', CURRENT_DATE, 2),
('8 avenue des Livres', '1995-05-15', CURRENT_DATE, 2);

-- Emprunt
INSERT INTO Emprunt (num_ISBN, id_membre, date_emprunt, date_retour_prevu, date_retour, amende) VALUES
('9780123456789', 1, '2023-11-09', '2023-11-16', NULL, NULL),
('9780451524935', 2, '2023-11-09', '2023-11-16', NULL, NULL);

-- Creation
INSERT INTO Creation (id_auteur, num_ISBN) VALUES
(1, '9780123456789'),
(2, '9780451524935'),
(3, '9780061120084'),
(4, '9780140328721'),
(5, '9780553382563');