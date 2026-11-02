-- Puntos totales transcritos de las clasificaciones finales S1 y S2.
-- Los equipos ausentes de ambas imágenes (Winx) conservan sus datos.
-- Se aplica una sola vez; no modifica PG ni PP ni vuelve a sumar al reiniciar.
CREATE TABLE IF NOT EXISTS rck_data_migrations (version VARCHAR(100) PRIMARY KEY, applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
START TRANSACTION;
UPDATE tclubshistoricos SET Puntuacion=-20 WHERE LOWER(TRIM(Nombre))=LOWER('Adhoc Gaming') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-20261102');
UPDATE tclubshistoricos SET Puntuacion=17 WHERE LOWER(TRIM(Nombre))=LOWER('Atom Unity') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-20261102');
UPDATE tclubshistoricos SET Puntuacion=27 WHERE LOWER(TRIM(Nombre))=LOWER('Business Tourers') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-20261102');
UPDATE tclubshistoricos SET Puntuacion=95 WHERE LOWER(TRIM(Nombre))=LOWER('Cierzo Esports') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-20261102');
UPDATE tclubshistoricos SET Puntuacion=24 WHERE LOWER(TRIM(Nombre))=LOWER('Clover Esports') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-20261102');
UPDATE tclubshistoricos SET Puntuacion=47 WHERE LOWER(TRIM(Nombre))=LOWER('Crow 6') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-20261102');
UPDATE tclubshistoricos SET Puntuacion=55 WHERE LOWER(TRIM(Nombre))=LOWER('Ibiyoka') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-20261102');
UPDATE tclubshistoricos SET Puntuacion=78 WHERE LOWER(TRIM(Nombre))=LOWER('Karasu Eaters') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-20261102');
UPDATE tclubshistoricos SET Puntuacion=34 WHERE LOWER(TRIM(Nombre))=LOWER('Karasu Eaters B') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-20261102');
UPDATE tclubshistoricos SET Puntuacion=37 WHERE LOWER(TRIM(Nombre))=LOWER('Last Five Stars') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-20261102');
UPDATE tclubshistoricos SET Puntuacion=8 WHERE LOWER(TRIM(Nombre))=LOWER('Last Five Titans') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-20261102');
UPDATE tclubshistoricos SET Puntuacion=39 WHERE LOWER(TRIM(Nombre))=LOWER('LSS Cosmos') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-20261102');
UPDATE tclubshistoricos SET Puntuacion=45 WHERE LOWER(TRIM(Nombre))=LOWER('LSS Prime') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-20261102');
UPDATE tclubshistoricos SET Puntuacion=-7 WHERE LOWER(TRIM(Nombre))=LOWER('Lumynid Esports') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-20261102');
UPDATE tclubshistoricos SET Puntuacion=71 WHERE LOWER(TRIM(Nombre))=LOWER('Madness Esports') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-20261102');
UPDATE tclubshistoricos SET Puntuacion=59 WHERE LOWER(TRIM(Nombre))=LOWER('Moonlab Deimos') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-20261102');
UPDATE tclubshistoricos SET Puntuacion=74 WHERE LOWER(TRIM(Nombre))=LOWER('Moonlab Galaxy') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-20261102');
UPDATE tclubshistoricos SET Puntuacion=16 WHERE LOWER(TRIM(Nombre))=LOWER('Moonlab Stellar') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-20261102');
UPDATE tclubshistoricos SET Puntuacion=8 WHERE LOWER(TRIM(Nombre))=LOWER('Orion Nova') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-20261102');
UPDATE tclubshistoricos SET Puntuacion=37 WHERE LOWER(TRIM(Nombre))=LOWER('Prodigy Five') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-20261102');
UPDATE tclubshistoricos SET Puntuacion=111 WHERE LOWER(TRIM(Nombre))=LOWER('Team Gmask') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-20261102');
UPDATE tclubshistoricos SET Puntuacion=8 WHERE LOWER(TRIM(Nombre))=LOWER('Team NES') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-20261102');
UPDATE tclubshistoricos SET Puntuacion=71 WHERE LOWER(TRIM(Nombre))=LOWER('Team Orion') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-20261102');
UPDATE tclubshistoricos SET Puntuacion=16 WHERE LOWER(TRIM(Nombre))=LOWER('The Thunders') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-20261102');
UPDATE tclubshistoricos SET Puntuacion=18 WHERE LOWER(TRIM(Nombre))=LOWER('Thuphant') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-20261102');
UPDATE tclubshistoricos SET Puntuacion=43 WHERE LOWER(TRIM(Nombre))=LOWER('Ultra Instinct') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-20261102');
UPDATE tclubshistoricos SET Puntuacion=154 WHERE LOWER(TRIM(Nombre))=LOWER('Varions Esports') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-20261102');
UPDATE tclubshistoricos SET Puntuacion=126 WHERE LOWER(TRIM(Nombre))=LOWER('Ventucorp Esports') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-20261102');
UPDATE tclubshistoricos SET Puntuacion=71 WHERE LOWER(TRIM(Nombre))=LOWER('Ventucorp Legends') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-20261102');
UPDATE tclubshistoricos SET Puntuacion=0 WHERE LOWER(TRIM(Nombre))=LOWER('Ventucorp Spyriit') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-20261102');
UPDATE tclubshistoricos SET Puntuacion=67 WHERE LOWER(TRIM(Nombre))=LOWER('Yayo Is Back') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-20261102');
UPDATE tclubshistoricos SET Puntuacion=63 WHERE LOWER(TRIM(Nombre))=LOWER('Zyron Gaming') AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-points-s1-s2-20261102');
INSERT IGNORE INTO rck_data_migrations (version) VALUES ('historical-points-s1-s2-20261102');
COMMIT;
