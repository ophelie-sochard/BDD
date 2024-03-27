DROP TABLE TRACETEST;

CREATE TABLE TRACETEST (
    nom_test VARCHAR2(100),
    resultat VARCHAR2(10)
);

CREATE OR REPLACE PROCEDURE TestEtatPhotometrePositif deterministic AS
BEGIN
    -- Tentative d'insertion de donn�es valides
    INSERT INTO PHOTOMETRE (etat_photometre_PHOTOMETRE) VALUES ('vide');
    INSERT INTO PHOTOMETRE (etat_photometre_PHOTOMETRE) VALUES ('occup�');
    INSERT INTO PHOTOMETRE (etat_photometre_PHOTOMETRE) VALUES ('en panne');
    rollback;
    -- Si l'insertion r�ussit, affiche un message indiquant que le test est r�ussi
    INSERT INTO TRACETEST VALUES ('TestEtatPhotometrePositif', 'ok');
    COMMIT;

EXCEPTION
    -- Si une erreur se produit, affiche un message indiquant que le test a �chou�
    WHEN OTHERS THEN
        ROLLBACK;
        INSERT INTO TRACETEST VALUES ('TestEtatPhotometrePositif', 'faux');
        COMMIT;
END;
/
CREATE OR REPLACE PROCEDURE TestEtatPhotometreNegatif deterministic AS
BEGIN
    -- Tentative d'insertion de donn�es valides
    INSERT INTO PHOTOMETRE (etat_photometre_PHOTOMETRE) VALUES ('vide');
    rollback;
    -- Si l'insertion r�ussit, affiche un message indiquant que le test est rat�
    INSERT INTO TRACETEST VALUES ('TestEtatPhotometreNegatif', 'faux');
    COMMIT;

EXCEPTION
    -- Si une erreur se produit, affiche un message indiquant que le test a r�ussi
    WHEN OTHERS THEN
        ROLLBACK;
        INSERT INTO TRACETEST VALUES ('TestEtatPhotometreNegatif', 'ok');
        COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE TestEtatExperiencePositif deterministic AS
BEGIN
    -- Tentative d'insertion de donn�es valides
    INSERT INTO EXPERIENCE (statut_exp_EXPERIENCE) VALUES ('en cours');
    INSERT INTO EXPERIENCE (statut_exp_EXPERIENCE) VALUES ('en attente');
    INSERT INTO EXPERIENCE (statut_exp_EXPERIENCE) VALUES ('effectu�e');
    INSERT INTO EXPERIENCE (statut_exp_EXPERIENCE) VALUES ('rat�e');
    rollback;
    -- Si l'insertion r�ussit, affiche un message indiquant que le test est r�ussi
    INSERT INTO TRACETEST VALUES ('TestEtatExperiencePositif', 'ok');
    COMMIT;

EXCEPTION
    -- Si une erreur se produit, affiche un message indiquant que le test a �chou�
    WHEN OTHERS THEN
        ROLLBACK;
        INSERT INTO TRACETEST VALUES ('TestEtatExperiencePositif', 'faux');
        COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE TestEtatExperienceNegatif deterministic AS
BEGIN
    -- Tentative d'insertion de donn�es valides
    INSERT INTO EXPERIENCE (statut_exp_EXPERIENCE) VALUES ('vide');
    rollback;
    -- Si l'insertion r�ussit, affiche un message indiquant que le test est rat�
    INSERT INTO TRACETEST VALUES ('TestEtatExperienceNegatif', 'faux');
    COMMIT;

EXCEPTION
    -- Si une erreur se produit, affiche un message indiquant que le test a r�ussi
    WHEN OTHERS THEN
        ROLLBACK;
        INSERT INTO TRACETEST VALUES ('TestEtatExperienceNegatif', 'ok');
        COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE TestEtatTechnicienPositif deterministic AS
BEGIN
    -- Tentative d'insertion de données valides
    INSERT INTO TECHNICIEN (etat_technicien_TECHNICIEN) VALUES ('libre');
    INSERT INTO TECHNICIEN (etat_technicien_TECHNICIEN) VALUES ('occupé');
    rollback;
    -- Si l'insertion réussit, affiche un message indiquant que le test est réussi
    INSERT INTO TraceTest VALUES ('TestEtatTechnicienPositif', 'ok');
    COMMIT;

EXCEPTION
    -- Si une erreur se produit, affiche un message indiquant que le test a échoué
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
    -- Si l'insertion réussit, affiche un message indiquant que le test est réussi
    INSERT INTO TraceTest VALUES ('TestEtatTechnicienPositif', 'faux');
    COMMIT;

EXCEPTION
    -- Si une erreur se produit, affiche un message indiquant que le test a échoué
    WHEN OTHERS THEN
        ROLLBACK;
        INSERT INTO TraceTest VALUES ('TestEtatTechnicienPositif', 'ok');
        COMMIT;
END;
/

BEGIN
    TestEtatPhotometreNegatif;
    TestEtatPhotometrePositif;
    TestEtatExperiencePositif;
    TestEtatExperienceNegatif;
    TestEtatTechnicienPositif;
    TestEtatTechnicienNegatif;
END;
/