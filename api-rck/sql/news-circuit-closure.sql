-- Sustitución única de las noticias de prueba. Se conserva una copia en SQL.
CREATE TABLE IF NOT EXISTS rck_data_migrations (version VARCHAR(100) PRIMARY KEY, applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE IF NOT EXISTS rck_news_test_backup_20261102 LIKE tnoticias;
START TRANSACTION;
INSERT IGNORE INTO rck_news_test_backup_20261102 SELECT * FROM tnoticias WHERE NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='news-circuit-closure-20261102');
DELETE FROM tnoticias WHERE NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='news-circuit-closure-20261102');
INSERT INTO tnoticias (Titulo, Foto, Contenido, fecha_publicacion, Enlace)
SELECT 'El circuito competitivo de la RCK cierra', NULL,
'El circuito competitivo de la RCK cierra. Puedes consultar el comunicado de RocketAsso en su publicación oficial en X.', CURRENT_TIMESTAMP,
'https://x.com/Rocketasso_/status/2084580108015427617'
WHERE NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='news-circuit-closure-20261102');
INSERT IGNORE INTO rck_data_migrations (version) VALUES ('news-circuit-closure-20261102');
COMMIT;
UPDATE tnoticias SET fecha_publicacion=CURRENT_TIMESTAMP WHERE fecha_publicacion IS NULL AND Enlace='https://x.com/Rocketasso_/status/2084580108015427617';
