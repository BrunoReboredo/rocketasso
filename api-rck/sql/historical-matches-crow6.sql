-- Totales históricos facilitados por la organización. No modifica puntos.
CREATE TABLE IF NOT EXISTS rck_data_migrations (version VARCHAR(100) PRIMARY KEY, applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
START TRANSACTION;
UPDATE tclubshistoricos SET partidos_ganados=4, partidos_perdidos=9, diferencia_partidos=4-9
WHERE LOWER(TRIM(Nombre))=LOWER('Crow 6')
AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-matches-crow6-4-9-20261102');
INSERT IGNORE INTO rck_data_migrations (version)
SELECT 'historical-matches-crow6-4-9-20261102' WHERE EXISTS
(SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre))=LOWER('Crow 6') AND partidos_ganados=4 AND partidos_perdidos=9);
COMMIT;