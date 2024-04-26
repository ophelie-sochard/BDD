-- AUBINEAU Nathan - DEWITTE Lisa - SOCHARD Ophélie

-- Peuplement de la table LOT
INSERT INTO LOT (type_plaque_LOT, date_livraison_LOT, vendeur_LOT, fabricant_LOT, stock_precedent_Stock) 
VALUES 
(96, TO_DATE('2024-01-01', 'YYYY-MM-DD'), 'Vendeur1', 'Fabricant1', 0);
INSERT INTO LOT (type_plaque_LOT, date_livraison_LOT, vendeur_LOT, fabricant_LOT, stock_precedent_Stock, stock_actuel_Stock) 
VALUES 
(384, TO_DATE('2024-01-01', 'YYYY-MM-DD'), 'Vendeur2', 'Fabricant2', 0, 80);

-- Peuplement de la table EQUIPE
INSERT INTO EQUIPE (adresse) 
VALUES ('Université de Poitiers');
INSERT INTO EQUIPE (adresse) 
VALUES ('Université de Rennes');
INSERT INTO EQUIPE (adresse) 
VALUES ('Université de Paris');
INSERT INTO EQUIPE (adresse) 
VALUES ('Université de Bordeaux');
INSERT INTO EQUIPE (adresse) 
VALUES ('Université de Angers');
INSERT INTO EQUIPE (adresse) 
VALUES ('Université de Lyon');
INSERT INTO EQUIPE (adresse) 
VALUES ('Université de Clermont-Ferand');
INSERT INTO EQUIPE (adresse) 
VALUES ('Université de Nantes');
INSERT INTO EQUIPE (adresse) 
VALUES ('Université de Lille');
INSERT INTO EQUIPE (adresse) 
VALUES ('Université de Brest');

-- Peuplement de la table TECHNICIEN
INSERT INTO TECHNICIEN (etat_technicien_TECHNICIEN) 
VALUES ('libre');
INSERT INTO TECHNICIEN (etat_technicien_TECHNICIEN) 
VALUES ('occupé');
INSERT INTO TECHNICIEN (etat_technicien_TECHNICIEN) 
VALUES ('libre');
INSERT INTO TECHNICIEN (etat_technicien_TECHNICIEN) 
VALUES ('occupé');
INSERT INTO TECHNICIEN (etat_technicien_TECHNICIEN) 
VALUES ('libre');
INSERT INTO TECHNICIEN (etat_technicien_TECHNICIEN) 
VALUES ('occupé');
INSERT INTO TECHNICIEN (etat_technicien_TECHNICIEN) 
VALUES ('libre');
INSERT INTO TECHNICIEN (etat_technicien_TECHNICIEN) 
VALUES ('occupé');
INSERT INTO TECHNICIEN (etat_technicien_TECHNICIEN) 
VALUES ('libre');
INSERT INTO TECHNICIEN (etat_technicien_TECHNICIEN) 
VALUES ('occupé');


-- Peuplement de la table CHERCHEUR
INSERT INTO CHERCHEUR (id_equipe_EQUIPE) 
VALUES ((SELECT id_equipe_EQUIPE FROM EQUIPE WHERE id_equipe_EQUIPE = 81));
INSERT INTO CHERCHEUR (id_equipe_EQUIPE) 
 VALUES ((SELECT id_equipe_EQUIPE FROM EQUIPE WHERE id_equipe_EQUIPE = 121));
INSERT INTO CHERCHEUR (id_equipe_EQUIPE)
VALUES ((SELECT id_equipe_EQUIPE FROM EQUIPE WHERE id_equipe_EQUIPE = 35));
INSERT INTO CHERCHEUR (id_equipe_EQUIPE) 
VALUES ((SELECT id_equipe_EQUIPE FROM EQUIPE WHERE id_equipe_EQUIPE = 36));
INSERT INTO CHERCHEUR (id_equipe_EQUIPE) 
VALUES ((SELECT id_equipe_EQUIPE FROM EQUIPE WHERE id_equipe_EQUIPE = 37));
INSERT INTO CHERCHEUR (id_equipe_EQUIPE) 
VALUES ((SELECT id_equipe_EQUIPE FROM EQUIPE WHERE id_equipe_EQUIPE = 38));
INSERT INTO CHERCHEUR (id_equipe_EQUIPE) 
VALUES ((SELECT id_equipe_EQUIPE FROM EQUIPE WHERE id_equipe_EQUIPE = 39));
INSERT INTO CHERCHEUR (id_equipe_EQUIPE) 
VALUES ((SELECT id_equipe_EQUIPE FROM EQUIPE WHERE id_equipe_EQUIPE = 40));
INSERT INTO CHERCHEUR (id_equipe_EQUIPE) 
VALUES ((SELECT id_equipe_EQUIPE FROM EQUIPE WHERE id_equipe_EQUIPE = 41));
INSERT INTO CHERCHEUR (id_equipe_EQUIPE) 
VALUES ((SELECT id_equipe_EQUIPE FROM EQUIPE WHERE id_equipe_EQUIPE = 42));


-- Peuplement de la table PHOTOMETRE
INSERT INTO PHOTOMETRE (etat_photometre_PHOTOMETRE) 
VALUES ('vide');
INSERT INTO PHOTOMETRE (etat_photometre_PHOTOMETRE) 
VALUES ('vide');
INSERT INTO PHOTOMETRE (etat_photometre_PHOTOMETRE) 
VALUES ('vide');
INSERT INTO PHOTOMETRE (etat_photometre_PHOTOMETRE) 
VALUES ('vide');
INSERT INTO PHOTOMETRE (etat_photometre_PHOTOMETRE) 
VALUES ('vide');
INSERT INTO PHOTOMETRE (etat_photometre_PHOTOMETRE) 
VALUES ('en panne');
INSERT INTO PHOTOMETRE (etat_photometre_PHOTOMETRE) 
VALUES ('vide');
INSERT INTO PHOTOMETRE (etat_photometre_PHOTOMETRE) 
VALUES ('vide');
INSERT INTO PHOTOMETRE (etat_photometre_PHOTOMETRE) 
VALUES ('vide');
INSERT INTO PHOTOMETRE (etat_photometre_PHOTOMETRE) 
VALUES ('vide');

-- Peuplement de la table EXPERIENCE
INSERT INTO EXPERIENCE (statut_exp_EXPERIENCE, nb_prog_EXPERIENCE, date_debut_EXPERIENCE, date_fin_EXPERIENCE, date_transmission_resultats_EXPERIENCE, cout_exp_EXPERIENCE, type_exp_EXPERIENCE, moyenne_globale_EXPERIENCE, ecart_type_global_EXPERIENCE, a1_EXPERIENCE, a2_EXPERIENCE, a3_EXPERIENCE, coef_surcout_EXPERIENCE, frequence_obs_EXPERIENCE, date_commande_COMMANDE, ordre_priorite_COMMANDE, id_technicien_TECHNICIEN, facture_id_facture_facture, id_chercheur_CHERCHEUR, id_position_ATTENTE) 
VALUES ('en cours', 2, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-05-0', 'YYYY-MM-DD'), TO_DATE('2024-05-22', 'YYYY-MM-DD'), 300.00, 'colorimétrique', 150.0, 25.0, 1, 2, 3, 2, 10, TO_DATE('2024-03-20', 'YYYY-MM-DD'), 1, (SELECT id_technicien_TECHNICIEN FROM TECHNICIEN WHERE rownum = 1), (SELECT id_facture_FACTURE FROM FACTURE WHERE rownum = 1), (SELECT id_chercheur_CHERCHEUR FROM CHERCHEUR WHERE rownum = 1), (SELECT id_position_ATTENTE FROM ATTENTE WHERE rownum = 1));
INSERT INTO EXPERIENCE (statut_exp_EXPERIENCE, nb_prog_EXPERIENCE, date_debut_EXPERIENCE, date_fin_EXPERIENCE, date_transmission_resultats_EXPERIENCE, cout_exp_EXPERIENCE, type_exp_EXPERIENCE, moyenne_globale_EXPERIENCE, ecart_type_global_EXPERIENCE, a1_EXPERIENCE, a2_EXPERIENCE, a3_EXPERIENCE, coef_surcout_EXPERIENCE, frequence_obs_EXPERIENCE, date_commande_COMMANDE, ordre_priorite_COMMANDE, id_technicien_TECHNICIEN, facture_id_facture_facture, id_chercheur_CHERCHEUR, id_position_ATTENTE) 
VALUES ('en cours', 2, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-05-30', 'YYYY-MM-DD'), TO_DATE('2024-05-22', 'YYYY-MM-DD'), 300.00, 'opacimétrique', 150.0, 25.0, 1, 2, 3, 2, 10, TO_DATE('2024-03-20', 'YYYY-MM-DD'), 1, (SELECT id_technicien_TECHNICIEN FROM TECHNICIEN WHERE rownum = 1), (SELECT id_facture_FACTURE FROM FACTURE WHERE rownum = 1), (SELECT id_chercheur_CHERCHEUR FROM CHERCHEUR WHERE rownum = 1), (SELECT id_position_ATTENTE FROM ATTENTE WHERE rownum = 1));
INSERT INTO EXPERIENCE (statut_exp_EXPERIENCE, nb_prog_EXPERIENCE, date_debut_EXPERIENCE, date_fin_EXPERIENCE, date_transmission_resultats_EXPERIENCE, cout_exp_EXPERIENCE, type_exp_EXPERIENCE, moyenne_globale_EXPERIENCE, ecart_type_global_EXPERIENCE, a1_EXPERIENCE, a2_EXPERIENCE, a3_EXPERIENCE, coef_surcout_EXPERIENCE, frequence_obs_EXPERIENCE, date_commande_COMMANDE, ordre_priorite_COMMANDE, id_technicien_TECHNICIEN, facture_id_facture_facture, id_chercheur_CHERCHEUR, id_position_ATTENTE) 
VALUES ('en cours', 2, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-05-30', 'YYYY-MM-DD'), TO_DATE('2024-05-22', 'YYYY-MM-DD'), 300.00, 'colorimétrique', 150.0, 25.0, 1, 2, 3, 2, 10, TO_DATE('2024-03-20', 'YYYY-MM-DD'), 1, (SELECT id_technicien_TECHNICIEN FROM TECHNICIEN WHERE rownum = 1), (SELECT id_facture_FACTURE FROM FACTURE WHERE rownum = 1), (SELECT id_chercheur_CHERCHEUR FROM CHERCHEUR WHERE rownum = 1), (SELECT id_position_ATTENTE FROM ATTENTE WHERE rownum = 1));
INSERT INTO EXPERIENCE (statut_exp_EXPERIENCE, nb_prog_EXPERIENCE, date_debut_EXPERIENCE, date_fin_EXPERIENCE, date_transmission_resultats_EXPERIENCE, cout_exp_EXPERIENCE, type_exp_EXPERIENCE, moyenne_globale_EXPERIENCE, ecart_type_global_EXPERIENCE, a1_EXPERIENCE, a2_EXPERIENCE, a3_EXPERIENCE, coef_surcout_EXPERIENCE, frequence_obs_EXPERIENCE, date_commande_COMMANDE, ordre_priorite_COMMANDE, id_technicien_TECHNICIEN, facture_id_facture_facture, id_chercheur_CHERCHEUR, id_position_ATTENTE) 
VALUES ('en cours', 2, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-05-30', 'YYYY-MM-DD'), TO_DATE('2024-05-22', 'YYYY-MM-DD'), 300.00, 'opacimétrique', 150.0, 25.0, 1, 2, 3, 2, 10, TO_DATE('2024-03-20', 'YYYY-MM-DD'), 1, (SELECT id_technicien_TECHNICIEN FROM TECHNICIEN WHERE rownum = 1), (SELECT id_facture_FACTURE FROM FACTURE WHERE rownum = 1), (SELECT id_chercheur_CHERCHEUR FROM CHERCHEUR WHERE rownum = 1), (SELECT id_position_ATTENTE FROM ATTENTE WHERE rownum = 1));
INSERT INTO EXPERIENCE (statut_exp_EXPERIENCE, nb_prog_EXPERIENCE, date_debut_EXPERIENCE, date_fin_EXPERIENCE, date_transmission_resultats_EXPERIENCE, cout_exp_EXPERIENCE, type_exp_EXPERIENCE, moyenne_globale_EXPERIENCE, ecart_type_global_EXPERIENCE, a1_EXPERIENCE, a2_EXPERIENCE, a3_EXPERIENCE, coef_surcout_EXPERIENCE, frequence_obs_EXPERIENCE, date_commande_COMMANDE, ordre_priorite_COMMANDE, id_technicien_TECHNICIEN, facture_id_facture_facture, id_chercheur_CHERCHEUR, id_position_ATTENTE) 
VALUES ('en cours', 2, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-05-30', 'YYYY-MM-DD'), TO_DATE('2024-05-22', 'YYYY-MM-DD'), 300.00, 'colorimétrique', 150.0, 25.0, 1, 2, 3, 2, 10, TO_DATE('2024-03-20', 'YYYY-MM-DD'), 1, (SELECT id_technicien_TECHNICIEN FROM TECHNICIEN WHERE rownum = 1), (SELECT id_facture_FACTURE FROM FACTURE WHERE rownum = 1), (SELECT id_chercheur_CHERCHEUR FROM CHERCHEUR WHERE rownum = 1), (SELECT id_position_ATTENTE FROM ATTENTE WHERE rownum = 1));
INSERT INTO EXPERIENCE (statut_exp_EXPERIENCE, nb_prog_EXPERIENCE, date_debut_EXPERIENCE, date_fin_EXPERIENCE, date_transmission_resultats_EXPERIENCE, cout_exp_EXPERIENCE, type_exp_EXPERIENCE, moyenne_globale_EXPERIENCE, ecart_type_global_EXPERIENCE, a1_EXPERIENCE, a2_EXPERIENCE, a3_EXPERIENCE, coef_surcout_EXPERIENCE, frequence_obs_EXPERIENCE, date_commande_COMMANDE, ordre_priorite_COMMANDE, id_technicien_TECHNICIEN, facture_id_facture_facture, id_chercheur_CHERCHEUR, id_position_ATTENTE) 
VALUES ('en cours', 2, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-05-30', 'YYYY-MM-DD'), TO_DATE('2024-05-22', 'YYYY-MM-DD'), 300.00, 'opacimétrique', 150.0, 25.0, 1, 2, 3, 2, 10, TO_DATE('2024-03-20', 'YYYY-MM-DD'), 1, (SELECT id_technicien_TECHNICIEN FROM TECHNICIEN WHERE rownum = 1), (SELECT id_facture_FACTURE FROM FACTURE WHERE rownum = 1), (SELECT id_chercheur_CHERCHEUR FROM CHERCHEUR WHERE rownum = 1), (SELECT id_position_ATTENTE FROM ATTENTE WHERE rownum = 1));
INSERT INTO EXPERIENCE (statut_exp_EXPERIENCE, nb_prog_EXPERIENCE, date_debut_EXPERIENCE, date_fin_EXPERIENCE, date_transmission_resultats_EXPERIENCE, cout_exp_EXPERIENCE, type_exp_EXPERIENCE, moyenne_globale_EXPERIENCE, ecart_type_global_EXPERIENCE, a1_EXPERIENCE, a2_EXPERIENCE, a3_EXPERIENCE, coef_surcout_EXPERIENCE, frequence_obs_EXPERIENCE, date_commande_COMMANDE, ordre_priorite_COMMANDE, id_technicien_TECHNICIEN, facture_id_facture_facture, id_chercheur_CHERCHEUR, id_position_ATTENTE) 
VALUES ('en cours', 2, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-05-30', 'YYYY-MM-DD'), TO_DATE('2024-05-22', 'YYYY-MM-DD'), 300.00, 'colorimétrique', 150.0, 25.0, 1, 2, 3, 2, 10, TO_DATE('2024-03-20', 'YYYY-MM-DD'), 1, (SELECT id_technicien_TECHNICIEN FROM TECHNICIEN WHERE rownum = 1), (SELECT id_facture_FACTURE FROM FACTURE WHERE rownum = 1), (SELECT id_chercheur_CHERCHEUR FROM CHERCHEUR WHERE rownum = 1), (SELECT id_position_ATTENTE FROM ATTENTE WHERE rownum = 1));
INSERT INTO EXPERIENCE (statut_exp_EXPERIENCE, nb_prog_EXPERIENCE, date_debut_EXPERIENCE, date_fin_EXPERIENCE, date_transmission_resultats_EXPERIENCE, cout_exp_EXPERIENCE, type_exp_EXPERIENCE, moyenne_globale_EXPERIENCE, ecart_type_global_EXPERIENCE, a1_EXPERIENCE, a2_EXPERIENCE, a3_EXPERIENCE, coef_surcout_EXPERIENCE, frequence_obs_EXPERIENCE, date_commande_COMMANDE, ordre_priorite_COMMANDE, id_technicien_TECHNICIEN, facture_id_facture_facture, id_chercheur_CHERCHEUR, id_position_ATTENTE) 
VALUES ('en cours', 2, TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-05-30', 'YYYY-MM-DD'), TO_DATE('2024-05-22', 'YYYY-MM-DD'), 300.00, 'opacimétrique', 150.0, 25.0, 1, 2, 3, 2, 10, TO_DATE('2024-03-20', 'YYYY-MM-DD'), 1, (SELECT id_technicien_TECHNICIEN FROM TECHNICIEN WHERE rownum = 1), (SELECT id_facture_FACTURE FROM FACTURE WHERE rownum = 1), (SELECT id_chercheur_CHERCHEUR FROM CHERCHEUR WHERE rownum = 1), (SELECT id_position_ATTENTE FROM ATTENTE WHERE rownum = 1));


delete from LOT;
delete from PLAQUE;
delete from EQUIPE;
delete from FACTURE;
delete from TECHNICIEN;
delete from CHERCHEUR;
delete from PHOTOMETRE;
delete from ATTENTE;
delete from EXPERIENCE;
delete from GROUPE;
delete from PUITS;



INSERT INTO EXPERIENCE (TYPE_EXP_EXPERIENCE,daTE_commande_commande,ORDRE_PRIORITE_COMMANDE,id_technicien_TECHNICIEN, id_chercheur_CHERCHEUR, NB_GROUPE) 
VALUES ('opacimétrique',sysdate,1,(SELECT id_technicien_TECHNICIEN FROM TECHNICIEN ORDER BY DBMS_RANDOM.VALUE() FETCH FIRST 1 ROW ONLY),
    (SELECT id_chercheur_CHERCHEUR FROM CHERCHEUR ORDER BY DBMS_RANDOM.VALUE() FETCH FIRST 1 ROW ONLY)
,1);

update experience
set TYPE_EXP_EXPERIENCE='opacimétrique'
where ID_EXP_EXPERIENCE =754;

UPDATE puits
SET 
    X_PUITS_PUITS = 10,
    Y_PUITS_PUITS = 10,
    RM_PIXEL = 10,
    RD_PIXEL = 10,
    VM_PIXEL = 10,
    VD_PIXEL = 10,
    BM_PIXEL = 10,
    BD_PIXEL = 10,
    TM_PIXEL = null,
    TD_PIXEL = null
WHERE ID_PUITS_PUITS = 48841;
UPDATE puits
SET 
    X_PUITS_PUITS = 20,
    Y_PUITS_PUITS = 20,
    RM_PIXEL = 10,
    RD_PIXEL = 10,
    VM_PIXEL = 10,
    VD_PIXEL = 10,
    BM_PIXEL = 10,
    BD_PIXEL = 10
WHERE ID_PUITS_PUITS = 48842;
UPDATE puits
SET 
    X_PUITS_PUITS = 30,
    Y_PUITS_PUITS = 30,
    RM_PIXEL = 10,
    RD_PIXEL = 20,
    VM_PIXEL = 10,
    VD_PIXEL = 10,
    BM_PIXEL = 10,
    BD_PIXEL = 10
WHERE ID_PUITS_PUITS = 48843;


UPDATE puits
SET 
    TM_PIXEL = 10,
    TD_PIXEL = 10
WHERE ID_PUITS_PUITS = 48868;


