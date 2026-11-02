-- S1: puntuación de la imagen final. S2: exclusivamente columna morada.
-- Guiones morados interpretados como 0. Winx conserva sus datos (ausente de las imágenes).
-- Totales absolutos: no se vuelven a sumar al reiniciar. No modifica PG ni PP.
CREATE TABLE IF NOT EXISTS rck_data_migrations (version VARCHAR(100) PRIMARY KEY, applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
START TRANSACTION;
-- Adhoc Gaming : S1 -20 + S2 0 = -20
UPDATE tclubshistoricos SET Puntuacion=-20 WHERE LOWER(TRIM(Nombre))=LOWER('Adhoc Gaming') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-purple-20261102');
-- Atom Unity : S1 17 + S2 0 = 17
UPDATE tclubshistoricos SET Puntuacion=17 WHERE LOWER(TRIM(Nombre))=LOWER('Atom Unity') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-purple-20261102');
-- Business Tourers : S1 27 + S2 0 = 27
UPDATE tclubshistoricos SET Puntuacion=27 WHERE LOWER(TRIM(Nombre))=LOWER('Business Tourers') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-purple-20261102');
-- Cierzo Esports : S1 0 + S2 42 = 42
UPDATE tclubshistoricos SET Puntuacion=42 WHERE LOWER(TRIM(Nombre))=LOWER('Cierzo Esports') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-purple-20261102');
-- Clover Esports : S1 -25 + S2 26 = 1
UPDATE tclubshistoricos SET Puntuacion=1 WHERE LOWER(TRIM(Nombre))=LOWER('Clover Esports') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-purple-20261102');
-- Crow 6 : S1 0 + S2 26 = 26
UPDATE tclubshistoricos SET Puntuacion=26 WHERE LOWER(TRIM(Nombre))=LOWER('Crow 6') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-purple-20261102');
-- Ibiyoka : S1 0 + S2 26 = 26
UPDATE tclubshistoricos SET Puntuacion=26 WHERE LOWER(TRIM(Nombre))=LOWER('Ibiyoka') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-purple-20261102');
-- Karasu Eaters : S1 78 + S2 0 = 78
UPDATE tclubshistoricos SET Puntuacion=78 WHERE LOWER(TRIM(Nombre))=LOWER('Karasu Eaters') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-purple-20261102');
-- Karasu Eaters B : S1 34 + S2 0 = 34
UPDATE tclubshistoricos SET Puntuacion=34 WHERE LOWER(TRIM(Nombre))=LOWER('Karasu Eaters B') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-purple-20261102');
-- Last Five Stars : S1 37 + S2 0 = 37
UPDATE tclubshistoricos SET Puntuacion=37 WHERE LOWER(TRIM(Nombre))=LOWER('Last Five Stars') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-purple-20261102');
-- Last Five Titans : S1 0 + S2 0 = 0
UPDATE tclubshistoricos SET Puntuacion=0 WHERE LOWER(TRIM(Nombre))=LOWER('Last Five Titans') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-purple-20261102');
-- LSS Cosmos : S1 39 + S2 0 = 39
UPDATE tclubshistoricos SET Puntuacion=39 WHERE LOWER(TRIM(Nombre))=LOWER('LSS Cosmos') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-purple-20261102');
-- LSS Prime : S1 45 + S2 0 = 45
UPDATE tclubshistoricos SET Puntuacion=45 WHERE LOWER(TRIM(Nombre))=LOWER('LSS Prime') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-purple-20261102');
-- Lumynid Esports : S1 -7 + S2 0 = -7
UPDATE tclubshistoricos SET Puntuacion=-7 WHERE LOWER(TRIM(Nombre))=LOWER('Lumynid Esports') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-purple-20261102');
-- Madness Esports : S1 0 + S2 34 = 34
UPDATE tclubshistoricos SET Puntuacion=34 WHERE LOWER(TRIM(Nombre))=LOWER('Madness Esports') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-purple-20261102');
-- Moonlab Deimos : S1 0 + S2 14 = 14
UPDATE tclubshistoricos SET Puntuacion=14 WHERE LOWER(TRIM(Nombre))=LOWER('Moonlab Deimos') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-purple-20261102');
-- Moonlab Galaxy : S1 74 + S2 0 = 74
UPDATE tclubshistoricos SET Puntuacion=74 WHERE LOWER(TRIM(Nombre))=LOWER('Moonlab Galaxy') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-purple-20261102');
-- Moonlab Stellar : S1 8 + S2 0 = 8
UPDATE tclubshistoricos SET Puntuacion=8 WHERE LOWER(TRIM(Nombre))=LOWER('Moonlab Stellar') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-purple-20261102');
-- Orion Nova : S1 8 + S2 0 = 8
UPDATE tclubshistoricos SET Puntuacion=8 WHERE LOWER(TRIM(Nombre))=LOWER('Orion Nova') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-purple-20261102');
-- Prodigy Five : S1 0 + S2 0 = 0
UPDATE tclubshistoricos SET Puntuacion=0 WHERE LOWER(TRIM(Nombre))=LOWER('Prodigy Five') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-purple-20261102');
-- Team Gmask : S1 111 + S2 0 = 111
UPDATE tclubshistoricos SET Puntuacion=111 WHERE LOWER(TRIM(Nombre))=LOWER('Team Gmask') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-purple-20261102');
-- Team NES : S1 8 + S2 0 = 8
UPDATE tclubshistoricos SET Puntuacion=8 WHERE LOWER(TRIM(Nombre))=LOWER('Team NES') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-purple-20261102');
-- Team Orion : S1 71 + S2 0 = 71
UPDATE tclubshistoricos SET Puntuacion=71 WHERE LOWER(TRIM(Nombre))=LOWER('Team Orion') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-purple-20261102');
-- The Thunders : S1 0 + S2 0 = 0
UPDATE tclubshistoricos SET Puntuacion=0 WHERE LOWER(TRIM(Nombre))=LOWER('The Thunders') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-purple-20261102');
-- Thuphant : S1 0 + S2 18 = 18
UPDATE tclubshistoricos SET Puntuacion=18 WHERE LOWER(TRIM(Nombre))=LOWER('Thuphant') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-purple-20261102');
-- Ultra Instinct : S1 0 + S2 14 = 14
UPDATE tclubshistoricos SET Puntuacion=14 WHERE LOWER(TRIM(Nombre))=LOWER('Ultra Instinct') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-purple-20261102');
-- Varions Esports : S1 99 + S2 18 = 117
UPDATE tclubshistoricos SET Puntuacion=117 WHERE LOWER(TRIM(Nombre))=LOWER('Varions Esports') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-purple-20261102');
-- Ventucorp Esports : S1 31 + S2 50 = 81
UPDATE tclubshistoricos SET Puntuacion=81 WHERE LOWER(TRIM(Nombre))=LOWER('Ventucorp Esports') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-purple-20261102');
-- Ventucorp Legends : S1 0 + S2 26 = 26
UPDATE tclubshistoricos SET Puntuacion=26 WHERE LOWER(TRIM(Nombre))=LOWER('Ventucorp Legends') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-purple-20261102');
-- Ventucorp Spyriit : S1 0 + S2 0 = 0
UPDATE tclubshistoricos SET Puntuacion=0 WHERE LOWER(TRIM(Nombre))=LOWER('Ventucorp Spyriit') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-purple-20261102');
-- Yayo Is Back : S1 0 + S2 30 = 30
UPDATE tclubshistoricos SET Puntuacion=30 WHERE LOWER(TRIM(Nombre))=LOWER('Yayo Is Back') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-purple-20261102');
-- Zyron Gaming : S1 63 + S2 0 = 63
UPDATE tclubshistoricos SET Puntuacion=63 WHERE LOWER(TRIM(Nombre))=LOWER('Zyron Gaming') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-purple-20261102');
INSERT IGNORE INTO rck_data_migrations (version) VALUES ('historical-points-s1-s2-purple-20261102');
COMMIT;
