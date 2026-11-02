-- Totales históricos facilitados por la organización. No modifica puntos.
CREATE TABLE IF NOT EXISTS rck_data_migrations (version VARCHAR(100) PRIMARY KEY, applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
START TRANSACTION;
UPDATE tclubshistoricos SET partidos_ganados=9, partidos_perdidos=7, diferencia_partidos=9-7
WHERE LOWER(TRIM(Nombre))=LOWER('Madness Esports')
AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-matches-madness-9-7-20261102');
INSERT IGNORE INTO rck_data_migrations (version)
SELECT 'historical-matches-madness-9-7-20261102' WHERE EXISTS
(SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre))=LOWER('Madness Esports') AND partidos_ganados=9 AND partidos_perdidos=7);
COMMIT;