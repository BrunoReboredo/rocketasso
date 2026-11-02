-- Totales históricos facilitados por la organización. No modifica puntos.
CREATE TABLE IF NOT EXISTS rck_data_migrations (version VARCHAR(100) PRIMARY KEY, applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
START TRANSACTION;
UPDATE tclubshistoricos SET partidos_ganados=10, partidos_perdidos=17, diferencia_partidos=10-17
WHERE LOWER(TRIM(Nombre))=LOWER('Clover Esports')
AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-matches-clover-10-17-20261102');
INSERT IGNORE INTO rck_data_migrations (version)
SELECT 'historical-matches-clover-10-17-20261102' WHERE EXISTS
(SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre))=LOWER('Clover Esports') AND partidos_ganados=10 AND partidos_perdidos=17);
COMMIT;