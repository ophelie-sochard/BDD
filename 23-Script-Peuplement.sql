
-- Peuplement de la table LOT
INSERT INTO LOT (type_plaque_LOT, date_livraison_LOT, vendeur_LOT, fabricant_LOT, stock_precedent_Stock, stock_actuel_Stock) 
VALUES 
(96, TO_DATE('2024-01-01', 'YYYY-MM-DD'), 'Vendeur1', 'Fabricant1', 0, 80);

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

-- Peuplement de la table FACTURE
INSERT INTO FACTURE (date_facture_FACTURE, cout_facture_FACTURE, id_equipe_EQUIPE) 
VALUES (TO_DATE('2024-03-15', 'YYYY-MM-DD'), 500.00, (SELECT id_equipe_EQUIPE FROM EQUIPE WHERE id_equipe_EQUIPE = 33));
INSERT INTO FACTURE (date_facture_FACTURE, cout_facture_FACTURE, id_equipe_EQUIPE) 
VALUES (TO_DATE('2024-03-15', 'YYYY-MM-DD'), 500.00, (SELECT id_equipe_EQUIPE FROM EQUIPE WHERE id_equipe_EQUIPE = 34));
INSERT INTO FACTURE (date_facture_FACTURE, cout_facture_FACTURE, id_equipe_EQUIPE) 
VALUES (TO_DATE('2024-03-15', 'YYYY-MM-DD'), 500.00, (SELECT id_equipe_EQUIPE FROM EQUIPE WHERE id_equipe_EQUIPE = 35));
INSERT INTO FACTURE (date_facture_FACTURE, cout_facture_FACTURE, id_equipe_EQUIPE) 
VALUES (TO_DATE('2024-03-15', 'YYYY-MM-DD'), 500.00, (SELECT id_equipe_EQUIPE FROM EQUIPE WHERE id_equipe_EQUIPE = 36));
INSERT INTO FACTURE (date_facture_FACTURE, cout_facture_FACTURE, id_equipe_EQUIPE) 
VALUES (TO_DATE('2024-03-15', 'YYYY-MM-DD'), 500.00, (SELECT id_equipe_EQUIPE FROM EQUIPE WHERE id_equipe_EQUIPE = 37));
INSERT INTO FACTURE (date_facture_FACTURE, cout_facture_FACTURE, id_equipe_EQUIPE) 
VALUES (TO_DATE('2024-03-15', 'YYYY-MM-DD'), 500.00, (SELECT id_equipe_EQUIPE FROM EQUIPE WHERE id_equipe_EQUIPE = 38));
INSERT INTO FACTURE (date_facture_FACTURE, cout_facture_FACTURE, id_equipe_EQUIPE) 
VALUES (TO_DATE('2024-03-15', 'YYYY-MM-DD'), 500.00, (SELECT id_equipe_EQUIPE FROM EQUIPE WHERE id_equipe_EQUIPE = 39));
INSERT INTO FACTURE (date_facture_FACTURE, cout_facture_FACTURE, id_equipe_EQUIPE) 
VALUES (TO_DATE('2024-03-15', 'YYYY-MM-DD'), 500.00, (SELECT id_equipe_EQUIPE FROM EQUIPE WHERE id_equipe_EQUIPE = 40));
INSERT INTO FACTURE (date_facture_FACTURE, cout_facture_FACTURE, id_equipe_EQUIPE) 
VALUES (TO_DATE('2024-03-15', 'YYYY-MM-DD'), 500.00, (SELECT id_equipe_EQUIPE FROM EQUIPE WHERE id_equipe_EQUIPE = 41));
INSERT INTO FACTURE (date_facture_FACTURE, cout_facture_FACTURE, id_equipe_EQUIPE) 
VALUES (TO_DATE('2024-03-15', 'YYYY-MM-DD'), 500.00, (SELECT id_equipe_EQUIPE FROM EQUIPE WHERE id_equipe_EQUIPE = 42));


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
VALUES ((SELECT id_equipe_EQUIPE FROM EQUIPE WHERE id_equipe_EQUIPE = 34));
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

INSERT INTO LOT (type_plaque_LOT, date_livraison_LOT, vendeur_LOT, fabricant_LOT, stock_precedent_Stock) 
VALUES 
(96, TO_DATE('2024-04-05', 'YYYY-MM-DD'), 'Vendeur1', 'Fabricant1', 0);

INSERT INTO GROUPE (code_barre_plaque_PLAQUE) VALUES ('1234');

INSERT INTO EXPERIENCE (id_technicien_TECHNICIEN, id_chercheur_CHERCHEUR, NB_GROUPE) 
VALUES ((SELECT id_technicien_TECHNICIEN FROM TECHNICIEN WHERE id_technicien_TECHNICIEN = 61), (SELECT id_chercheur_CHERCHEUR FROM CHERCHEUR WHERE id_chercheur_CHERCHEUR = 61),1);

