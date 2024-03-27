
-- Peuplement de la table LOT
INSERT INTO LOT (type_plaque_LOT, date_livraison_LOT, vendeur_LOT, fabricant_LOT, stock_precedent_Stock, stock_actuel_Stock) 
VALUES 
(96, TO_DATE('2024-01-01', 'YYYY-MM-DD'), 'Vendeur1', 'Fabricant1', 0, 80);
INSERT INTO LOT (type_plaque_LOT, date_livraison_LOT, vendeur_LOT, fabricant_LOT, stock_precedent_Stock, stock_actuel_Stock) 
VALUES
(384, TO_DATE('2024-01-01', 'YYYY-MM-DD'), 'Vendeur2', 'Fabricant2', 0, 80);
INSERT INTO LOT (type_plaque_LOT, date_livraison_LOT, vendeur_LOT, fabricant_LOT, stock_precedent_Stock, stock_actuel_Stock) 
VALUES
(96, TO_DATE('2024-02-01', 'YYYY-MM-DD'), 'Vendeur1', 'Fabricant1', 80, 160);
INSERT INTO LOT (type_plaque_LOT, date_livraison_LOT, vendeur_LOT, fabricant_LOT, stock_precedent_Stock, stock_actuel_Stock) 
VALUES
(384, TO_DATE('2024-02-01', 'YYYY-MM-DD'), 'Vendeur2', 'Fabricant2', 80, 160);
INSERT INTO LOT (type_plaque_LOT, date_livraison_LOT, vendeur_LOT, fabricant_LOT, stock_precedent_Stock, stock_actuel_Stock) 
VALUES
(96, TO_DATE('2024-03-01', 'YYYY-MM-DD'), 'Vendeur1', 'Fabricant1', 160, 160);
INSERT INTO LOT (type_plaque_LOT, date_livraison_LOT, vendeur_LOT, fabricant_LOT, stock_precedent_Stock, stock_actuel_Stock) 
VALUES
(384, TO_DATE('2024-03-01', 'YYYY-MM-DD'), 'Vendeur2', 'Fabricant2', 160, 160);
INSERT INTO LOT (type_plaque_LOT, date_livraison_LOT, vendeur_LOT, fabricant_LOT, stock_precedent_Stock, stock_actuel_Stock) 
VALUES
(96, TO_DATE('2024-04-01', 'YYYY-MM-DD'), 'Vendeur1', 'Fabricant1', 160, 160);
INSERT INTO LOT (type_plaque_LOT, date_livraison_LOT, vendeur_LOT, fabricant_LOT, stock_precedent_Stock, stock_actuel_Stock) 
VALUES
(384, TO_DATE('2024-04-01', 'YYYY-MM-DD'), 'Vendeur2', 'Fabricant2', 160, 160);
INSERT INTO LOT (type_plaque_LOT, date_livraison_LOT, vendeur_LOT, fabricant_LOT, stock_precedent_Stock, stock_actuel_Stock) 
VALUES
(96, TO_DATE('2024-05-01', 'YYYY-MM-DD'), 'Vendeur1', 'Fabricant1', 160, 160);
INSERT INTO LOT (type_plaque_LOT, date_livraison_LOT, vendeur_LOT, fabricant_LOT, stock_precedent_Stock, stock_actuel_Stock) 
VALUES
(384, TO_DATE('2024-05-01', 'YYYY-MM-DD'), 'Vendeur2', 'Fabricant2', 160, 160);

-- Peuplement de la table PLAQUE
INSERT INTO PLAQUE (code_barre_lot_LOT)
VALUES ((SELECT code_barre_lot_LOT FROM LOT WHERE code_barre_lot_LOT = 42));
INSERT INTO PLAQUE (code_barre_lot_LOT)
VALUES ((SELECT code_barre_lot_LOT FROM LOT WHERE code_barre_lot_LOT = 43));
INSERT INTO PLAQUE (code_barre_lot_LOT)
VALUES ((SELECT code_barre_lot_LOT FROM LOT WHERE code_barre_lot_LOT = 44));
INSERT INTO PLAQUE (code_barre_lot_LOT)
VALUES ((SELECT code_barre_lot_LOT FROM LOT WHERE code_barre_lot_LOT = 45));
INSERT INTO PLAQUE (code_barre_lot_LOT)
VALUES ((SELECT code_barre_lot_LOT FROM LOT WHERE code_barre_lot_LOT = 46));
INSERT INTO PLAQUE (code_barre_lot_LOT)
VALUES ((SELECT code_barre_lot_LOT FROM LOT WHERE code_barre_lot_LOT = 47));
INSERT INTO PLAQUE (code_barre_lot_LOT)
VALUES ((SELECT code_barre_lot_LOT FROM LOT WHERE code_barre_lot_LOT = 48));
INSERT INTO PLAQUE (code_barre_lot_LOT)
VALUES ((SELECT code_barre_lot_LOT FROM LOT WHERE code_barre_lot_LOT = 49));
INSERT INTO PLAQUE (code_barre_lot_LOT)
VALUES ((SELECT code_barre_lot_LOT FROM LOT WHERE code_barre_lot_LOT = 50));
INSERT INTO PLAQUE (code_barre_lot_LOT)
VALUES ((SELECT code_barre_lot_LOT FROM LOT WHERE code_barre_lot_LOT = 51));


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
VALUES ((SELECT id_equipe_EQUIPE FROM EQUIPE WHERE id_equipe_EQUIPE = 33));
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

-- Peuplement de la table ATTENTE
INSERT INTO ATTENTE (position_ATTENTE, id_photometre_PHOTOMETRE) 
VALUES (1, (SELECT id_photometre_PHOTOMETRE FROM PHOTOMETRE WHERE id_photometre_PHOTOMETRE = 32));
INSERT INTO ATTENTE (position_ATTENTE, id_photometre_PHOTOMETRE) 
VALUES (1, (SELECT id_photometre_PHOTOMETRE FROM PHOTOMETRE WHERE id_photometre_PHOTOMETRE = 33));
INSERT INTO ATTENTE (position_ATTENTE, id_photometre_PHOTOMETRE) 
VALUES (1, (SELECT id_photometre_PHOTOMETRE FROM PHOTOMETRE WHERE id_photometre_PHOTOMETRE = 34));
INSERT INTO ATTENTE (position_ATTENTE, id_photometre_PHOTOMETRE) 
VALUES (1, (SELECT id_photometre_PHOTOMETRE FROM PHOTOMETRE WHERE id_photometre_PHOTOMETRE = 35));
INSERT INTO ATTENTE (position_ATTENTE, id_photometre_PHOTOMETRE) 
VALUES (1, (SELECT id_photometre_PHOTOMETRE FROM PHOTOMETRE WHERE id_photometre_PHOTOMETRE = 36));
INSERT INTO ATTENTE (position_ATTENTE, id_photometre_PHOTOMETRE) 
VALUES (1, (SELECT id_photometre_PHOTOMETRE FROM PHOTOMETRE WHERE id_photometre_PHOTOMETRE = 37));
INSERT INTO ATTENTE (position_ATTENTE, id_photometre_PHOTOMETRE) 
VALUES (1, (SELECT id_photometre_PHOTOMETRE FROM PHOTOMETRE WHERE id_photometre_PHOTOMETRE = 38));
INSERT INTO ATTENTE (position_ATTENTE, id_photometre_PHOTOMETRE) 
VALUES (1, (SELECT id_photometre_PHOTOMETRE FROM PHOTOMETRE WHERE id_photometre_PHOTOMETRE = 39));
INSERT INTO ATTENTE (position_ATTENTE, id_photometre_PHOTOMETRE) 
VALUES (1, (SELECT id_photometre_PHOTOMETRE FROM PHOTOMETRE WHERE id_photometre_PHOTOMETRE = 40));
INSERT INTO ATTENTE (position_ATTENTE, id_photometre_PHOTOMETRE) 
VALUES (1, (SELECT id_photometre_PHOTOMETRE FROM PHOTOMETRE WHERE id_photometre_PHOTOMETRE = 41));

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




-- Peuplement de la table GROUPE
INSERT INTO GROUPE (nb_plaques_GROUPE, moyenne_grp_GROUPE, ecart_type_grp_GROUPE, acceptation_GROUPE, x_grp_GROUPE, y_grp_GROUPE, code_barre_plaque_PLAQUE, id_exp_EXPERIENCE) 
VALUES (2, 120.0, 15.0, 1, 3.0, 4.0, (SELECT code_barre_plaque_PLAQUE FROM PLAQUE WHERE rownum = 1), (SELECT id_exp_EXPERIENCE FROM EXPERIENCE WHERE rownum = 1));

-- Peuplement de la table PUITS
INSERT INTO PUITS (x_puits_PUITS, y_puits_PUITS, resultat_puits_PUITS, x_pixel_PIXEL, y_pixel_PIXEL, n_PIXEL, Rm_PIXEL, Rd_PIXEL, Vm_PIXEL, Vd_PIXEL, Bm_PIXEL, Bd_PIXEL, Tm_PIXEL, Td_PIXEL, id_groupe_GROUPE) 
VALUES (1.0, 2.0, 3.0, 10.0, 20.0, 30, 40.0, 50.0, 60.0, 70.0, 250.0, 90.0, 100.0, 110.0, (SELECT id_groupe_GROUPE FROM GROUPE WHERE rownum = 1));


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
