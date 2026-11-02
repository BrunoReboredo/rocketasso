-- Totales históricos facilitados por la organización. No modifica puntos.
CREATE TABLE IF NOT EXISTS rck_data_migrations (version VARCHAR(100) PRIMARY KEY, applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
START TRANSACTION;
UPDATE tclubshistoricos SET partidos_ganados=16, partidos_perdidos=2, diferencia_partidos=16-2
WHERE LOWER(TRIM(Nombre))=LOWER('Team Gmask')
AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-matches-gmask-16-2-20261102');
INSERT IGNORE INTO rck_data_migrations (version)
SELECT 'historical-matches-gmask-16-2-20261102' WHERE EXISTS
(SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre))=LOWER('Team Gmask') AND partidos_ganados=16 AND partidos_perdidos=2);
COMMIT;