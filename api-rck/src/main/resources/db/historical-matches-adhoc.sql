-- Totales históricos facilitados por la organización. No modifica puntos.
CREATE TABLE IF NOT EXISTS rck_data_migrations (version VARCHAR(100) PRIMARY KEY, applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
START TRANSACTION;
UPDATE tclubshistoricos SET partidos_ganados=0, partidos_perdidos=12, diferencia_partidos=0-12
WHERE LOWER(TRIM(Nombre))=LOWER('Adhoc Gaming')
AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-matches-adhoc-0-12-20261102');
INSERT IGNORE INTO rck_data_migrations (version)
SELECT 'historical-matches-adhoc-0-12-20261102' WHERE EXISTS
(SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre))=LOWER('Adhoc Gaming') AND partidos_ganados=0 AND partidos_perdidos=12);
COMMIT;