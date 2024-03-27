DROP TABLE TraceTest;
CREATE TABLE TraceTest (
    nom_test VARCHAR2(100),
    resultat VARCHAR2(4)
);


CREATE OR REPLACE PROCEDURE TestEtatPhotometrePositif deterministic AS
BEGIN
    -- Tentative d'insertion de donn�es valides
    INSERT INTO PHOTOMETRE VALUES (null, 'vide');
    INSERT INTO PHOTOMETRE VALUES (null, 'occup�');
    INSERT INTO PHOTOMETRE VALUES (null, 'en panne');
    rollback;
    -- Si l'insertion r�ussit, affiche un message indiquant que le test est r�ussi
    INSERT INTO TraceTest VALUES ('TestEtatPhotometrePositif', 'ok');
    COMMIT;

EXCEPTION
    -- Si une erreur se produit, affiche un message indiquant que le test a �chou�
    WHEN OTHERS THEN
        ROLLBACK;
        INSERT INTO TraceTest VALUES ('TestEtatPhotometrePositif', 'faux');
        COMMIT;
END;
/

CREATE OR REPLACE PROCEDURE TestEtatPhotometreNegatif deterministic AS
BEGIN
    -- Tentative d'insertion de donn�es valides
    INSERT INTO PHOTOMETRE VALUES (null, 'null');

    rollback;
    -- Si l'insertion r�ussit, affiche un message indiquant que le test est r�ussi
    INSERT INTO TraceTest VALUES ('TestEtatPhotometreNegatif', 'ok');
    COMMIT;

EXCEPTION
    -- Si une erreur se produit, affiche un message indiquant que le test a �chou�
    WHEN OTHERS THEN
        ROLLBACK;
        INSERT INTO TraceTest VALUES ('TestEtatPhotometreNegatif', 'faux');
        COMMIT;
END;
/
