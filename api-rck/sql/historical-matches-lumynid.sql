-- Totales históricos de Lumynid Esports. Conserva puntos y logo.
CREATE TABLE IF NOT EXISTS rck_data_migrations (version VARCHAR(100) PRIMARY KEY, applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
START TRANSACTION;
UPDATE tclubshistoricos SET partidos_ganados=4, partidos_perdidos=8, diferencia_partidos=4-8
WHERE LOWER(TRIM(Nombre)) IN (LOWER('Lumyind Esports'),LOWER('Lumynid Esports'))
AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-matches-lumynid-4-8-20261102');
INSERT IGNORE INTO rck_data_migrations (version)
SELECT 'historical-matches-lumynid-4-8-20261102' WHERE EXISTS
(SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) IN (LOWER('Lumyind Esports'),LOWER('Lumynid Esports')) AND partidos_ganados=4 AND partidos_perdidos=8);
COMMIT;