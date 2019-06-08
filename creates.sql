-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-05-16 19:29:42.332

-- tables
-- Table: DodatkoweUslugi
CREATE TABLE DodatkoweUslugi (
    id int NOT NULL,
    usluga varchar(30) NOT NULL,
    CONSTRAINT DodatkoweUslugi_pk PRIMARY KEY (id)
);

-- Table: Karnet
CREATE TABLE Karnet (
    id integer NOT NULL,
    warznoscDo date NOT NULL,
    Pakiet_id integer NOT NULL,
    Klient_id integer NOT NULL,
    CONSTRAINT Karnet_pk PRIMARY KEY (id)
);

-- Table: Klient
CREATE TABLE Klient (
    id integer NOT NULL,
    Imie varchar(30) NOT NULL,
    Nazwisko varchar(30) NOT NULL,
    dataUrodzenia date NOT NULL,
    CONSTRAINT Klient_pk PRIMARY KEY (id)
);

-- Table: ListaWejsc
CREATE TABLE ListaWejsc (
    id integer NOT NULL,
    GodzinaWejscia time NOT NULL,
    Placowka_id integer NOT NULL,
    Karnet_id integer NOT NULL,
    CONSTRAINT ListaWejsc_pk PRIMARY KEY (id)
);

-- Table: Pakiet
CREATE TABLE Pakiet (
    id integer NOT NULL,
    nazwa varchar(30) NOT NULL,
    mozliwoscWejsciaOd time NOT NULL,
    mozliwoscWejsciaDo time NOT NULL,
    CONSTRAINT Pakiet_pk PRIMARY KEY (id)
);

-- Table: Placowka
CREATE TABLE Placowka (
    id integer NOT NULL,
    Adres varchar(40) NOT NULL,
    godzinaOtwarcia time NOT NULL,
    godzinaZamkniecia time NOT NULL,
    CONSTRAINT Placowka_pk PRIMARY KEY (id)
);

-- Table: SaleWPlacowce
CREATE TABLE SaleWPlacowce (
    Placowka_id int NOT NULL,
    sala_id int NOT NULL,
    CONSTRAINT SaleWPlacowce_pk PRIMARY KEY (Placowka_id,sala_id)
);

-- Table: UslugiWPakietach
CREATE TABLE UslugiWPakietach (
    Pakiet_id integer NOT NULL,
    DodatkoweUslugi_id int NOT NULL,
    CONSTRAINT UslugiWPakietach_pk PRIMARY KEY (Pakiet_id,DodatkoweUslugi_id)
);

-- Table: sala
CREATE TABLE sala (
    id int NOT NULL,
    nazwa varchar(30) NOT NULL,
    CONSTRAINT sala_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: Karnet_Klient (table: Karnet)
ALTER TABLE Karnet ADD CONSTRAINT Karnet_Klient FOREIGN KEY Karnet_Klient (Klient_id)
    REFERENCES Klient (id);

-- Reference: Karnet_Pakiet (table: Karnet)
ALTER TABLE Karnet ADD CONSTRAINT Karnet_Pakiet FOREIGN KEY Karnet_Pakiet (Pakiet_id)
    REFERENCES Pakiet (id);

-- Reference: ListaWejsc_Karnet (table: ListaWejsc)
ALTER TABLE ListaWejsc ADD CONSTRAINT ListaWejsc_Karnet FOREIGN KEY ListaWejsc_Karnet (Karnet_id)
    REFERENCES Karnet (id);

-- Reference: ListaWejsc_Placowka (table: ListaWejsc)
ALTER TABLE ListaWejsc ADD CONSTRAINT ListaWejsc_Placowka FOREIGN KEY ListaWejsc_Placowka (Placowka_id)
    REFERENCES Placowka (id);

-- Reference: Table_10_DodatkoweUslugi (table: UslugiWPakietach)
ALTER TABLE UslugiWPakietach ADD CONSTRAINT Table_10_DodatkoweUslugi FOREIGN KEY Table_10_DodatkoweUslugi (DodatkoweUslugi_id)
    REFERENCES DodatkoweUslugi (id);

-- Reference: Table_10_Pakiet (table: UslugiWPakietach)
ALTER TABLE UslugiWPakietach ADD CONSTRAINT Table_10_Pakiet FOREIGN KEY Table_10_Pakiet (Pakiet_id)
    REFERENCES Pakiet (id);

-- Reference: WyposarzenieWPlacowce_Placowka (table: SaleWPlacowce)
ALTER TABLE SaleWPlacowce ADD CONSTRAINT WyposarzenieWPlacowce_Placowka FOREIGN KEY WyposarzenieWPlacowce_Placowka (Placowka_id)
    REFERENCES Placowka (id);

-- Reference: WyposarzenieWPlacowce_Wyposarzenie (table: SaleWPlacowce)
ALTER TABLE SaleWPlacowce ADD CONSTRAINT WyposarzenieWPlacowce_Wyposarzenie FOREIGN KEY WyposarzenieWPlacowce_Wyposarzenie (sala_id)
    REFERENCES sala (id);

-- End of file.

