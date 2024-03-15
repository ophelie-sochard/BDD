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
    -- Sélection de la plus grande valeur présente dans la colonne T1Id
    SELECT MAX(T1Id) INTO m FROM T1;
   
    IF m IS NULL THEN
        m := 0; -- Si la table est vide, initialiser m à 0
    ELSE
        m := m + 1; -- Sinon, incrémenter la valeur maximale de 1
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
    -- Sélectionner la valeur maximale de T1Id
    SELECT MAX(T1Id) INTO max_value FROM T1;
    -- Si la table est vide, initialiser la valeur à 0
    IF max_value IS NULL THEN
        :NEW.T1Id := 0;
    ELSE
        -- Sinon, incrémenter la valeur maximale de 1
        :NEW.T1Id := max_value + 1;
    END IF;
END;
/

BEGIN
    FOR i IN 1..1000 LOOP
        INSERT INTO T1 VALUES (NULL); -- Vous n'avez pas besoin de spécifier la valeur de T1Id car le déclencheur se chargera de l'incrémenter automatiquement
    END LOOP;
    COMMIT;
END;
/
DROP TRIGGER t_T1;
