-- Totales históricos facilitados por la organización. No modifica puntos.
CREATE TABLE IF NOT EXISTS rck_data_migrations (version VARCHAR(100) PRIMARY KEY, applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
START TRANSACTION;
UPDATE tclubshistoricos SET partidos_ganados=0, partidos_perdidos=4, diferencia_partidos=0-4
WHERE LOWER(TRIM(Nombre))=LOWER('Last Five Titans')
AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-matches-titans-0-4-20261102');
INSERT IGNORE INTO rck_data_migrations (version)
SELECT 'historical-matches-titans-0-4-20261102' WHERE EXISTS
(SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre))=LOWER('Last Five Titans') AND partidos_ganados=0 AND partidos_perdidos=4);
COMMIT;