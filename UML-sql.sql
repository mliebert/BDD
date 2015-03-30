/* SQLEditor (MySQL (2))*/

CREATE TABLE Categorie
(
IDCategorie INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
`Nom catégorie` CHAR NOT NULL,
PRIMARY KEY (IDCategorie)
);

CREATE TABLE Client
(
IDClient INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
Nom CHAR NOT NULL,
Prenom CHAR NOT NULL,
VIlle CHAR NOT NULL,
Adresse CHAR NOT NULL,
Telephone CHAR,
Email CHAR NOT NULL,
`Mot de passe` CHAR NOT NULL,
`Date dinscription` DATE NOT NULL,
NBCommande INTEGER NOT NULL,
PRIMARY KEY (IDClient)
);

CREATE TABLE Commande
(
IDCommande INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
IDClient INTEGER,
IDRemise INTEGER,
`Date Commande` DATE NOT NULL,
`Prix HT` INTEGER NOT NULL,
`Prix TTC` INTEGER NOT NULL,
PRIMARY KEY (IDCommande),
FOREIGN KEY (IDRemise) REFERENCES Remise(IDRemise)
);

CREATE TABLE Entreprise
(
IDEntreprise INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
`Nom Entreprise` CHAR NOT NULL,
Rue CHAR NOT NULL,
Ville CHAR NOT NULL,
IDProduit INTEGER,
IDCategorie INTEGER,
PRIMARY KEY (IDEntreprise)
);

CREATE TABLE Livraison
(
IDEntreprise INTEGER NOT NULL,
IDProduit INTEGER NOT NULL,
IDcategorie INTEGER NOT NULL,
Quantité INTEGER NOT NULL, 
`Date livraison` DATE NOT NULL,
PRIMARY KEY (IDentreprise,IDProduit,IDcategorie,`Date livraison`)
);

CREATE TABLE Production
(
IDProduit INTEGER NOT NULL,
IDCategorie INTEGER NOT NULL,
IDEntreprise INTEGER NOT NULL,
`Mois de production` DATE NOT NULL,
`Lieu de production` CHAR NOT NULL,
PRIMARY KEY (IDproduit,IDCategorie,IDEntreprise)
);

CREATE TABLE Produit
(
IDProduit INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
IDCategorie INTEGER,
`Nom produit` CHAR NOT NULL,
Quantité INTEGER,
`Date dajout` DATE,
`Date de péremption` DATE,
`Prix unitaire` INTEGER,
PRIMARY KEY (IDProduit,IDCategorie)
);

CREATE TABLE Panier
(
IDPanier INTEGER NOT NULL AUTO_INCREMENT UNIQUE,
IDProduit INTEGER,
IDCategorie INTEGER,
Quantité INTEGER,
PRIMARY KEY (IDPanier)
);

CREATE TABLE Remise
(
IDRemise INTEGER NOT NULL UNIQUE,
`Type remise` CHAR NOT NULL,
Remise INTEGER,
`Condition nb commande` INTEGER NOT NULL,
PRIMARY KEY (IDRemise)
);


ALTER TABLE Commande ADD FOREIGN KEY IDClinent_idxfk (IDClinent) REFERENCES Client (IDClient);

ALTER TABLE Livraison ADD FOREIGN KEY IDcategorie_idxfk (IDcategorie) REFERENCES Entreprise (IDEntreprise);

ALTER TABLE Production ADD FOREIGN KEY IDEntreprise_idxfk (IDEntreprise) REFERENCES Entreprise (IDEntreprise);

ALTER TABLE Produit ADD FOREIGN KEY IDCategorie_idxfk (IDCategorie) REFERENCES Categorie (IDCategorie);

ALTER TABLE Panier ADD FOREIGN KEY IDProduit_idxfk (IDProduit,IDCategorie) REFERENCES Produit (IDProduit,IDCategorie);
