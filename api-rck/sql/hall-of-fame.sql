CREATE TABLE IF NOT EXISTS rck_championship_winners (
 temporada INT PRIMARY KEY,
 club_nombre VARCHAR(100) NOT NULL,
 logo VARCHAR(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS rck_champion_players (
 temporada INT NOT NULL,
 nombre VARCHAR(100) NOT NULL,
 orden INT NOT NULL,
 PRIMARY KEY (temporada, nombre),
 FOREIGN KEY (temporada) REFERENCES rck_championship_winners(temporada)
);
INSERT INTO rck_championship_winners (temporada, club_nombre, logo) VALUES
(1, 'Moonlab Galaxy', '/logos/clubs/Moonlab%20Gaming.png'),
(2, 'Yayo Is Back', '/logos/clubs/Yayo%20is%20Back.png')
ON DUPLICATE KEY UPDATE club_nombre=VALUES(club_nombre), logo=VALUES(logo);
INSERT INTO rck_champion_players (temporada, nombre, orden) VALUES
(1, 'Kirox_RL', 1), (1, 'cocoo_rl', 2), (1, 'xept_6', 3), (1, 'extaahh', 4),
(2, 'Denisinho', 1), (2, 'Chancla', 2), (2, 'Zarinho', 3), (2, 'Leoro', 4), (2, 'Jonix', 5)
ON DUPLICATE KEY UPDATE orden=VALUES(orden);