-- Winx fue el nombre anterior de Team Orion. El total oficial S1 de Orion ya es 71.
CREATE TABLE IF NOT EXISTS rck_data_migrations (version VARCHAR(100) PRIMARY KEY, applied_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE IF NOT EXISTS rck_winx_alias_backup LIKE tclubshistoricos;
START TRANSACTION;
INSERT IGNORE INTO rck_winx_alias_backup SELECT * FROM tclubshistoricos
WHERE LOWER(TRIM(Nombre)) IN ('winx', 'team winx')
AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-winx-is-orion-20261102');
DELETE FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) IN ('winx', 'team winx')
AND EXISTS (SELECT 1 FROM (SELECT Nombre FROM tclubshistoricos) clubs WHERE LOWER(TRIM(clubs.Nombre))='team orion')
AND NOT EXISTS (SELECT 1 FROM rck_data_migrations WHERE version='historical-winx-is-orion-20261102');
INSERT IGNORE INTO rck_data_migrations (version)
SELECT 'historical-winx-is-orion-20261102' WHERE EXISTS (SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre))='team orion')
AND NOT EXISTS (SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) IN ('winx', 'team winx'));
COMMIT;