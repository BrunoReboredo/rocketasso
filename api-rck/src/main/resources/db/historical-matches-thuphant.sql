-- Corrige el nombre conservando la fila, el logo y los puntos existentes.
CREATE TABLE IF NOT EXISTS rck_data_migrations (version VARCHAR(100) PRIMARY KEY, applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
START TRANSACTION;
UPDATE tclubshistoricos SET Nombre='Thuphant' WHERE LOWER(TRIM(Nombre))=LOWER('Thouphant');
UPDATE rck_historical_season_points SET club_nombre='Thuphant' WHERE club_nombre='Thouphant';
UPDATE tclubshistoricos SET partidos_ganados=0, partidos_perdidos=4, diferencia_partidos=0-4
WHERE LOWER(TRIM(Nombre))=LOWER('Thuphant')
AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-thuphant-name-matches-0-4-20261102');
INSERT IGNORE INTO rck_data_migrations (version)
SELECT 'historical-thuphant-name-matches-0-4-20261102' WHERE EXISTS
(SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre))=LOWER('Thuphant') AND partidos_ganados=0 AND partidos_perdidos=4);
COMMIT;