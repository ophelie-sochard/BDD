-- AUBINEAU Nathan - DEWITTE Lisa - SOCHARD Oph�lie

DECLARE 
  existe_LOT INTEGER ;

BEGIN 
  SELECT count(*) INTO existe_LOT FROM user_tables WHERE table_name = upper('LOT') ;

  IF existe_LOT > 0 THEN 
    EXECUTE IMMEDIATE 'DROP TABLE LOT CASCADE CONSTRAINTS' ;

  END IF ;

END ;

drop table LOT;
CREATE TABLE LOT (
    code_barre_lot_LOT INT NOT NULL,
    type_plaque_LOT INT,
    date_livraison_LOT DATE,
    vendeur_LOT VARCHAR2(250),
    fabricant_LOT VARCHAR2(250),
    stock_precedent_Stock INT,
    stock_actuel_Stock INT,
    PRIMARY KEY (code_barre_lot_LOT)
);

drop sequence seq_lot;
CREATE SEQUENCE SEQ_LOT ;

drop trigger trig_lot;
CREATE TRIGGER TRIG_LOT BEFORE INSERT ON LOT FOR EACH ROW 
 BEGIN 
 SELECT SEQ_LOT.NEXTVAL INTO :new.code_barre_lot_LOT FROM DUAL ;

 END ;

DECLARE 
  existe_PLAQUE INTEGER ;

BEGIN 
  SELECT count(*) INTO existe_PLAQUE FROM user_tables WHERE table_name = upper('PLAQUE') ;

  IF existe_PLAQUE > 0 THEN 
    EXECUTE IMMEDIATE 'DROP TABLE PLAQUE CASCADE CONSTRAINTS' ;

  END IF ;

END ;

drop table plaque;
CREATE TABLE PLAQUE (
    code_barre_plaque_PLAQUE int NOT NULL,
    code_barre_lot_LOT INT, 
    NB_SLOTS_LIBRE int;
    PRIMARY KEY (code_barre_plaque_PLAQUE)
);

drop sequence seq_plaque;
CREATE SEQUENCE SEQ_PLAQUE ;

drop trigger TRIG_PLAQUE;
CREATE TRIGGER TRIG_PLAQUE BEFORE INSERT ON PLAQUE FOR EACH ROW 
 BEGIN 
 SELECT SEQ_PLAQUE.NEXTVAL INTO :new.code_barre_plaque_PLAQUE FROM DUAL ;

 END ;

DECLARE 
  existe_EQUIPE INTEGER ;

BEGIN 
  SELECT count(*) INTO existe_EQUIPE FROM user_tables WHERE table_name = upper('EQUIPE') ;

  IF existe_EQUIPE > 0 THEN 
    EXECUTE IMMEDIATE 'DROP TABLE EQUIPE CASCADE CONSTRAINTS' ;

  END IF ;

END ;

drop table equipe;
CREATE TABLE EQUIPE (id_equipe_EQUIPE INT NOT NULL,
adresse VARCHAR2(250),
PRIMARY KEY (id_equipe_EQUIPE));

drop sequence SEQ_EQUIPE;
CREATE SEQUENCE SEQ_EQUIPE ;

drop trigger TRIG_EQUIPE;
CREATE TRIGGER TRIG_EQUIPE BEFORE INSERT ON EQUIPE FOR EACH ROW 
 BEGIN 
 SELECT SEQ_EQUIPE.NEXTVAL INTO :new.id_equipe_EQUIPE FROM DUAL ;

 END ;

DECLARE 
  existe_FACTURE INTEGER ;

BEGIN 
  SELECT count(*) INTO existe_FACTURE FROM user_tables WHERE table_name = upper('FACTURE') ;

  IF existe_FACTURE > 0 THEN 
    EXECUTE IMMEDIATE 'DROP TABLE FACTURE CASCADE CONSTRAINTS' ;

  END IF ;

END ;

drop table facture;
CREATE TABLE FACTURE (
    id_facture_FACTURE INT NOT NULL,
    date_facture_FACTURE DATE,
    cout_facture_FACTURE FLOAT,
    id_equipe_EQUIPE INT,
    PRIMARY KEY (id_facture_FACTURE)
);

drop sequence SEQ_FACTURE;
CREATE SEQUENCE SEQ_FACTURE ;

drop trigger TRIG_FACTURE;
CREATE TRIGGER TRIG_FACTURE BEFORE INSERT ON FACTURE FOR EACH ROW 
 BEGIN 
 SELECT SEQ_FACTURE.NEXTVAL INTO :new.id_facture_FACTURE FROM DUAL ;

 END ;

DECLARE 
  existe_TECHNICIEN INTEGER ;

BEGIN 
  SELECT count(*) INTO existe_TECHNICIEN FROM user_tables WHERE table_name = upper('TECHNICIEN') ;

  IF existe_TECHNICIEN > 0 THEN 
    EXECUTE IMMEDIATE 'DROP TABLE TECHNICIEN CASCADE CONSTRAINTS' ;

  END IF ;

END ;

drop table technicien;
CREATE TABLE TECHNICIEN (id_technicien_TECHNICIEN INT NOT NULL,
etat_technicien_TECHNICIEN VARCHAR2(250),
PRIMARY KEY (id_technicien_TECHNICIEN));

drop sequence SEQ_TECHNICIEN;
CREATE SEQUENCE SEQ_TECHNICIEN ;

drop trigger TRIG_TECHNICIEN;
CREATE TRIGGER TRIG_TECHNICIEN BEFORE INSERT ON TECHNICIEN FOR EACH ROW 
 BEGIN 
 SELECT SEQ_TECHNICIEN.NEXTVAL INTO :new.id_technicien_TECHNICIEN FROM DUAL ;

 END ;

DECLARE 
  existe_PUITS INTEGER ;

BEGIN 
  SELECT count(*) INTO existe_PUITS FROM user_tables WHERE table_name = upper('PUITS') ;

  IF existe_PUITS > 0 THEN 
    EXECUTE IMMEDIATE 'DROP TABLE PUITS CASCADE CONSTRAINTS' ;

  END IF ;

END ;

drop table puits;
CREATE TABLE PUITS (id_puits_PUITS INT NOT NULL,
x_puits_PUITS FLOAT,
y_puits_PUITS FLOAT,
Rm_PIXEL FLOAT,
Rd_PIXEL FLOAT,
Vm_PIXEL FLOAT,
Vd_PIXEL FLOAT,
Bm_PIXEL FLOAT,
Bd_PIXEL FLOAT,
Tm_PIXEL FLOAT,
Td_PIXEL FLOAT,
id_groupe_GROUPE INT,
PRIMARY KEY (id_puits_PUITS));

drop sequence SEQ_PUITS;
CREATE SEQUENCE SEQ_PUITS ;

drop trigger TRIG_PUITS;
CREATE TRIGGER TRIG_PUITS BEFORE INSERT ON PUITS FOR EACH ROW 
 BEGIN 
 SELECT SEQ_PUITS.NEXTVAL INTO :new.id_puits_PUITS FROM DUAL ;

 END ;

DECLARE 
  existe_CHERCHEUR INTEGER ;

BEGIN 
  SELECT count(*) INTO existe_CHERCHEUR FROM user_tables WHERE table_name = upper('CHERCHEUR') ;

  IF existe_CHERCHEUR > 0 THEN 
    EXECUTE IMMEDIATE 'DROP TABLE CHERCHEUR CASCADE CONSTRAINTS' ;

  END IF ;

END ;

drop table chercheur;
CREATE TABLE CHERCHEUR (id_chercheur_CHERCHEUR INT NOT NULL,
id_equipe_EQUIPE INT, -- Remplac� "**NOT FOUND**" par "INT"
PRIMARY KEY (id_chercheur_CHERCHEUR));

drop sequence SEQ_CHERCHEUR;
CREATE SEQUENCE SEQ_CHERCHEUR ;

drop trigger TRIG_CHERCHEUR;
CREATE TRIGGER TRIG_CHERCHEUR BEFORE INSERT ON CHERCHEUR FOR EACH ROW 
 BEGIN 
 SELECT SEQ_CHERCHEUR.NEXTVAL INTO :new.id_chercheur_CHERCHEUR FROM DUAL ;

 END ;

DECLARE 
  existe_PHOTOMETRE INTEGER ;

BEGIN 
  SELECT count(*) INTO existe_PHOTOMETRE FROM user_tables WHERE table_name = upper('PHOTOMETRE') ;

  IF existe_PHOTOMETRE > 0 THEN 
    EXECUTE IMMEDIATE 'DROP TABLE PHOTOMETRE CASCADE CONSTRAINTS' ;

  END IF ;

END ;

drop table PHOTOMETRE;
CREATE TABLE PHOTOMETRE (id_photometre_PHOTOMETRE INT NOT NULL,
etat_photometre_PHOTOMETRE VARCHAR2(250),
PRIMARY KEY (id_photometre_PHOTOMETRE));

drop sequence SEQ_PHOTOMETRE;
CREATE SEQUENCE SEQ_PHOTOMETRE ;

drop trigger TRIG_PHOTOMETRE;
CREATE TRIGGER TRIG_PHOTOMETRE BEFORE INSERT ON PHOTOMETRE FOR EACH ROW 
 BEGIN 
 SELECT SEQ_PHOTOMETRE.NEXTVAL INTO :new.id_photometre_PHOTOMETRE FROM DUAL ;

 END ;

DECLARE 
  existe_EXPERIENCE INTEGER ;

BEGIN 
  SELECT count(*) INTO existe_EXPERIENCE FROM user_tables WHERE table_name = upper('EXPERIENCE') ;

  IF existe_EXPERIENCE > 0 THEN 
    EXECUTE IMMEDIATE 'DROP TABLE EXPERIENCE CASCADE CONSTRAINTS' ;

  END IF ;

END ;

drop table experience;
CREATE TABLE EXPERIENCE (id_exp_EXPERIENCE INT NOT NULL,
statut_exp_EXPERIENCE VARCHAR2(250),
nb_prog_EXPERIENCE INT,
date_debut_EXPERIENCE DATE,
date_fin_EXPERIENCE DATE,
date_transmission_resultats_EXPERIENCE DATE,
cout_exp_EXPERIENCE FLOAT,
type_exp_EXPERIENCE VARCHAR2(250),
moyenne_globale_EXPERIENCE FLOAT,
ecart_type_global_EXPERIENCE FLOAT,
coef_surcout_EXPERIENCE INT,
date_commande_COMMANDE DATE,
ordre_priorite_COMMANDE INT,
id_technicien_TECHNICIEN INT, 
facture_id_facture_facture INT, 
id_chercheur_CHERCHEUR INT, 
id_position_ATTENTE INT,
DATE_COMMANDE_COMMANDE date,
NB_GROUPE int
PRIMARY KEY (id_exp_EXPERIENCE));

drop sequence SEQ_EXPERIENCE;
CREATE SEQUENCE SEQ_EXPERIENCE ;

drop trigger TRIG_EXPERIENCE;
CREATE TRIGGER TRIG_EXPERIENCE BEFORE INSERT ON EXPERIENCE FOR EACH ROW 
 BEGIN 
 SELECT SEQ_EXPERIENCE.NEXTVAL INTO :new.id_exp_EXPERIENCE FROM DUAL ;

 END ;

DECLARE 
  existe_GROUPE INTEGER ;

BEGIN 
  SELECT count(*) INTO existe_GROUPE FROM user_tables WHERE table_name = upper('GROUPE') ;

  IF existe_GROUPE > 0 THEN 
    EXECUTE IMMEDIATE 'DROP TABLE GROUPE CASCADE CONSTRAINTS' ;

  END IF ;

END ;

drop table groupe;
CREATE TABLE GROUPE (id_groupe_GROUPE INT NOT NULL,
nb_plaques_GROUPE INT,
NB_PLAQUES_GROUPE	NUMBER(38,0),
X_GRP_GROUPE	FLOAT,
Y_GRP_GROUPE	FLOAT,
CODE_BARRE_PLAQUE_PLAQUE	NUMBER(38,0),
MOYENNE_GRP_R	FLOAT,
MOYENNE_GRP_B	FLOAT,
MOYENNE_GRP_V	FLOAT,
MOYENNE_GRP_T	FLOAT,
ECART_TYPE_GRP_R	FLOAT,
ECART_TYPE_GRP_B	FLOAT,
ECART_TYPE_GRP_V	FLOAT,
ECART_TYPE_GRP_T	FLOAT,
ACCEPTATION_GROUPE	NUMBER(1,0)
id_exp_EXPERIENCE INT,
PRIMARY KEY (id_groupe_GROUPE));

drop sequence SEQ_GROUPE;
CREATE SEQUENCE SEQ_GROUPE ;

drop trigger TRIG_GROUPE;
CREATE TRIGGER TRIG_GROUPE BEFORE INSERT ON GROUPE FOR EACH ROW 
 BEGIN 
 SELECT SEQ_GROUPE.NEXTVAL INTO :new.id_groupe_GROUPE FROM DUAL ;

 END ;

DECLARE 
  existe_ATTENTE INTEGER ;

BEGIN 
  SELECT count(*) INTO existe_ATTENTE FROM user_tables WHERE table_name = upper('ATTENTE') ;

  IF existe_ATTENTE > 0 THEN 
    EXECUTE IMMEDIATE 'DROP TABLE ATTENTE CASCADE CONSTRAINTS' ;

  END IF ;

END ;

drop table attente;
CREATE TABLE ATTENTE (id_position_ATTENTE INT NOT NULL,
position_ATTENTE INT,
id_photometre_PHOTOMETRE INT, -- Remplac� "**NOT FOUND**" par "INT"
PRIMARY KEY (id_position_ATTENTE));

drop sequence SEQ_ATTENTE;
CREATE SEQUENCE SEQ_ATTENTE ;
drop trigger TRIG_ATTENTE;
CREATE TRIGGER TRIG_ATTENTE BEFORE INSERT ON ATTENTE FOR EACH ROW 
 BEGIN 
 SELECT SEQ_ATTENTE.NEXTVAL INTO :new.id_position_ATTENTE FROM DUAL ;

 END ;

ALTER TABLE PLAQUE ADD CONSTRAINT FK_PLAQUE_code_barre_lot_LOT FOREIGN KEY (code_barre_lot_LOT) REFERENCES LOT (code_barre_lot_LOT);
ALTER TABLE FACTURE ADD CONSTRAINT FK_FACTURE_id_equipe_EQUIPE FOREIGN KEY (id_equipe_EQUIPE) REFERENCES EQUIPE (id_equipe_EQUIPE);
ALTER TABLE PUITS ADD CONSTRAINT FK_PUITS_id_groupe_GROUPE FOREIGN KEY (id_groupe_GROUPE) REFERENCES GROUPE (id_groupe_GROUPE);
ALTER TABLE CHERCHEUR ADD CONSTRAINT FK_CHERCHEUR_id_equipe_EQUIPE FOREIGN KEY (id_equipe_EQUIPE) REFERENCES EQUIPE (id_equipe_EQUIPE);
ALTER TABLE EXPERIENCE ADD CONSTRAINT FK_EXPERIENCE_id_technicien_TECHNICIEN FOREIGN KEY (id_technicien_TECHNICIEN) REFERENCES TECHNICIEN (id_technicien_TECHNICIEN);
ALTER TABLE EXPERIENCE ADD CONSTRAINT FK_EXPERIENCE_facture_id_facture_facture FOREIGN KEY (facture_id_facture_facture) REFERENCES FACTURE (id_facture_FACTURE);
ALTER TABLE EXPERIENCE ADD CONSTRAINT FK_EXPERIENCE_id_chercheur_CHERCHEUR FOREIGN KEY (id_chercheur_CHERCHEUR) REFERENCES CHERCHEUR (id_chercheur_CHERCHEUR);
ALTER TABLE EXPERIENCE ADD CONSTRAINT FK_EXPERIENCE_id_position_ATTENTE FOREIGN KEY (id_position_ATTENTE) REFERENCES ATTENTE (id_position_ATTENTE);
ALTER TABLE GROUPE ADD CONSTRAINT FK_GROUPE_code_barre_plaque_PLAQUE FOREIGN KEY (code_barre_plaque_PLAQUE) REFERENCES PLAQUE (code_barre_plaque_PLAQUE);
ALTER TABLE GROUPE ADD CONSTRAINT FK_GROUPE_id_exp_EXPERIENCE FOREIGN KEY (id_exp_EXPERIENCE) REFERENCES EXPERIENCE (id_exp_EXPERIENCE);
ALTER TABLE ATTENTE ADD CONSTRAINT FK_ATTENTE_id_photometre_PHOTOMETRE FOREIGN KEY (id_photometre_PHOTOMETRE) REFERENCES PHOTOMETRE (id_photometre_PHOTOMETRE);
