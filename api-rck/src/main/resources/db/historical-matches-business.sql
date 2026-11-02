-- Totales históricos facilitados por la organización. No modifica puntos.
CREATE TABLE IF NOT EXISTS rck_data_migrations (version VARCHAR(100) PRIMARY KEY, applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
START TRANSACTION;
UPDATE tclubshistoricos SET partidos_ganados=4, partidos_perdidos=1, diferencia_partidos=4-1
WHERE LOWER(TRIM(Nombre))=LOWER('Business Tourers')
AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-matches-business-4-1-20261102');
INSERT IGNORE INTO rck_data_migrations (version)
SELECT 'historical-matches-business-4-1-20261102' WHERE EXISTS
(SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre))=LOWER('Business Tourers') AND partidos_ganados=4 AND partidos_perdidos=1);
COMMIT;