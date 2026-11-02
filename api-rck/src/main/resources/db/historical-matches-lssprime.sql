-- Totales históricos de Last Five Stars Prime (LSS Prime). No modifica puntos.
CREATE TABLE IF NOT EXISTS rck_data_migrations (version VARCHAR(100) PRIMARY KEY, applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
START TRANSACTION;
UPDATE tclubshistoricos SET partidos_ganados=5, partidos_perdidos=6, diferencia_partidos=5-6
WHERE LOWER(TRIM(Nombre))=LOWER('LSS Prime')
AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-matches-lssprime-5-6-20261102');
INSERT IGNORE INTO rck_data_migrations (version)
SELECT 'historical-matches-lssprime-5-6-20261102' WHERE EXISTS
(SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre))=LOWER('LSS Prime') AND partidos_ganados=5 AND partidos_perdidos=6);
COMMIT;