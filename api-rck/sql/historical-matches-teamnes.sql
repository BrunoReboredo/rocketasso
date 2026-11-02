-- Totales históricos facilitados por la organización. No modifica puntos.
CREATE TABLE IF NOT EXISTS rck_data_migrations (version VARCHAR(100) PRIMARY KEY, applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
START TRANSACTION;
UPDATE tclubshistoricos SET partidos_ganados=2, partidos_perdidos=8, diferencia_partidos=2-8
WHERE LOWER(TRIM(Nombre))=LOWER('Team NES')
AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-matches-teamnes-2-8-20261102');
INSERT IGNORE INTO rck_data_migrations (version)
SELECT 'historical-matches-teamnes-2-8-20261102' WHERE EXISTS
(SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre))=LOWER('Team NES') AND partidos_ganados=2 AND partidos_perdidos=8);
COMMIT;