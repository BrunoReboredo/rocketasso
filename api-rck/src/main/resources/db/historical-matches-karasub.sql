-- Totales históricos facilitados por la organización. No modifica puntos.
CREATE TABLE IF NOT EXISTS rck_data_migrations (version VARCHAR(100) PRIMARY KEY, applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
START TRANSACTION;
UPDATE tclubshistoricos SET partidos_ganados=6, partidos_perdidos=7, diferencia_partidos=6-7
WHERE LOWER(TRIM(Nombre))=LOWER('Karasu Eaters B')
AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-matches-karasub-6-7-20261102');
INSERT IGNORE INTO rck_data_migrations (version)
SELECT 'historical-matches-karasub-6-7-20261102' WHERE EXISTS
(SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre))=LOWER('Karasu Eaters B') AND partidos_ganados=6 AND partidos_perdidos=7);
COMMIT;