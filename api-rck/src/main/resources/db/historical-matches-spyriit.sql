-- Totales históricos facilitados por la organización. No modifica puntos.
CREATE TABLE IF NOT EXISTS rck_data_migrations (version VARCHAR(100) PRIMARY KEY, applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
START TRANSACTION;
UPDATE tclubshistoricos SET partidos_ganados=1, partidos_perdidos=3, diferencia_partidos=1-3
WHERE LOWER(TRIM(Nombre))=LOWER('Ventucorp Spyriit')
AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-matches-spyriit-1-3-20261102');
INSERT IGNORE INTO rck_data_migrations (version)
SELECT 'historical-matches-spyriit-1-3-20261102' WHERE EXISTS
(SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre))=LOWER('Ventucorp Spyriit') AND partidos_ganados=1 AND partidos_perdidos=3);
COMMIT;