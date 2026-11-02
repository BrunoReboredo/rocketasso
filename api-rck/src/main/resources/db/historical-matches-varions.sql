-- Totales históricos facilitados por la organización. No modifica puntos.
CREATE TABLE IF NOT EXISTS rck_data_migrations (version VARCHAR(100) PRIMARY KEY, applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
START TRANSACTION;
UPDATE tclubshistoricos SET partidos_ganados=31, partidos_perdidos=17, diferencia_partidos=31-17
WHERE LOWER(TRIM(Nombre))=LOWER('Varions Esports')
AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-matches-varions-31-17-spring-20261102');
INSERT IGNORE INTO rck_data_migrations (version)
SELECT 'historical-matches-varions-31-17-spring-20261102' WHERE EXISTS
(SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre))=LOWER('Varions Esports') AND partidos_ganados=31 AND partidos_perdidos=17);
COMMIT;