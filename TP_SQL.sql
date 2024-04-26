-- AUBINEAU Nathan - DEWITTE Lisa - SOCHARD Oph�lie

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

ALTER TABLE PHOTOMETRE
ADD CONSTRAINT CHK_EtatPhotometre CHECK (etat_photometre_PHOTOMETRE IN ('vide', 'occup�', 'en panne'));

ALTER TABLE EXPERIENCE
ADD CONSTRAINT CHK_EtatExperience CHECK (statut_exp_EXPERIENCE IN ('en cours', 'en attente', 'effectu�e', 'rat�e'));

ALTER TABLE EXPERIENCE
ADD CONSTRAINT CHK_OrdrePriorite CHECK (ORDRE_PRIORITE_COMMANDE BETWEEN 1 AND 5);

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

CREATE OR REPLACE TRIGGER TRG_LOT_Rachat
BEFORE UPDATE OF stock_actuel_stock ON LOT
FOR EACH ROW
BEGIN
    IF :new.stock_actuel_stock < :old.stock_precedent_stock THEN
        :new.stock_actuel_stock := :old.stock_actuel_stock + :new.stock_precedent_stock;
    END IF;
END;
/
-- Mettre � jour le stock actuel du lot � 80 avant l'insertion du lot
CREATE OR REPLACE TRIGGER trg_plaque_stock_init
Before INSERT ON LOT
FOR EACH ROW
BEGIN
    :new.stock_actuel_stock := 80;
END;
/

CREATE OR REPLACE TRIGGER trg_plaque_insert
After INSERT ON LOT
FOR EACH ROW
DECLARE
    l_lot_id NUMBER;
    l_nb_slots NUMBER;
BEGIN
    l_lot_id := :new.code_barre_lot_LOT;
    l_nb_slots := :new.type_plaque_lot;
    FOR i IN 1..80 LOOP
        INSERT INTO PLAQUE (code_barre_plaque_PLAQUE, code_barre_lot_LOT, nb_slots_libre)
        VALUES (SEQ_PLAQUE.NEXTVAL, l_lot_id, l_nb_slots);
    END LOOP;
END;
/

CREATE OR REPLACE TRIGGER trg_update_slots
BEFORE INSERT ON GROUPE
FOR EACH ROW
DECLARE
    l_nb_slots_libre PLAQUE.nb_slots_libre%TYPE;
BEGIN
    -- R�cup�rer le nombre de slots libres pour la plaque associ�e au nouveau groupe
    SELECT nb_slots_libre INTO l_nb_slots_libre
    FROM PLAQUE
    WHERE code_barre_plaque_PLAQUE = :NEW.code_barre_plaque_PLAQUE;
    -- V�rifier si le nombre de slots libres est sup�rieur � z�ro
    IF l_nb_slots_libre > 0 THEN
        -- D�cr�menter le nombre de slots libres de trois
        UPDATE PLAQUE
        SET nb_slots_libre = nb_slots_libre - 3
        WHERE code_barre_plaque_PLAQUE = :NEW.code_barre_plaque_PLAQUE;
    ELSE
        -- G�n�rer une erreur et annuler l'insertion si le nombre de slots libres est �gal � z�ro
        RAISE_APPLICATION_ERROR(-20001, 'Impossible d ins�rer un groupe car le nombre de slots libres est �gal � z�ro.');
    END IF;
END;
/
-- mise a jour du stock
CREATE OR REPLACE TRIGGER trg_update_stock_lot
AFTER INSERT ON GROUPE
FOR EACH ROW
DECLARE
    l_stock_actuel NUMBER;
    l_nb_slots_libre NUMBER;
    l_type_plaque_lot LOT.type_plaque_lot%TYPE;
    l_code_barre_lot_plaque PLAQUE.code_barre_lot_lot%TYPE;
    l_fabricant_lot VARCHAR2(250 BYTE); -- Changer la taille en fonction de votre mod�le de donn�es
    l_vendeur_lot VARCHAR2(250 BYTE);
BEGIN
    -- R�cup�rer le nombre de slots libres pour la nouvelle plaque ins�r�e
    SELECT nb_slots_libre
    INTO l_nb_slots_libre
    FROM PLAQUE
    WHERE code_barre_plaque_PLAQUE = :NEW.code_barre_plaque_PLAQUE;

    -- V�rifier si le nombre de slots libres est inf�rieur � trois
    IF l_nb_slots_libre < 3 THEN
        -- R�cup�rer le code-barres du lot correspondant � la plaque ins�r�e
        SELECT code_barre_lot_LOT
        INTO l_code_barre_lot_plaque
        FROM PLAQUE
        WHERE code_barre_plaque_PLAQUE = :NEW.code_barre_plaque_PLAQUE;
        -- V�rifier si le stock actuel est sup�rieur � z�ro avant de d�cr�menter
        SELECT stock_actuel_stock
        INTO l_stock_actuel
        FROM LOT
        WHERE code_barre_lot_LOT = l_code_barre_lot_plaque;
        -- R�cup�rer le type de plaque du lot correspondant
        SELECT type_plaque_lot
        INTO l_type_plaque_lot
        FROM LOT
        WHERE code_barre_lot_LOT = l_code_barre_lot_plaque;
        
        SELECT vendeur_lot
        INTO l_vendeur_lot
        FROM LOT
        WHERE code_barre_lot_LOT = l_code_barre_lot_plaque;
        
        SELECT fabricant_lot
        INTO l_fabricant_lot
        FROM LOT
        WHERE code_barre_lot_LOT = l_code_barre_lot_plaque;
        
        IF l_stock_actuel > 1 THEN
            -- Mettre � jour le stock actuel du lot correspondant
            UPDATE LOT
            SET stock_actuel_stock = stock_actuel_stock - 1
            WHERE code_barre_lot_LOT = l_code_barre_lot_plaque;
        ELSE
        -- Ins�rer un nouveau lot si le stock est inf�rieur � z�ro
        INSERT INTO LOT (stock_precedent_stock,stock_actuel_stock,type_plaque_lot, fabricant_lot, vendeur_lot,date_livraison_lot)
        VALUES (0,80,l_type_plaque_lot,l_fabricant_lot,l_vendeur_lot, sysdate); -- Exemple de valeurs � ins�rer
        END IF;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TRG_puits_colorimetrie
AFTER INSERT OR UPDATE ON EXPERIENCE
FOR EACH ROW
BEGIN
    IF :NEW.type_exp_EXPERIENCE = 'colorim�trique' THEN
        -- Mise � jour des champs Tm_PIXEL et Td_PIXEL � NULL dans PUITS
        UPDATE PUITS
        SET Tm_PIXEL = NULL,
            Td_PIXEL = NULL
        WHERE id_groupe_GROUPE IN (
            SELECT id_groupe_GROUPE
            FROM GROUPE
            WHERE id_exp_EXPERIENCE = :NEW.id_exp_EXPERIENCE
        );
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TRG_puits_opacimetrie
AFTER INSERT OR UPDATE ON EXPERIENCE
FOR EACH ROW
BEGIN
    IF :NEW.type_exp_EXPERIENCE = 'opacim�trique' THEN
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
    END IF;
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
drop trigger TRG_changement_technicien
CREATE OR REPLACE TRIGGER TRG_changement_technicien
BEFORE UPDATE ON EXPERIENCE
FOR EACH ROW
DECLARE
    l_statut_old VARCHAR2(250);
BEGIN
    -- V�rifier si le statut de l'exp�rience est pass� � "rat�e"
    IF :NEW.statut_exp_EXPERIENCE = 'rat�e' THEN
        -- Si le statut est pass� � "rat�e", alors autoriser la mise � jour du technicien
        NULL;
    ELSE
        -- Sinon, v�rifier si le technicien a chang�
        IF :NEW.id_technicien_TECHNICIEN <> :OLD.id_technicien_TECHNICIEN THEN
            -- Si le technicien a chang� alors annuler la mise � jour en levant une exception
            RAISE_APPLICATION_ERROR(-20001, 'Impossible de changer le technicien sauf si le statut de l''exp�rience est "rat�e"');
        END IF;
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


--insertion dans la la table groupe apres la cr�ation d'une experience et que celle ci est ratacher a un technicien
CREATE OR REPLACE TRIGGER trg_auto_insert_groupe
After INSERT ON experience
FOR EACH ROW
DECLARE
    l_id_technicien NUMBER;
    l_code_barre_plaque_plaque PLAQUE.CODE_BARRE_PLAQUE_PLAQUE%TYPE;
    l_code_barre_lot_lot LOT.CODE_BARRE_LOT_LOT%TYPE;
BEGIN
    -- R�cup�rer l'ID_TECHNICIEN_TECHNICIEN ins�r� dans la nouvelle ligne de la table "experience"
    l_id_technicien := :NEW.ID_TECHNICIEN_TECHNICIEN;

    -- V�rifier si l'ID_TECHNICIEN_TECHNICIEN est non nul
    IF l_id_technicien IS NOT NULL THEN
        
        IF :NEW.NB_GROUPE > 32 THEN
            SELECT code_barre_lot_LOT INTO l_code_barre_lot_lot
            FROM LOT
            WHERE stock_actuel_stock > 0
            and type_plaque_lot =384
            AND ROWNUM = 1;
        Else
            SELECT code_barre_lot_LOT INTO l_code_barre_lot_lot
            FROM LOT
            WHERE stock_actuel_stock > 0
            and type_plaque_lot =96
            AND ROWNUM = 1;
        end if;
        -- Si le nombre de slots libres est �gal � 384, s�lectionner la premi�re plaque disponible avec 384 slots libres
        IF :NEW.NB_GROUPE > 32 THEN
            SELECT code_barre_plaque_PLAQUE INTO l_code_barre_plaque_plaque
            FROM PLAQUE
            WHERE code_barre_lot_lot = l_code_barre_lot_lot
            AND nb_slots_libre > 96
            AND ROWNUM = 1;
        ELSE
            -- Sinon, s�lectionner une plaque avec 96 slots libres
            SELECT code_barre_plaque_PLAQUE INTO l_code_barre_plaque_plaque
            FROM PLAQUE
            WHERE code_barre_lot_lot = l_code_barre_lot_lot
            AND nb_slots_libre = 96
            AND ROWNUM = 1;
        END IF;

        -- Boucle pour ins�rer dans la table "groupe" selon la valeur de nb_groupe
        FOR i IN 1..:NEW.NB_GROUPE LOOP
            -- Ins�rer automatiquement dans la table "groupe"
            INSERT INTO groupe (ID_EXP_EXPERIENCE, CODE_BARRE_PLAQUE_PLAQUE)
            VALUES (:NEW.ID_EXP_EXPERIENCE, l_code_barre_plaque_plaque);
        END LOOP;
        
    END IF;
END;
/

CREATE OR REPLACE TRIGGER trg_maj_date
BEFORE insert or UPDATE ON experience
FOR EACH ROW
declare
l_id_technicien NUMBER;
BEGIN
 l_id_technicien := :NEW.ID_TECHNICIEN_TECHNICIEN;

    -- V�rifier si l'ID_TECHNICIEN_TECHNICIEN est non nul
    IF l_id_technicien IS NOT NULL THEN
    -- Mise � jour de la date de d�but de l'exp�rience
    :NEW.DATE_DEBUT_EXPERIENCE := SYSDATE;
    :NEW.STATUT_EXP_EXPERIENCE := 'en cours';
    end if;
END;
/

-- insertion automatique de puits apres la cr�ation de groupe 
CREATE OR REPLACE TRIGGER trg_insert_puit
AFTER INSERT ON groupe
FOR EACH ROW
DECLARE
    l_id_groupe groupe.ID_GROUPE_Groupe%TYPE;
BEGIN
    -- R�cup�rer l'ID de groupe de la nouvelle ligne ins�r�e dans la table "groupe"
    l_id_groupe := :NEW.ID_GROUPE_groupe;

    -- Ins�rer trois enregistrements dans la table "puit" avec l'ID de groupe correspondant
    FOR i IN 1..3 LOOP
        INSERT INTO puits (ID_GROUPE_Groupe)
        VALUES (l_id_groupe);
    END LOOP;
END;
/
 -- insertion dans la table groupe des valeur des  puits apres update 
CREATE OR REPLACE TRIGGER trg_update_groupe
FOR UPDATE ON puits
COMPOUND TRIGGER
    -- D�claration d'une collection pour stocker les ID de groupe modifi�s
    TYPE t_group_ids IS TABLE OF puits.id_groupe_groupe%TYPE;
    v_group_ids t_group_ids := t_group_ids();

    -- Before Statement Section
    BEFORE STATEMENT IS
    BEGIN
        -- Initialisation de la collection des ID de groupe
        v_group_ids := t_group_ids();
    END BEFORE STATEMENT;

    -- Before Each Row Section
    BEFORE EACH ROW IS
    BEGIN
        -- Ajout de l'ID de groupe modifi� � la collection
        IF UPDATING THEN
            v_group_ids.EXTEND;
            v_group_ids(v_group_ids.LAST) := :NEW.ID_GROUPE_GROUPE;
        END IF;
    END BEFORE EACH ROW;

    -- After Statement Section
    AFTER STATEMENT IS
    BEGIN
        -- Parcours des ID de groupe uniques et mise � jour des colonnes de groupe pour chaque groupe
        FOR i IN 1..v_group_ids.COUNT LOOP
            calculer_moyennes(v_group_ids(i));
        END LOOP;
    END AFTER STATEMENT;
END trg_update_groupe;
/

CREATE OR REPLACE PROCEDURE calculer_moyennes(p_id_groupe IN puits.id_groupe_groupe%TYPE) AS
    v_moyenne_rm NUMBER;
    v_moyenne_vm NUMBER;
    v_moyenne_bm NUMBER;
    v_moyenne_tm NUMBER;
    v_moyenne_globale NUMBER;
    v_ecart_type_rd NUMBER;
    v_ecart_type_vd NUMBER;
    v_ecart_type_bd NUMBER;
    v_ecart_type_td NUMBER;
    v_ecart_type_globale NUMBER;
    v_x_grp_groupe NUMBER;
    v_y_grp_groupe NUMBER;
    v_acceptation NUMBER;
    v_total_groupe NUMBER;
    v_total_acceptation NUMBER;
    v_TYPE_EXP_EXPERIENCE experience.TYPE_EXP_EXPERIENCE%TYPE;
BEGIN
    -- Calcul des moyennes pour chaque colonne
    SELECT AVG(X_PUITS_PUITS), AVG(Y_PUITS_PUITS),
           AVG(RM_PIXEL), AVG(VM_PIXEL),
           AVG(BM_PIXEL), AVG(TM_PIXEL),
           AVG(RD_PIXEL), AVG(VD_PIXEL),
           AVG(BD_PIXEL), AVG(TD_PIXEL)
    INTO v_x_grp_groupe, v_y_grp_groupe,
        v_moyenne_rm, v_moyenne_vm, v_moyenne_bm, v_moyenne_tm,
        v_ecart_type_rd, v_ecart_type_vd, v_ecart_type_bd, v_ecart_type_td
    FROM puits
    WHERE ID_GROUPE_GROUPE = p_id_groupe;

    -- Calcul de l'acceptation en fonction de l'�cart-type
    IF (v_ecart_type_rd < 11 AND v_ecart_type_vd < 11 AND v_ecart_type_bd < 11) OR (v_ecart_type_td < 11) THEN
        v_acceptation := 1; -- Acceptation
    ELSE
        v_acceptation := 0; -- Non acceptation
    END IF;

    -- Mise � jour des valeurs dans la table groupe
    UPDATE groupe
    SET X_GRP_GROUPE = v_x_grp_groupe,
        Y_GRP_GROUPE = v_y_grp_groupe,
        MOYENNE_GRP_R = v_moyenne_rm,
        MOYENNE_GRP_V = v_moyenne_vm,
        MOYENNE_GRP_B = v_moyenne_bm,
        MOYENNE_GRP_T = v_moyenne_tm,
        ECART_TYPE_GRP_R = v_ecart_type_rd,
        ECART_TYPE_GRP_V = v_ecart_type_vd,
        ECART_TYPE_GRP_B = v_ecart_type_bd,
        ECART_TYPE_GRP_T = v_ecart_type_td,
        ACCEPTATION_GROUPE = v_acceptation
    WHERE ID_GROUPE_GROUPE = p_id_groupe;


    -- Calcul de la moyenne globale de l'exp�rience
    SELECT AVG(MOYENNE_GRP_R + MOYENNE_GRP_V + MOYENNE_GRP_B)
    INTO v_moyenne_globale
    FROM groupe
    WHERE ID_EXP_EXPERIENCE = (SELECT ID_EXP_EXPERIENCE FROM groupe WHERE ID_GROUPE_GROUPE = p_id_groupe);
    
    -- Calcul de la moyenne globale de l'�cart-type de l'exp�rience
    SELECT AVG(ECART_TYPE_GRP_R + ECART_TYPE_GRP_V + ECART_TYPE_GRP_B)
    INTO v_ecart_type_globale
    FROM groupe
    WHERE ID_EXP_EXPERIENCE = (SELECT ID_EXP_EXPERIENCE FROM groupe WHERE ID_GROUPE_GROUPE = p_id_groupe);
    
-- R�cup�ration du type d'exp�rience de la table experience
    SELECT TYPE_EXP_EXPERIENCE INTO v_TYPE_EXP_EXPERIENCE
    FROM experience
    WHERE ID_EXP_EXPERIENCE = (SELECT ID_EXP_EXPERIENCE FROM groupe WHERE ID_GROUPE_GROUPE = p_id_groupe);
    
    If v_TYPE_EXP_EXPERIENCE ='opacim�trique' then
        -- Mise � jour de la moyenne globale dans la table exp�rience
        UPDATE experience
        SET MOYENNE_GLOBALE_EXPERIENCE = v_moyenne_tm, 
        ECART_TYPE_GLOBAL_EXPERIENCE = v_ecart_type_td
        WHERE ID_EXP_EXPERIENCE = (SELECT ID_EXP_EXPERIENCE FROM groupe WHERE ID_GROUPE_GROUPE = p_id_groupe);
    else
        UPDATE experience
        SET MOYENNE_GLOBALE_EXPERIENCE = v_moyenne_globale, 
        ECART_TYPE_GLOBAL_EXPERIENCE = v_ecart_type_globale
        WHERE ID_EXP_EXPERIENCE = (SELECT ID_EXP_EXPERIENCE FROM groupe WHERE ID_GROUPE_GROUPE = p_id_groupe);
    end if;    
    
    -- Mise � jour de la date de transmission des r�sultats de l'exp�rience
    UPDATE Experience
    SET DATE_TRANSMISSION_RESULTATS_EXPERIENCE = SYSDATE
    WHERE ID_EXP_EXPERIENCE = (SELECT ID_EXP_EXPERIENCE FROM groupe WHERE ID_GROUPE_GROUPE = p_id_groupe);

    -- Calcul du nombre total de groupes associ�s � l'exp�rience
    SELECT COUNT(*)
    INTO v_total_groupe
    FROM groupe
    WHERE ID_EXP_EXPERIENCE = (SELECT ID_EXP_EXPERIENCE FROM groupe WHERE ID_GROUPE_GROUPE = p_id_groupe);

    -- Calcul du nombre total de groupes ayant une acceptation �gale � 1
    SELECT COUNT(*)
    INTO v_total_acceptation
    FROM groupe
    WHERE ID_EXP_EXPERIENCE = (SELECT ID_EXP_EXPERIENCE FROM groupe WHERE ID_GROUPE_GROUPE = p_id_groupe)
    AND ACCEPTATION_GROUPE = 1;

    -- Mise � jour du statut de l'exp�rience en fonction du nombre total de groupes et du nombre de groupes accept�s
    IF v_total_groupe = v_total_acceptation THEN
        UPDATE experience
        SET 
            STATUT_EXP_EXPERIENCE = 'effectu�e',
            DATE_FIN_EXPERIENCE = SYSDATE
        WHERE ID_EXP_EXPERIENCE = (SELECT ID_EXP_EXPERIENCE FROM groupe WHERE ID_GROUPE_GROUPE = p_id_groupe);
    ELSE
        UPDATE experience
        SET STATUT_EXP_EXPERIENCE = 'rat�e',
            Nb_PROG_EXPERIENCE = Nb_PROG_EXPERIENCE + 1
        WHERE ID_EXP_EXPERIENCE = (SELECT ID_EXP_EXPERIENCE FROM groupe WHERE ID_GROUPE_GROUPE = p_id_groupe);
    END IF;
END;
/

DROP TRIGGER TRG_CalculCoefSurcout;

CREATE OR REPLACE TRIGGER TRG_CalculCoefSurcout
BEFORE UPDATE OF statut_exp_EXPERIENCE ON EXPERIENCE
FOR EACH ROW
DECLARE
    v_coefficient NUMBER;
    v_total_experiences_attente INT;
    v_experiences_doublees INT;
BEGIN
    -- V�rifier si le statut de l'exp�rience est 'en attente' et si l'ordre de priorit� est > 0
    IF :NEW.statut_exp_EXPERIENCE = 'en attente' AND :NEW.ordre_priorite_commande > 0 THEN
        -- R�cup�rer le nombre total d'exp�riences en attente de programmation
        SELECT COUNT(*) INTO v_total_experiences_attente
        FROM ATTENTE;

        -- R�cup�rer le nombre d'exp�riences avec un ordre de priorit� plus faible que la nouvelle exp�rience
        SELECT COUNT(*) INTO v_experiences_doublees
        FROM EXPERIENCE
        WHERE statut_exp_EXPERIENCE = 'en attente'
        AND ordre_priorite_commande < :NEW.ordre_priorite_commande;

        -- Calcul du coefficient
        IF v_total_experiences_attente = 0 THEN
            v_coefficient := 1;
        ELSE
            v_coefficient := (v_total_experiences_attente + v_experiences_doublees) / v_total_experiences_attente;
        END IF;

        -- Mettre � jour le coefficient de surco�t dans la table EXPERIENCE
        :NEW.coef_surcout_experience := v_coefficient;
        
        -- Mettre � jour le prix total de l'exp�rience
        :NEW.cout_EXP_EXPERIENCE := :NEW.cout_EXP_EXPERIENCE * v_coefficient;
    END IF;
END;
/
