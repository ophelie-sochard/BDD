Drop table MaTable cascade constraints; 

CREATE TABLE T1 (
    T1Id NUMBER
);

CREATE TABLE T2 (
    T2Id NUMBER
);

DECLARE
    m NUMBER;
BEGIN
FOR i IN 1..1000 LOOP
    -- S�lection de la plus grande valeur pr�sente dans la colonne T1Id
    SELECT MAX(T1Id) INTO m FROM T1;
   
    IF m IS NULL THEN
        m := 0; -- Si la table est vide, initialiser m � 0
    ELSE
        m := m + 1; -- Sinon, incr�menter la valeur maximale de 1
    END IF;
    
    -- Insertion d'une nouvelle ligne dans T1 avec la valeur m+1
    INSERT INTO T1 (T1Id) VALUES (m);
    COMMIT;
end loop;
END;
/
delete from T1;

CREATE OR REPLACE TRIGGER t_T1
BEFORE INSERT ON T1
FOR EACH ROW
DECLARE
    max_value NUMBER;
BEGIN
    -- S�lectionner la valeur maximale de T1Id
    SELECT MAX(T1Id) INTO max_value FROM T1;
    -- Si la table est vide, initialiser la valeur � 0
    IF max_value IS NULL THEN
        :NEW.T1Id := 0;
    ELSE
        -- Sinon, incr�menter la valeur maximale de 1
        :NEW.T1Id := max_value + 1;
    END IF;
END;
/

BEGIN
    FOR i IN 1..1000 LOOP
        INSERT INTO T1 VALUES (NULL); -- Vous n'avez pas besoin de sp�cifier la valeur de T1Id car le d�clencheur se chargera de l'incr�menter automatiquement
    END LOOP;
    COMMIT;
END;
/
DROP TRIGGER t_T1;
