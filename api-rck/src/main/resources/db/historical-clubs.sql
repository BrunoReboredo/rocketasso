-- Clubes únicos de las temporadas 1 y 2. Importación manual para MariaDB.
-- No sobrescribe nombres ni estadísticas existentes. Los ceros son valores iniciales, no resultados confirmados.
START TRANSACTION;
INSERT INTO tclubshistoricos (ClubId, Nombre, Logo, Puntuacion, PartidosGanados, PartidosPerdidos, DiferenciaPartidos)
SELECT (SELECT COALESCE(MAX(c.ClubId), 0) + 1 FROM tclubshistoricos c), 'Adhoc Gaming', '', 0, 0, 0, 0
WHERE NOT EXISTS (SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) = LOWER('Adhoc Gaming'));
INSERT INTO tclubshistoricos (ClubId, Nombre, Logo, Puntuacion, PartidosGanados, PartidosPerdidos, DiferenciaPartidos)
SELECT (SELECT COALESCE(MAX(c.ClubId), 0) + 1 FROM tclubshistoricos c), 'Atom Unity', '', 0, 0, 0, 0
WHERE NOT EXISTS (SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) = LOWER('Atom Unity'));
INSERT INTO tclubshistoricos (ClubId, Nombre, Logo, Puntuacion, PartidosGanados, PartidosPerdidos, DiferenciaPartidos)
SELECT (SELECT COALESCE(MAX(c.ClubId), 0) + 1 FROM tclubshistoricos c), 'Cierzo Esports', '', 0, 0, 0, 0
WHERE NOT EXISTS (SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) = LOWER('Cierzo Esports'));
INSERT INTO tclubshistoricos (ClubId, Nombre, Logo, Puntuacion, PartidosGanados, PartidosPerdidos, DiferenciaPartidos)
SELECT (SELECT COALESCE(MAX(c.ClubId), 0) + 1 FROM tclubshistoricos c), 'Clover Esports', '', 0, 0, 0, 0
WHERE NOT EXISTS (SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) = LOWER('Clover Esports'));
INSERT INTO tclubshistoricos (ClubId, Nombre, Logo, Puntuacion, PartidosGanados, PartidosPerdidos, DiferenciaPartidos)
SELECT (SELECT COALESCE(MAX(c.ClubId), 0) + 1 FROM tclubshistoricos c), 'Crow 6', '', 0, 0, 0, 0
WHERE NOT EXISTS (SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) = LOWER('Crow 6'));
INSERT INTO tclubshistoricos (ClubId, Nombre, Logo, Puntuacion, PartidosGanados, PartidosPerdidos, DiferenciaPartidos)
SELECT (SELECT COALESCE(MAX(c.ClubId), 0) + 1 FROM tclubshistoricos c), 'Ibiyoka', '', 0, 0, 0, 0
WHERE NOT EXISTS (SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) = LOWER('Ibiyoka'));
INSERT INTO tclubshistoricos (ClubId, Nombre, Logo, Puntuacion, PartidosGanados, PartidosPerdidos, DiferenciaPartidos)
SELECT (SELECT COALESCE(MAX(c.ClubId), 0) + 1 FROM tclubshistoricos c), 'Karasu Eaters', '', 0, 0, 0, 0
WHERE NOT EXISTS (SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) = LOWER('Karasu Eaters'));
INSERT INTO tclubshistoricos (ClubId, Nombre, Logo, Puntuacion, PartidosGanados, PartidosPerdidos, DiferenciaPartidos)
SELECT (SELECT COALESCE(MAX(c.ClubId), 0) + 1 FROM tclubshistoricos c), 'Karasu Eaters B', '', 0, 0, 0, 0
WHERE NOT EXISTS (SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) = LOWER('Karasu Eaters B'));
INSERT INTO tclubshistoricos (ClubId, Nombre, Logo, Puntuacion, PartidosGanados, PartidosPerdidos, DiferenciaPartidos)
SELECT (SELECT COALESCE(MAX(c.ClubId), 0) + 1 FROM tclubshistoricos c), 'Last Five Stars', '', 0, 0, 0, 0
WHERE NOT EXISTS (SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) = LOWER('Last Five Stars'));
INSERT INTO tclubshistoricos (ClubId, Nombre, Logo, Puntuacion, PartidosGanados, PartidosPerdidos, DiferenciaPartidos)
SELECT (SELECT COALESCE(MAX(c.ClubId), 0) + 1 FROM tclubshistoricos c), 'Last Five Titans', '', 0, 0, 0, 0
WHERE NOT EXISTS (SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) = LOWER('Last Five Titans'));
INSERT INTO tclubshistoricos (ClubId, Nombre, Logo, Puntuacion, PartidosGanados, PartidosPerdidos, DiferenciaPartidos)
SELECT (SELECT COALESCE(MAX(c.ClubId), 0) + 1 FROM tclubshistoricos c), 'LSS Cosmos', '', 0, 0, 0, 0
WHERE NOT EXISTS (SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) = LOWER('LSS Cosmos'));
INSERT INTO tclubshistoricos (ClubId, Nombre, Logo, Puntuacion, PartidosGanados, PartidosPerdidos, DiferenciaPartidos)
SELECT (SELECT COALESCE(MAX(c.ClubId), 0) + 1 FROM tclubshistoricos c), 'LSS Prime', '', 0, 0, 0, 0
WHERE NOT EXISTS (SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) = LOWER('LSS Prime'));
INSERT INTO tclubshistoricos (ClubId, Nombre, Logo, Puntuacion, PartidosGanados, PartidosPerdidos, DiferenciaPartidos)
SELECT (SELECT COALESCE(MAX(c.ClubId), 0) + 1 FROM tclubshistoricos c), 'Lumyind Esports', '', 0, 0, 0, 0
WHERE NOT EXISTS (SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) = LOWER('Lumyind Esports'));
INSERT INTO tclubshistoricos (ClubId, Nombre, Logo, Puntuacion, PartidosGanados, PartidosPerdidos, DiferenciaPartidos)
SELECT (SELECT COALESCE(MAX(c.ClubId), 0) + 1 FROM tclubshistoricos c), 'Madness Esports', '', 0, 0, 0, 0
WHERE NOT EXISTS (SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) = LOWER('Madness Esports'));
INSERT INTO tclubshistoricos (ClubId, Nombre, Logo, Puntuacion, PartidosGanados, PartidosPerdidos, DiferenciaPartidos)
SELECT (SELECT COALESCE(MAX(c.ClubId), 0) + 1 FROM tclubshistoricos c), 'Moonlab Deimos', '', 0, 0, 0, 0
WHERE NOT EXISTS (SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) = LOWER('Moonlab Deimos'));
INSERT INTO tclubshistoricos (ClubId, Nombre, Logo, Puntuacion, PartidosGanados, PartidosPerdidos, DiferenciaPartidos)
SELECT (SELECT COALESCE(MAX(c.ClubId), 0) + 1 FROM tclubshistoricos c), 'Moonlab Galaxy', '', 0, 0, 0, 0
WHERE NOT EXISTS (SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) = LOWER('Moonlab Galaxy'));
INSERT INTO tclubshistoricos (ClubId, Nombre, Logo, Puntuacion, PartidosGanados, PartidosPerdidos, DiferenciaPartidos)
SELECT (SELECT COALESCE(MAX(c.ClubId), 0) + 1 FROM tclubshistoricos c), 'Moonlab Stellar', '', 0, 0, 0, 0
WHERE NOT EXISTS (SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) = LOWER('Moonlab Stellar'));
INSERT INTO tclubshistoricos (ClubId, Nombre, Logo, Puntuacion, PartidosGanados, PartidosPerdidos, DiferenciaPartidos)
SELECT (SELECT COALESCE(MAX(c.ClubId), 0) + 1 FROM tclubshistoricos c), 'Orion Nova', '', 0, 0, 0, 0
WHERE NOT EXISTS (SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) = LOWER('Orion Nova'));
INSERT INTO tclubshistoricos (ClubId, Nombre, Logo, Puntuacion, PartidosGanados, PartidosPerdidos, DiferenciaPartidos)
SELECT (SELECT COALESCE(MAX(c.ClubId), 0) + 1 FROM tclubshistoricos c), 'Prodigy Five', '', 0, 0, 0, 0
WHERE NOT EXISTS (SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) = LOWER('Prodigy Five'));
INSERT INTO tclubshistoricos (ClubId, Nombre, Logo, Puntuacion, PartidosGanados, PartidosPerdidos, DiferenciaPartidos)
SELECT (SELECT COALESCE(MAX(c.ClubId), 0) + 1 FROM tclubshistoricos c), 'Team Gmask', '', 0, 0, 0, 0
WHERE NOT EXISTS (SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) = LOWER('Team Gmask'));
INSERT INTO tclubshistoricos (ClubId, Nombre, Logo, Puntuacion, PartidosGanados, PartidosPerdidos, DiferenciaPartidos)
SELECT (SELECT COALESCE(MAX(c.ClubId), 0) + 1 FROM tclubshistoricos c), 'Team NES', '', 0, 0, 0, 0
WHERE NOT EXISTS (SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) = LOWER('Team NES'));
INSERT INTO tclubshistoricos (ClubId, Nombre, Logo, Puntuacion, PartidosGanados, PartidosPerdidos, DiferenciaPartidos)
SELECT (SELECT COALESCE(MAX(c.ClubId), 0) + 1 FROM tclubshistoricos c), 'Team Orion', '', 0, 0, 0, 0
WHERE NOT EXISTS (SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) = LOWER('Team Orion'));
INSERT INTO tclubshistoricos (ClubId, Nombre, Logo, Puntuacion, PartidosGanados, PartidosPerdidos, DiferenciaPartidos)
SELECT (SELECT COALESCE(MAX(c.ClubId), 0) + 1 FROM tclubshistoricos c), 'The Thunders', '', 0, 0, 0, 0
WHERE NOT EXISTS (SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) = LOWER('The Thunders'));
INSERT INTO tclubshistoricos (ClubId, Nombre, Logo, Puntuacion, PartidosGanados, PartidosPerdidos, DiferenciaPartidos)
SELECT (SELECT COALESCE(MAX(c.ClubId), 0) + 1 FROM tclubshistoricos c), 'Thuphant', '', 0, 0, 0, 0
WHERE NOT EXISTS (SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) = LOWER('Thuphant'));
INSERT INTO tclubshistoricos (ClubId, Nombre, Logo, Puntuacion, PartidosGanados, PartidosPerdidos, DiferenciaPartidos)
SELECT (SELECT COALESCE(MAX(c.ClubId), 0) + 1 FROM tclubshistoricos c), 'Ultra Instinct', '', 0, 0, 0, 0
WHERE NOT EXISTS (SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) = LOWER('Ultra Instinct'));
INSERT INTO tclubshistoricos (ClubId, Nombre, Logo, Puntuacion, PartidosGanados, PartidosPerdidos, DiferenciaPartidos)
SELECT (SELECT COALESCE(MAX(c.ClubId), 0) + 1 FROM tclubshistoricos c), 'Varions Esports', '', 0, 0, 0, 0
WHERE NOT EXISTS (SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) = LOWER('Varions Esports'));
INSERT INTO tclubshistoricos (ClubId, Nombre, Logo, Puntuacion, PartidosGanados, PartidosPerdidos, DiferenciaPartidos)
SELECT (SELECT COALESCE(MAX(c.ClubId), 0) + 1 FROM tclubshistoricos c), 'Ventucorp Esports', '', 0, 0, 0, 0
WHERE NOT EXISTS (SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) = LOWER('Ventucorp Esports'));
INSERT INTO tclubshistoricos (ClubId, Nombre, Logo, Puntuacion, PartidosGanados, PartidosPerdidos, DiferenciaPartidos)
SELECT (SELECT COALESCE(MAX(c.ClubId), 0) + 1 FROM tclubshistoricos c), 'Ventucorp Legends', '', 0, 0, 0, 0
WHERE NOT EXISTS (SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) = LOWER('Ventucorp Legends'));
INSERT INTO tclubshistoricos (ClubId, Nombre, Logo, Puntuacion, PartidosGanados, PartidosPerdidos, DiferenciaPartidos)
SELECT (SELECT COALESCE(MAX(c.ClubId), 0) + 1 FROM tclubshistoricos c), 'Ventucorp Spyriit', '', 0, 0, 0, 0
WHERE NOT EXISTS (SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) = LOWER('Ventucorp Spyriit'));
INSERT INTO tclubshistoricos (ClubId, Nombre, Logo, Puntuacion, PartidosGanados, PartidosPerdidos, DiferenciaPartidos)
SELECT (SELECT COALESCE(MAX(c.ClubId), 0) + 1 FROM tclubshistoricos c), 'Yayo Is Back', '', 0, 0, 0, 0
WHERE NOT EXISTS (SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) = LOWER('Yayo Is Back'));
INSERT INTO tclubshistoricos (ClubId, Nombre, Logo, Puntuacion, PartidosGanados, PartidosPerdidos, DiferenciaPartidos)
SELECT (SELECT COALESCE(MAX(c.ClubId), 0) + 1 FROM tclubshistoricos c), 'Zyron Gaming', '', 0, 0, 0, 0
WHERE NOT EXISTS (SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) = LOWER('Zyron Gaming'));
INSERT INTO tclubshistoricos (ClubId, Nombre, Logo, Puntuacion, PartidosGanados, PartidosPerdidos, DiferenciaPartidos)
SELECT (SELECT COALESCE(MAX(c.ClubId), 0) + 1 FROM tclubshistoricos c), 'Business Tourers', '', 0, 0, 0, 0
WHERE NOT EXISTS (SELECT 1 FROM tclubshistoricos WHERE LOWER(TRIM(Nombre)) = LOWER('Business Tourers'));
COMMIT;
