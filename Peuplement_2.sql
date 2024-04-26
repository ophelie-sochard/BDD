delete from PLAQUE;
delete from LOT;
delete from FACTURE;
delete from EXPERIENCE;
delete from ATTENTE;
delete from PHOTOMETRE;
delete from CHERCHEUR;
delete from EQUIPE;
delete from TECHNICIEN;
delete from GROUPE;
delete from PUITS;

-- Peuplement de LOT
INSERT INTO LOT (type_plaque_LOT, date_livraison_LOT, vendeur_LOT, fabricant_LOT) 
VALUES (96, TO_DATE('2024-01-01', 'YYYY-MM-DD'), 'Vendeur1', 'Fabricant1');
INSERT INTO LOT (type_plaque_LOT, date_livraison_LOT, vendeur_LOT, fabricant_LOT) 
VALUES (384, TO_DATE('2024-02-02', 'YYYY-MM-DD'), 'Vendeur2', 'Fabricant2');
INSERT INTO LOT (type_plaque_LOT, date_livraison_LOT, vendeur_LOT, fabricant_LOT) 
VALUES (384, TO_DATE('2024-02-10', 'YYYY-MM-DD'), 'Vendeur1', 'Fabricant3');
INSERT INTO LOT (type_plaque_LOT, date_livraison_LOT, vendeur_LOT, fabricant_LOT) 
VALUES (96, TO_DATE('2024-02-28', 'YYYY-MM-DD'), 'Vendeur2', 'Fabricant1');
INSERT INTO LOT (type_plaque_LOT, date_livraison_LOT, vendeur_LOT, fabricant_LOT) 
VALUES (96, TO_DATE('2024-03-05', 'YYYY-MM-DD'), 'Vendeur1', 'Fabricant1');
INSERT INTO LOT (type_plaque_LOT, date_livraison_LOT, vendeur_LOT, fabricant_LOT) 
VALUES (96, TO_DATE('2024-03-07', 'YYYY-MM-DD'), 'Vendeur3', 'Fabricant1');
INSERT INTO LOT (type_plaque_LOT, date_livraison_LOT, vendeur_LOT, fabricant_LOT) 
VALUES (96, TO_DATE('2024-03-17', 'YYYY-MM-DD'), 'Vendeur2', 'Fabricant2');
INSERT INTO LOT (type_plaque_LOT, date_livraison_LOT, vendeur_LOT, fabricant_LOT) 
VALUES (384, TO_DATE('2024-03-17', 'YYYY-MM-DD'), 'Vendeur2', 'Fabricant2');
INSERT INTO LOT (type_plaque_LOT, date_livraison_LOT, vendeur_LOT, fabricant_LOT) 
VALUES (384, TO_DATE('2024-03-30', 'YYYY-MM-DD'), 'Vendeur1', 'Fabricant3');
INSERT INTO LOT (type_plaque_LOT, date_livraison_LOT, vendeur_LOT, fabricant_LOT) 
VALUES (96, TO_DATE('2024-04-13', 'YYYY-MM-DD'), 'Vendeur2', 'Fabricant3');

-- Peuplement de PLAQUE automatique

-- Peuplement de TECHNICIEN
INSERT INTO TECHNICIEN (etat_technicien_TECHNICIEN) VALUES ('libre');
INSERT INTO TECHNICIEN (etat_technicien_TECHNICIEN) VALUES ('occupé');
INSERT INTO TECHNICIEN (etat_technicien_TECHNICIEN) VALUES ('libre');
INSERT INTO TECHNICIEN (etat_technicien_TECHNICIEN) VALUES ('occupé');
INSERT INTO TECHNICIEN (etat_technicien_TECHNICIEN) VALUES ('libre');
INSERT INTO TECHNICIEN (etat_technicien_TECHNICIEN) VALUES ('occupé');
INSERT INTO TECHNICIEN (etat_technicien_TECHNICIEN) VALUES ('libre');
INSERT INTO TECHNICIEN (etat_technicien_TECHNICIEN) VALUES ('occupé');
INSERT INTO TECHNICIEN (etat_technicien_TECHNICIEN) VALUES ('libre');
INSERT INTO TECHNICIEN (etat_technicien_TECHNICIEN) VALUES ('occupé');

-- Peuplement de PHOTOMETRE et ATTENTE
INSERT INTO PHOTOMETRE (etat_photometre_PHOTOMETRE) VALUES ('vide');
INSERT INTO ATTENTE (id_photometre_photometre) VALUES ((SELECT MAX(id_photometre_photometre) FROM PHOTOMETRE));
INSERT INTO PHOTOMETRE (etat_photometre_PHOTOMETRE) VALUES ('vide');
INSERT INTO ATTENTE (id_photometre_photometre) VALUES ((SELECT MAX(id_photometre_photometre) FROM PHOTOMETRE));
INSERT INTO PHOTOMETRE (etat_photometre_PHOTOMETRE) VALUES ('vide');
INSERT INTO ATTENTE (id_photometre_photometre) VALUES ((SELECT MAX(id_photometre_photometre) FROM PHOTOMETRE));
INSERT INTO PHOTOMETRE (etat_photometre_PHOTOMETRE) VALUES ('vide');
INSERT INTO ATTENTE (id_photometre_photometre) VALUES ((SELECT MAX(id_photometre_photometre) FROM PHOTOMETRE));
INSERT INTO PHOTOMETRE (etat_photometre_PHOTOMETRE) VALUES ('vide');
INSERT INTO ATTENTE (id_photometre_photometre) VALUES ((SELECT MAX(id_photometre_photometre) FROM PHOTOMETRE));
INSERT INTO PHOTOMETRE (etat_photometre_PHOTOMETRE) VALUES ('en panne');
INSERT INTO ATTENTE (id_photometre_photometre) VALUES ((SELECT MAX(id_photometre_photometre) FROM PHOTOMETRE));
INSERT INTO PHOTOMETRE (etat_photometre_PHOTOMETRE) VALUES ('vide');
INSERT INTO ATTENTE (id_photometre_photometre) VALUES ((SELECT MAX(id_photometre_photometre) FROM PHOTOMETRE));
INSERT INTO PHOTOMETRE (etat_photometre_PHOTOMETRE) VALUES ('vide');
INSERT INTO ATTENTE (id_photometre_photometre) VALUES ((SELECT MAX(id_photometre_photometre) FROM PHOTOMETRE));
INSERT INTO PHOTOMETRE (etat_photometre_PHOTOMETRE) VALUES ('vide');
INSERT INTO ATTENTE (id_photometre_photometre) VALUES ((SELECT MAX(id_photometre_photometre) FROM PHOTOMETRE));
INSERT INTO PHOTOMETRE (etat_photometre_PHOTOMETRE) VALUES ('vide');
INSERT INTO ATTENTE (id_photometre_photometre) VALUES ((SELECT MAX(id_photometre_photometre) FROM PHOTOMETRE));

-- Peuplement de EQUIPE et FACTURE
INSERT INTO EQUIPE (adresse) VALUES ('Université de Poitiers');
INSERT INTO FACTURE (cout_facture_facture, id_equipe_equipe) VALUES (0, (SELECT MAX(id_equipe_equipe) FROM EQUIPE));
INSERT INTO EQUIPE (adresse) VALUES ('Université de Rennes');
INSERT INTO FACTURE (cout_facture_facture, id_equipe_equipe) VALUES (0, (SELECT MAX(id_equipe_equipe) FROM EQUIPE));
INSERT INTO EQUIPE (adresse) VALUES ('Université de Paris');
INSERT INTO FACTURE (cout_facture_facture, id_equipe_equipe) VALUES (0, (SELECT MAX(id_equipe_equipe) FROM EQUIPE));
INSERT INTO EQUIPE (adresse) VALUES ('Université de Bordeaux');
INSERT INTO FACTURE (cout_facture_facture, id_equipe_equipe) VALUES (0, (SELECT MAX(id_equipe_equipe) FROM EQUIPE));
INSERT INTO EQUIPE (adresse) VALUES ('Université de Angers');
INSERT INTO FACTURE (cout_facture_facture, id_equipe_equipe) VALUES (0, (SELECT MAX(id_equipe_equipe) FROM EQUIPE));
INSERT INTO EQUIPE (adresse) VALUES ('Université de Lyon');
INSERT INTO FACTURE (cout_facture_facture, id_equipe_equipe) VALUES (0, (SELECT MAX(id_equipe_equipe) FROM EQUIPE));
INSERT INTO EQUIPE (adresse) VALUES ('Université de Clermont-Ferand');
INSERT INTO FACTURE (cout_facture_facture, id_equipe_equipe) VALUES (0, (SELECT MAX(id_equipe_equipe) FROM EQUIPE));
INSERT INTO EQUIPE (adresse) VALUES ('Université de Nantes');
INSERT INTO FACTURE (cout_facture_facture, id_equipe_equipe) VALUES (0, (SELECT MAX(id_equipe_equipe) FROM EQUIPE));
INSERT INTO EQUIPE (adresse) VALUES ('Université de Lille');
INSERT INTO FACTURE (cout_facture_facture, id_equipe_equipe) VALUES (0, (SELECT MAX(id_equipe_equipe) FROM EQUIPE));
INSERT INTO EQUIPE (adresse) VALUES ('Université de Brest');
INSERT INTO FACTURE (cout_facture_facture, id_equipe_equipe) VALUES (0, (SELECT MAX(id_equipe_equipe) FROM EQUIPE));

-- Peuplement de CHERCHEUR
BEGIN
    FOR i IN 1..10 LOOP
        INSERT INTO CHERCHEUR (id_equipe_EQUIPE)
        SELECT id_equipe_EQUIPE
        FROM (
            SELECT id_equipe_EQUIPE
            FROM EQUIPE
            ORDER BY DBMS_RANDOM.VALUE
        )
        WHERE ROWNUM = 1;
    END LOOP;
END;
/

-- Peuplement de EXPERIENCE
INSERT INTO EXPERIENCE (TYPE_EXP_EXPERIENCE,date_commande_commande,ORDRE_PRIORITE_COMMANDE,id_technicien_TECHNICIEN, id_chercheur_CHERCHEUR, NB_GROUPE) 
VALUES ('opacimétrique',sysdate,1,(SELECT id_technicien_TECHNICIEN FROM TECHNICIEN ORDER BY DBMS_RANDOM.VALUE() FETCH FIRST 1 ROW ONLY),
       (SELECT id_chercheur_CHERCHEUR FROM CHERCHEUR ORDER BY DBMS_RANDOM.VALUE() FETCH FIRST 1 ROW ONLY),1);
INSERT INTO EXPERIENCE (TYPE_EXP_EXPERIENCE,date_commande_commande,ORDRE_PRIORITE_COMMANDE,id_technicien_TECHNICIEN, id_chercheur_CHERCHEUR, NB_GROUPE) 
VALUES ('colorimétrique',sysdate,2,(SELECT id_technicien_TECHNICIEN FROM TECHNICIEN ORDER BY DBMS_RANDOM.VALUE() FETCH FIRST 1 ROW ONLY),
       (SELECT id_chercheur_CHERCHEUR FROM CHERCHEUR ORDER BY DBMS_RANDOM.VALUE() FETCH FIRST 1 ROW ONLY),3);  
INSERT INTO EXPERIENCE (TYPE_EXP_EXPERIENCE,date_commande_commande,ORDRE_PRIORITE_COMMANDE,id_technicien_TECHNICIEN, id_chercheur_CHERCHEUR, NB_GROUPE) 
VALUES ('opacimétrique',sysdate,1,(SELECT id_technicien_TECHNICIEN FROM TECHNICIEN ORDER BY DBMS_RANDOM.VALUE() FETCH FIRST 1 ROW ONLY),
       (SELECT id_chercheur_CHERCHEUR FROM CHERCHEUR ORDER BY DBMS_RANDOM.VALUE() FETCH FIRST 1 ROW ONLY),6);
INSERT INTO EXPERIENCE (TYPE_EXP_EXPERIENCE,date_commande_commande,ORDRE_PRIORITE_COMMANDE,id_technicien_TECHNICIEN, id_chercheur_CHERCHEUR, NB_GROUPE) 
VALUES ('colorimétrique',sysdate,4,(SELECT id_technicien_TECHNICIEN FROM TECHNICIEN ORDER BY DBMS_RANDOM.VALUE() FETCH FIRST 1 ROW ONLY),
       (SELECT id_chercheur_CHERCHEUR FROM CHERCHEUR ORDER BY DBMS_RANDOM.VALUE() FETCH FIRST 1 ROW ONLY),10);
INSERT INTO EXPERIENCE (TYPE_EXP_EXPERIENCE,date_commande_commande,ORDRE_PRIORITE_COMMANDE,id_technicien_TECHNICIEN, id_chercheur_CHERCHEUR, NB_GROUPE) 
VALUES ('opacimétrique',sysdate,5,(SELECT id_technicien_TECHNICIEN FROM TECHNICIEN ORDER BY DBMS_RANDOM.VALUE() FETCH FIRST 1 ROW ONLY),
       (SELECT id_chercheur_CHERCHEUR FROM CHERCHEUR ORDER BY DBMS_RANDOM.VALUE() FETCH FIRST 1 ROW ONLY),2);
INSERT INTO EXPERIENCE (TYPE_EXP_EXPERIENCE,date_commande_commande,ORDRE_PRIORITE_COMMANDE,id_technicien_TECHNICIEN, id_chercheur_CHERCHEUR, NB_GROUPE) 
VALUES ('colorimétrique',sysdate,2,(SELECT id_technicien_TECHNICIEN FROM TECHNICIEN ORDER BY DBMS_RANDOM.VALUE() FETCH FIRST 1 ROW ONLY),
       (SELECT id_chercheur_CHERCHEUR FROM CHERCHEUR ORDER BY DBMS_RANDOM.VALUE() FETCH FIRST 1 ROW ONLY),5);
INSERT INTO EXPERIENCE (TYPE_EXP_EXPERIENCE,date_commande_commande,ORDRE_PRIORITE_COMMANDE,id_technicien_TECHNICIEN, id_chercheur_CHERCHEUR, NB_GROUPE) 
VALUES ('opacimétrique',sysdate,3,(SELECT id_technicien_TECHNICIEN FROM TECHNICIEN ORDER BY DBMS_RANDOM.VALUE() FETCH FIRST 1 ROW ONLY),
       (SELECT id_chercheur_CHERCHEUR FROM CHERCHEUR ORDER BY DBMS_RANDOM.VALUE() FETCH FIRST 1 ROW ONLY),4);
INSERT INTO EXPERIENCE (TYPE_EXP_EXPERIENCE,date_commande_commande,ORDRE_PRIORITE_COMMANDE,id_technicien_TECHNICIEN, id_chercheur_CHERCHEUR, NB_GROUPE) 
VALUES ('colorimétrique',sysdate,3,(SELECT id_technicien_TECHNICIEN FROM TECHNICIEN ORDER BY DBMS_RANDOM.VALUE() FETCH FIRST 1 ROW ONLY),
       (SELECT id_chercheur_CHERCHEUR FROM CHERCHEUR ORDER BY DBMS_RANDOM.VALUE() FETCH FIRST 1 ROW ONLY),1);
INSERT INTO EXPERIENCE (TYPE_EXP_EXPERIENCE,date_commande_commande,ORDRE_PRIORITE_COMMANDE,id_technicien_TECHNICIEN, id_chercheur_CHERCHEUR, NB_GROUPE) 
VALUES ('opacimétrique',sysdate,1,(SELECT id_technicien_TECHNICIEN FROM TECHNICIEN ORDER BY DBMS_RANDOM.VALUE() FETCH FIRST 1 ROW ONLY),
       (SELECT id_chercheur_CHERCHEUR FROM CHERCHEUR ORDER BY DBMS_RANDOM.VALUE() FETCH FIRST 1 ROW ONLY),3);
INSERT INTO EXPERIENCE (TYPE_EXP_EXPERIENCE,date_commande_commande,ORDRE_PRIORITE_COMMANDE,id_technicien_TECHNICIEN, id_chercheur_CHERCHEUR, NB_GROUPE) 
VALUES ('colorimétrique',sysdate,4,(SELECT id_technicien_TECHNICIEN FROM TECHNICIEN ORDER BY DBMS_RANDOM.VALUE() FETCH FIRST 1 ROW ONLY),
       (SELECT id_chercheur_CHERCHEUR FROM CHERCHEUR ORDER BY DBMS_RANDOM.VALUE() FETCH FIRST 1 ROW ONLY),7);
       
-- Peuplement de GROUPE et PUITS automatique

