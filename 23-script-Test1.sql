DROP TABLE TRACETEST;

CREATE TABLE TRACETEST (
    nom_test VARCHAR2(100),
    resultat VARCHAR2(10)
);

CREATE OR REPLACE PROCEDURE TestEtatPhotometrePositif deterministic AS
BEGIN
    -- Tentative d'insertion de données valides
    INSERT INTO PHOTOMETRE (etat_photometre_PHOTOMETRE) VALUES ('vide');
    INSERT INTO PHOTOMETRE (etat_photometre_PHOTOMETRE) VALUES ('occupé');
    INSERT INTO PHOTOMETRE (etat_photometre_PHOTOMETRE) VALUES ('en panne');
    rollback;
    -- Si l'insertion réussit, affiche un message indiquant que le test est reussis
    INSERT INTO TRACETEST VALUES ('TestEtatPhotometrePositif', 'ok');
    COMMIT;

EXCEPTION
    -- Si une erreur se produit, affiche un message indiquant que le test a rate
    WHEN OTHERS THEN
        ROLLBACK;
        INSERT INTO TRACETEST VALUES ('TestEtatPhotometrePositif', 'faux');
        COMMIT;
END;
/
CREATE OR REPLACE PROCEDURE TestEtatPhotometreNegatif deterministic AS
BEGIN
    -- Tentative d'insertion de données valides
    INSERT INTO PHOTOMETRE (etat_photometre_PHOTOMETRE) VALUES ('non');
    rollback;
    -- Si l'insertion réussit, affiche un message indiquant que le test est réussis
    INSERT INTO TRACETEST VALUES ('TestEtatPhotometreNegatif', 'faux');
    COMMIT;

EXCEPTION
    -- Si une erreur se produit, affiche un message indiquant que le test a réussi
    WHEN OTHERS THEN
        ROLLBACK;
        INSERT INTO TRACETEST VALUES ('TestEtatPhotometreNegatif', 'ok');
        COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE TestEtatExperiencePositif deterministic AS
BEGIN
    -- Tentative d'insertion de donnéees valides
    INSERT INTO EXPERIENCE (statut_exp_EXPERIENCE) VALUES ('en cours');
    INSERT INTO EXPERIENCE (statut_exp_EXPERIENCE) VALUES ('en attente');
    INSERT INTO EXPERIENCE (statut_exp_EXPERIENCE) VALUES ('effectuée');
    INSERT INTO EXPERIENCE (statut_exp_EXPERIENCE) VALUES ('ratée');
    rollback;
    -- Si l'insertion réussit, affiche un message indiquant que le test est reussis
    INSERT INTO TRACETEST VALUES ('TestEtatExperiencePositif', 'ok');
    COMMIT;

EXCEPTION
    -- Si une erreur se produit, affiche un message indiquant que le test a echoue
    WHEN OTHERS THEN
        ROLLBACK;
        INSERT INTO TRACETEST VALUES ('TestEtatExperiencePositif', 'faux');
        COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE TestEtatExperienceNegatif deterministic AS
BEGIN
    -- Tentative d'insertion de donnéees valides
    INSERT INTO EXPERIENCE (statut_exp_EXPERIENCE) VALUES ('vide');
    rollback;
    -- Si l'insertion réussit, affiche un message indiquant que le test est raté
    INSERT INTO TRACETEST VALUES ('TestEtatExperienceNegatif', 'faux');
    COMMIT;

EXCEPTION
    -- Si une erreur se produit, affiche un message indiquant que le test a reussis
    WHEN OTHERS THEN
        ROLLBACK;
        INSERT INTO TRACETEST VALUES ('TestEtatExperienceNegatif', 'ok');
        COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE TestTypeExperiencePositif deterministic AS
BEGIN
    -- Tentative d'insertion de données valides
    INSERT INTO EXPERIENCE (type_exp_EXPERIENCE) VALUES ('colorimétrique');
    INSERT INTO EXPERIENCE (type_exp_EXPERIENCE) VALUES ('opacimétrique');

    rollback;
    -- Si l'insertion réussit, affiche un message indiquant que le test est réussi
    INSERT INTO TRACETEST VALUES ('TestTypeExperiencePositif', 'ok');
    COMMIT;

EXCEPTION
    -- Si une erreur se produit, affiche un message indiquant que le test a échoué
    WHEN OTHERS THEN
        ROLLBACK;
        INSERT INTO TRACETEST VALUES ('TestTypeExperiencePositif', 'faux');
        COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE TestTypeExperienceNegatif deterministic AS
BEGIN
    -- Tentative d'insertion de données valides
    INSERT INTO EXPERIENCE (type_exp_EXPERIENCE) VALUES ('vide');
    rollback;
    -- Si l'insertion réussit, affiche un message indiquant que le test est raté
    INSERT INTO TRACETEST VALUES ('TestTypeExperienceNegatif', 'faux');
    COMMIT;

EXCEPTION
    -- Si une erreur se produit, affiche un message indiquant que le test a réussi
    WHEN OTHERS THEN
        ROLLBACK;
        INSERT INTO TRACETEST VALUES ('TestTypeExperienceNegatif', 'ok');
        COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE TestEtatTechnicienPositif deterministic AS
BEGIN
    -- Tentative d'insertion de données valides
    INSERT INTO TECHNICIEN (etat_technicien_TECHNICIEN) VALUES ('libre');
    INSERT INTO TECHNICIEN (etat_technicien_TECHNICIEN) VALUES ('occupé');
    rollback;
    -- Si l'insertion réussit, affiche un message indiquant que le test est reussis
    INSERT INTO TraceTest VALUES ('TestEtatTechnicienPositif', 'ok');
    COMMIT;

EXCEPTION
    -- Si une erreur se produit, affiche un message indiquant que le test a rate
    WHEN OTHERS THEN
        ROLLBACK;
        INSERT INTO TraceTest VALUES ('TestEtatTechnicienPositif', 'faux');
        COMMIT;
END;
/


CREATE OR REPLACE PROCEDURE TestEtatTechnicienNegatif deterministic AS
BEGIN
    -- Tentative d'insertion de données valides
    INSERT INTO TECHNICIEN (etat_technicien_TECHNICIEN) VALUES ('??');
    rollback;
    -- Si l'insertion réussit, affiche un message indiquant que le test est rate
    INSERT INTO TraceTest VALUES ('TestEtatTechnicienNegatif', 'faux');
    COMMIT;

EXCEPTION
    -- Si une erreur se produit, affiche un message indiquant que le test a reussis
    WHEN OTHERS THEN
        ROLLBACK;
        INSERT INTO TraceTest VALUES ('TestEtatTechnicienNegatif', 'ok');
        COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE TestTypePlaquePositif deterministic AS
BEGIN
    -- Tentative d'insertion de données valides
    INSERT INTO LOT (type_plaque_LOT) VALUES ('96');
    INSERT INTO LOT (type_plaque_LOT) VALUES ('384');
    rollback;
    -- Si l'insertion réussit, affiche un message indiquant que le test est reussis
    INSERT INTO TraceTest VALUES ('TestTypePlaquePositif ', 'ok');
    COMMIT;

EXCEPTION
    -- Si une erreur se produit, affiche un message indiquant que le test a rate
    WHEN OTHERS THEN
        ROLLBACK;
        INSERT INTO TraceTest VALUES ('TestTypePlaquePositif ', 'faux');
        COMMIT;
END;
/


CREATE OR REPLACE PROCEDURE TestTypePlaqueNegatif deterministic AS
BEGIN
    -- Tentative d'insertion de données valides
    INSERT INTO LOT (type_plaque_LOT) VALUES ('49');
    rollback;
    -- Si l'insertion réussit, affiche un message indiquant que le test est rate
    INSERT INTO TraceTest VALUES ('TestTypePlaqueNegatif', 'faux');
    COMMIT;

EXCEPTION
    -- Si une erreur se produit, affiche un message indiquant que le test a reussis
    WHEN OTHERS THEN
        ROLLBACK;
        INSERT INTO TraceTest VALUES ('TestTypePlaqueNegatif', 'ok');
        COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE TestOrdrePrioritePositif deterministic AS
BEGIN
    -- Tentative d'insertion de données valides
    INSERT INTO Experience (ordre_priorite_commande) VALUES ('4');
    rollback;
    -- Si l'insertion réussit, affiche un message indiquant que le test est reussis
    INSERT INTO TraceTest VALUES ('TestOrdrePrioritePositif ', 'ok');
    COMMIT;

EXCEPTION
    -- Si une erreur se produit, affiche un message indiquant que le test a rate
    WHEN OTHERS THEN
        ROLLBACK;
        INSERT INTO TraceTest VALUES ('TestOrdrePrioritePositif ', 'faux');
        COMMIT;
END;
/


CREATE OR REPLACE PROCEDURE TestOrdrePrioriteNegatif deterministic AS
BEGIN
    -- Tentative d'insertion de données valides
    INSERT INTO Experience (ordre_priorite_commande) VALUES ('0');
    rollback;
    -- Si l'insertion réussit, affiche un message indiquant que le test est rate
    INSERT INTO TraceTest VALUES ('TestOrdrePrioriteNegatif', 'faux');
    COMMIT;

EXCEPTION
    -- Si une erreur se produit, affiche un message indiquant que le test a reussis
    WHEN OTHERS THEN
        ROLLBACK;
        INSERT INTO TraceTest VALUES ('TestOrdrePrioriteNegatif', 'ok');
        COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE TestValCouleurPositif deterministic AS
BEGIN
    -- Tentative d'insertion de données valides
    INSERT INTO Puits (RM_pixel) VALUES ('111');
    INSERT INTO Puits (RD_pixel) VALUES ('111');
    INSERT INTO Puits (VM_pixel) VALUES ('111');
    INSERT INTO Puits (VD_pixel) VALUES ('111');
    INSERT INTO Puits (BM_pixel) VALUES ('111');
    INSERT INTO Puits (BD_pixel) VALUES ('111');
    INSERT INTO Puits (TM_pixel) VALUES ('111');
    INSERT INTO Puits (TD_pixel) VALUES ('111');
    rollback;
    -- Si l'insertion réussit, affiche un message indiquant que le test est reussis
    INSERT INTO TraceTest VALUES ('TestValCouleurPositif ', 'ok');
    COMMIT;

EXCEPTION
    -- Si une erreur se produit, affiche un message indiquant que le test a rate
    WHEN OTHERS THEN
        ROLLBACK;
        INSERT INTO TraceTest VALUES ('TestValCouleurPositif', 'faux');
        COMMIT;
END;
/


CREATE OR REPLACE PROCEDURE TestValCouleurNegatif deterministic AS
BEGIN
    -- Tentative d'insertion de données valides
    INSERT INTO Puits (RM_pixel) VALUES ('444');
    INSERT INTO Puits (RD_pixel) VALUES ('444');
    INSERT INTO Puits (VM_pixel) VALUES ('444');
    INSERT INTO Puits (VD_pixel) VALUES ('444');
    INSERT INTO Puits (BM_pixel) VALUES ('444');
    INSERT INTO Puits (BD_pixel) VALUES ('444');
    INSERT INTO Puits (TM_pixel) VALUES ('444');
    INSERT INTO Puits (TD_pixel) VALUES ('444');
    rollback;
    -- Si l'insertion réussit, affiche un message indiquant que le test est rate
    INSERT INTO TraceTest VALUES ('TestValCouleurNegatif', 'faux');
    COMMIT;

EXCEPTION
    -- Si une erreur se produit, affiche un message indiquant que le test a reussis
    WHEN OTHERS THEN
        ROLLBACK;
        INSERT INTO TraceTest VALUES ('TestValCouleurNegatif', 'ok');
        COMMIT;
END;
/

BEGIN
    TestEtatPhotometreNegatif;
    TestEtatPhotometrePositif;
    TestEtatExperiencePositif;
    TestEtatExperienceNegatif;
    TestTypeExperiencePositif;
    TestTypeExperienceNegatif;
    TestEtatTechnicienPositif;
    TestEtatTechnicienNegatif;
    TestTypePlaquePositif;
    TestTypePlaqueNegatif;
    TestOrdrePrioritePositif;
    TestOrdrePrioriteNegatif;
    TestValCouleurPositif;
    TestValCouleurNegatif;
END;
/




