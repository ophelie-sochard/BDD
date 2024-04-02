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
    code_barre_lot_LOT INT, -- Remplac� "NOT FOUND" par "INT"
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
    id_equipe_EQUIPE INT, -- Remplac� "**NOT FOUND**" par "INT"
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
resultat_puits_PUITS VARCHAR2(250),
x_pixel_PIXEL FLOAT,
y_pixel_PIXEL FLOAT,
n_PIXEL INT,
Rm_PIXEL FLOAT,
Rd_PIXEL FLOAT,
Vm_PIXEL FLOAT,
Vd_PIXEL FLOAT,
Bm_PIXEL FLOAT,
Bd_PIXEL FLOAT,
Tm_PIXEL FLOAT,
Td_PIXEL FLOAT,
id_groupe_GROUPE INT, -- Remplac� "**NOT FOUND**" par "INT"
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
a1_EXPERIENCE INT,
a2_EXPERIENCE INT,
a3_EXPERIENCE INT,
coef_surcout_EXPERIENCE INT,
frequence_obs_EXPERIENCE INT,
date_commande_COMMANDE DATE,
ordre_priorite_COMMANDE INT,
id_technicien_TECHNICIEN INT, -- Remplac� "**NOT FOUND**" par "INT"
facture_id_facture_facture INT, -- Remplac� "**NOT FOUND**" par "INT"
id_chercheur_CHERCHEUR INT, -- Remplac� "**NOT FOUND**" par "INT"
id_position_ATTENTE INT,
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
moyenne_grp_GROUPE FLOAT,
ecart_type_grp_GROUPE FLOAT,
acceptation_GROUPE NUMBER(1),
x_grp_GROUPE FLOAT,
y_grp_GROUPE FLOAT,
code_barre_plaque_PLAQUE int,
id_exp_EXPERIENCE INT,
PRIMARY KEY (id_groupe_GROUPE));

ALTER TABLE GROUPE ADD nb_slots_groupe INT;

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


ALTER TABLE LOT
ADD CONSTRAINT CHK_TypePlaque CHECK (type_plaque_LOT IN (96, 384));

ALTER TABLE TECHNICIEN
ADD CONSTRAINT CHK_EtatTechnicien CHECK (etat_technicien_TECHNICIEN IN ('libre', 'occup�'));

ALTER TABLE EXPERIENCE
ADD CONSTRAINT CHK_TypeExperience CHECK (TYPE_EXP_EXPERIENCE IN ('colorim�trique','opacim�trique'));

ALTER TABLE PUITS
ADD CONSTRAINT CHK_ValCouleurs CHECK (
    Rm_PIXEL >= 0 AND Rm_PIXEL <= 255 AND
    Rd_PIXEL >= 0 AND Rd_PIXEL <= 255 AND
    Vm_PIXEL >= 0 AND Vm_PIXEL <= 255 AND
    Vd_PIXEL >= 0 AND Vd_PIXEL <= 255 AND
    Bm_PIXEL >= 0 AND Bm_PIXEL <= 255 AND
    Bd_PIXEL >= 0 AND Bd_PIXEL <= 255 AND
    Tm_PIXEL >= 0 AND Tm_PIXEL <= 255 AND
    Td_PIXEL >= 0 AND Td_PIXEL <= 255
);

CREATE OR REPLACE TRIGGER TRG_CheckTransmissionExperience
BEFORE UPDATE ON EXPERIENCE
FOR EACH ROW
DECLARE
    v_tech_state VARCHAR2(50);
BEGIN
    IF :new.statut_exp_EXPERIENCE = 'rat�e' THEN
        SELECT etat_technicien_TECHNICIEN INTO v_tech_state
        FROM TECHNICIEN
        WHERE id_technicien_TECHNICIEN = :new.id_technicien_TECHNICIEN;

        IF v_tech_state != 'libre' THEN
            RAISE_APPLICATION_ERROR(-20001, 'Le technicien en charge n''est pas libre pour transmettre l''exp�rience.');
        END IF;
    END IF;
END;
/

ALTER TABLE PHOTOMETRE
ADD CONSTRAINT CHK_EtatPhotometre CHECK (etat_photometre_PHOTOMETRE IN ('vide', 'occup�', 'en panne'));

ALTER TABLE EXPERIENCE
ADD CONSTRAINT CHK_EtatExperience CHECK (statut_exp_EXPERIENCE IN ('en cours', 'en attente', 'effectu�e', 'rat�e'));

ALTER TABLE EXPERIENCE
ADD CONSTRAINT CHK_OrdrePriorite CHECK (ORDRE_PRIORITE_COMMANDE BETWEEN 1 AND 5);

CREATE OR REPLACE TRIGGER TRG_GROUPE_Refus
AFTER UPDATE OF acceptation_GROUPE ON GROUPE
FOR EACH ROW
BEGIN
    IF :new.acceptation_GROUPE = 0 THEN
        UPDATE EXPERIENCE
        SET statut_exp_EXPERIENCE = 'rat�e'
        WHERE id_exp_EXPERIENCE = : new.id_groupe_GROUPE;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TRG_LOT_Rachat
BEFORE UPDATE OF stock_actuel_stock ON LOT
FOR EACH ROW
BEGIN
    IF :new.stock_actuel_stock < :old.stock_precedent_stock THEN
        :new.stock_actuel_stock := :old.stock_actuel_stock + :new.stock_precedent_stock;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_plaque_insert
AFTER INSERT ON LOT
FOR EACH ROW
DECLARE
    l_lot_id NUMBER;
BEGIN
  l_lot_id := :new.code_barre_lot_LOT;
  FOR i IN 1..80 LOOP
    INSERT INTO PLAQUE (code_barre_plaque_PLAQUE, code_barre_lot_LOT)
    VALUES (SEQ_PLAQUE.NEXTVAL, l_lot_id);
  END LOOP;
END;
/

CREATE OR REPLACE TRIGGER TRG_puits_colorimetrie
AFTER INSERT OR UPDATE ON EXPERIENCE
FOR EACH ROW
BEGIN
    IF :NEW.statut_exp_EXPERIENCE = 'colorim�trique' THEN
        -- Mise � jour des champs Tm_PIXEL et Td_PIXEL � NULL dans PUITS
        UPDATE PUITS
        SET Tm_PIXEL = NULL,
            Td_PIXEL = NULL
        WHERE id_groupe_GROUPE IN (
            SELECT id_groupe_GROUPE
            FROM GROUPE
            WHERE id_exp_EXPERIENCE = :NEW.id_exp_EXPERIENCE
        );

        -- V�rification des conditions pour d�finir le resultat_puits � 'violet' ou 'jaune'
        IF (:NEW.Rm_EXPERIENCE BETWEEN 118 AND 138 OR :NEW.Rm_EXPERIENCE BETWEEN 228 AND 248) AND
           (:NEW.Vm_EXPERIENCE BETWEEN 0 AND 20 OR :NEW.Vm_EXPERIENCE BETWEEN 120 AND 140) AND
           (:NEW.Bm_EXPERIENCE BETWEEN 118 AND 138 OR :NEW.Bm_EXPERIENCE BETWEEN 218 AND 238) THEN
            :NEW.resultat_puits_PUITS := 'violet';
        ELSIF (:NEW.Rm_EXPERIENCE BETWEEN 245 AND 255) AND
              (:NEW.Vm_EXPERIENCE BETWEEN 245 AND 255) AND
              (:NEW.Bm_EXPERIENCE BETWEEN 41 AND 61) THEN
            :NEW.resultat_puits_PUITS := 'jaune';
        END IF;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TRG_puits_opacimetrie
AFTER INSERT OR UPDATE ON EXPERIENCE
FOR EACH ROW
BEGIN
    IF :NEW.statut_exp_EXPERIENCE = 'opacim�trique' THEN
        -- Mise � jour des champs Tm_PIXEL et Td_PIXEL � NULL dans PUITS
        UPDATE PUITS
        SET Rm_PIXEL = NULL,
            Rd_PIXEL = NULL,
            Vm_PIXEL = NULL,
            Vd_PIXEL = NULL,
            Bm_PIXEL = NULL,
            Bd_PIXEL = NULL
        WHERE id_groupe_GROUPE IN (
            SELECT id_groupe_GROUPE
            FROM GROUPE
            WHERE id_exp_EXPERIENCE = :NEW.id_exp_EXPERIENCE
        );

        IF :NEW.Tm_EXPERIENCE >= 125 THEN
            :NEW.resultat_puits_PUITS := 'opaque';
        ELSE
            :NEW.resultat_puits_PUITS := 'transparent';
        END IF;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_maj_stock
BEFORE INSERT ON LOT
FOR EACH ROW
DECLARE
    l_stock_actuel NUMBER;
BEGIN
    -- S�lectionner le stock actuel de l'avant-dernier lot
    SELECT stock_actuel_Stock
    INTO l_stock_actuel
    FROM (
        SELECT stock_actuel_Stock
        FROM LOT
        ORDER BY date_livraison_LOT DESC
    )
    WHERE ROWNUM <= 1;

    -- Mettre � jour le stock actuel du nouveau lot
    :NEW.stock_actuel_Stock := l_stock_actuel + 80;
END;
/

CREATE OR REPLACE TRIGGER TRG_ReduireFileAttente
AFTER UPDATE OF statut_exp_EXPERIENCE ON EXPERIENCE
FOR EACH ROW
BEGIN
    -- V�rifier si l'exp�rience est pass�e � l'�tat "effectu�e" ou "rat�e"
    IF :new.statut_exp_EXPERIENCE IN ('effectu�e', 'rat�e' ) THEN
        -- R�cup�rer l'ID du photom�tre associ� � cette exp�rience
        DECLARE
            v_photometre_id INT;
            v_max_position INT;
        BEGIN
            SELECT id_photometre_PHOTOMETRE INTO v_photometre_id
            FROM ATTENTE
            WHERE id_position_ATTENTE = :new.id_position_ATTENTE;

            -- R�cup�rer la position maximale actuelle dans la file d'attente du photom�tre
            SELECT MAX(position_ATTENTE) INTO v_max_position
            FROM ATTENTE
            WHERE id_photometre_PHOTOMETRE = v_photometre_id;

            -- Mettre � jour la position dans la file d'attente de l'exp�rience
            IF :new.statut_exp_EXPERIENCE = 'rat�e' THEN
                -- Placer l'exp�rience rat�e en derni�re position dans la file d'attente
                UPDATE ATTENTE
                SET position_ATTENTE = v_max_position + 1
                WHERE id_position_ATTENTE = :new.id_position_ATTENTE;
            ELSE
                -- Mettre � jour les positions des autres exp�riences si n�cessaire
                UPDATE ATTENTE
                SET position_ATTENTE = position_ATTENTE - 1
                WHERE id_photometre_PHOTOMETRE = v_photometre_id
                AND position_ATTENTE > 0; -- Assurez-vous que la position ne devient pas n�gative
            END IF;
        END;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TRG_changement_technicien
BEFORE UPDATE ON EXPERIENCE
FOR EACH ROW
DECLARE
    l_statut_old VARCHAR2(250);
BEGIN
    -- V�rifier si le statut de l'exp�rience est � "renouveler" et le nouveau technicien est diff�rent de l'ancien
    IF :OLD.statut_exp_EXPERIENCE = 'renouveler' AND :NEW.id_technicien_TECHNICIEN <> :OLD.id_technicien_TECHNICIEN THEN
        -- Si la condition est vraie, autoriser la mise � jour
        NULL;
    ELSE
        -- Sinon, annuler la mise � jour en levant une exception
        RAISE_APPLICATION_ERROR(-20001, 'Impossible de changer le technicien sauf si le statut de l''exp�rience est "� renouveler"');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TRG_CalculNbPlaques
BEFORE INSERT OR UPDATE ON GROUPE
FOR EACH ROW
DECLARE
    v_nb_plaques INT;
    v_nb_slots INT := :NEW.nb_slots_groupe;
    v_type_plaque INT;
BEGIN
    -- R�cup�rer le type de plaque de l'exp�rience associ�e au groupe
    SELECT type_plaque_LOT INTO v_type_plaque
    FROM LOT
    WHERE code_barre_lot_LOT = (
        SELECT code_barre_lot_LOT
        FROM PLAQUE
        WHERE code_barre_plaque_PLAQUE = :NEW.code_barre_plaque_PLAQUE
    );

    -- Calculer le nombre de plaques n�cessaires en fonction du type de plaque
    IF v_type_plaque = 96 THEN
        v_nb_plaques := CEIL(v_nb_slots / 96.0);
    ELSE
        v_nb_plaques := CEIL(v_nb_slots / 384.0);
    END IF;

    -- Mettre � jour le nombre de plaques dans le groupe
    :NEW.nb_plaques_GROUPE := v_nb_plaques;
END;
/


CREATE OR REPLACE TRIGGER TRG_MemeNombreSlots
BEFORE INSERT OR UPDATE ON GROUPE
FOR EACH ROW
DECLARE
    v_nb_slots_exp INT;
BEGIN
    -- R�cup�rer le nombre de slots de l'exp�rience associ�e au groupe
    SELECT nb_slots_groupe INTO v_nb_slots_exp
    FROM GROUPE
    WHERE id_exp_EXPERIENCE = :NEW.id_exp_EXPERIENCE
    AND ROWNUM = 1; -- Assurez-vous de s�lectionner uniquement un enregistrement

    -- V�rifier si le nombre de slots du nouveau groupe est diff�rent du nombre de slots de l'exp�rience
    IF :NEW.nb_slots_groupe != v_nb_slots_exp THEN
        -- Lever une erreur indiquant que tous les groupes d'une m�me exp�rience doivent avoir le m�me nombre de slots
        RAISE_APPLICATION_ERROR(-20001, 'Tous les groupes d''une m�me exp�rience doivent comporter un m�me nombre de slots.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TRG_MajFileAttente
BEFORE INSERT ON ATTENTE
FOR EACH ROW
DECLARE
    v_photometre_id INT;
    v_max_position INT;
BEGIN
    -- R�cup�rer l'ID du photom�tre associ� � la nouvelle exp�rience
    v_photometre_id := :NEW.id_photometre_PHOTOMETRE;

    -- R�cup�rer la position maximale actuelle dans la file d'attente du photom�tre
    SELECT MAX(position_ATTENTE) INTO v_max_position
    FROM ATTENTE
    WHERE id_photometre_PHOTOMETRE = v_photometre_id;

    -- Mettre � jour la position dans la file d'attente de la nouvelle exp�rience
    :NEW.position_ATTENTE := COALESCE(v_max_position, 0) + 1;
END;
/

CREATE OR REPLACE TRIGGER trg_calcul_cout_facture
BEFORE INSERT ON FACTURE
FOR EACH ROW
DECLARE
    v_cout_total FLOAT;
BEGIN
    -- Calculer le co�t total des exp�riences r�alis�es par le m�me chercheur
    SELECT SUM(exp.cout_exp_EXPERIENCE)
    INTO v_cout_total
    FROM EXPERIENCE exp
    JOIN CHERCHEUR cher ON exp.id_chercheur_CHERCHEUR = cher.id_chercheur_CHERCHEUR
    WHERE cher.id_equipe_EQUIPE = :NEW.id_equipe_EQUIPE
    AND EXTRACT(MONTH FROM date_fin_EXPERIENCE) = EXTRACT(MONTH FROM :NEW.date_facture_FACTURE);

    -- Affecter le co�t total calcul� � la facture
    :NEW.cout_facture_FACTURE := v_cout_total;
END;
/


INSERT INTO EQUIPE (ADRESSE)
VALUES ('eueueue');


INSERT INTO CHERCHEUR (ID_EQUIPE_EQUIPE)
VALUES (61);

INSERT INTO EXPERIENCE (COUT_EXP_EXPERIENCE, date_fin_EXPERIENCE,ID_CHERCHEUR_CHERCHEUR)
VALUES (1000.00, TO_DATE('2024-03-31', 'YYYY-MM-DD'),41);

INSERT INTO EXPERIENCE (COUT_EXP_EXPERIENCE, date_fin_EXPERIENCE, ID_CHERCHEUR_CHERCHEUR)
VALUES (1000.00, TO_DATE('2024-03-31', 'YYYY-MM-DD'),41);

INSERT INTO EXPERIENCE (COUT_EXP_EXPERIENCE, date_fin_EXPERIENCE, ID_CHERCHEUR_CHERCHEUR)
VALUES (1000.00, TO_DATE('2024-02-28', 'YYYY-MM-DD'),41);

INSERT INTO FACTURE (DATE_FACTURE_FACTURE, ID_EQUIPE_EQUIPE)
VALUES ( TO_DATE('2024-02-28', 'YYYY-MM-DD'), 61);

CREATE OR REPLACE TRIGGER trg_peuplement_groupe
BEFORE INSERT ON EXPERIENCE
FOR EACH ROW
DECLARE
    l_nb_groupes INT := :NEW.nb_groupe;
BEGIN
    FOR i IN 1..l_nb_groupes LOOP
        INSERT INTO GROUPE (id_exp_EXPERIENCE) VALUES (:NEW.id_exp_EXPERIENCE);
    END LOOP;
END;
/

CREATE OR REPLACE TRIGGER trg_peuplement_puits
BEFORE INSERT ON GROUPE
FOR EACH ROW
DECLARE
    l_nb_groupe INT;
    l_nb_puits_par_groupe INT;
    l_nb_puits INT;
BEGIN
    -- R�cup�rer le nombre de puits � ins�rer en fonction des variables dans EXPERIENCE
    SELECT nb_groupe, nb_slots_groupe INTO l_nb_groupe, l_nb_puits_par_groupe
    FROM EXPERIENCE
    WHERE id_exp_EXPERIENCE = :NEW.id_exp_EXPERIENCE;
    
    -- Calculer le nombre total de puits � ins�rer
    l_nb_puits := l_nb_groupe * l_nb_puits_par_groupe;
    
    -- Ins�rer les puits correspondants
    FOR i IN 1..l_nb_puits LOOP
        INSERT INTO PUITS (id_groupe_GROUPE) VALUES (:NEW.id_groupe_GROUPE);
    END LOOP;
END;
/