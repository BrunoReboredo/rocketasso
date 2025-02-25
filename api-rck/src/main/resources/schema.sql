CREATE TABLE TInfoClubsS2 (
                              Id INT PRIMARY KEY AUTO_INCREMENT,
                              Nombre VARCHAR(50) NOT null,
                              Abreviatura CHAR(4) NOT NULL,
                              Puntuacion Int(3) not NULL,
                              CorreoElectronico VARCHAR(50) NOT NULL,
                              Manager VARCHAR(50) NOT NULL,
                              X VARCHAR(30),
                              TikTok VARCHAR(30),
                              UNIQUE(Id, Nombre)
);

-- drop table TinfoClubsS2;

CREATE TABLE TClasificacionS2 (
                                  Id INT PRIMARY KEY AUTO_INCREMENT,
                                  ClubId INT,
                                  NombreClub VARCHAR(50),
                                  Posicion INT NOT NULL,
                                  PartidosGanados INT(5) NOT NULL,
                                  PartidosPerdidos INT(5) NOT NULL,
                                  DiferenciaPartidos INT(5) as (PartidosGanados - PartidosPerdidos),
                                  Puntos INT NOT NULL,
                                  FOREIGN KEY (ClubId) REFERENCES TInfoClubsS2 (Id) ON DELETE CASCADE
);

CREATE TABLE TClubsHistoricos (
                                  Id INT PRIMARY KEY AUTO_INCREMENT,
                                  ClubId INT UNIQUE,
                                  Nombre VARCHAR(50) NOT NULL,
                                  Abreviatura CHAR(4) NOT NULL,
                                  Puntuacion INT(10) NOT NULL,
                                  PartidosGanados INT(5) NOT NULL,
                                  PartidosPerdidos INT(5) NOT NULL,
                                  DiferenciaPartidos INT(5) as (PartidosGanados-PartidosPerdidos),
                                  FOREIGN KEY (ClubId) REFERENCES TInfoClubsS2(Id) ON DELETE CASCADE
);

CREATE TABLE THallOfFame (
                             Id INT PRIMARY KEY AUTO_INCREMENT,
                             Nombre VARCHAR(50) NOT NULL,
                             Abreviatura CHAR(4) NOT NULL,
                             Competicion varchar (50) not null,
                             Puesto int (1) not null
);

create table TNoticias(
                          Id INT PRIMARY KEY AUTO_INCREMENT,
                          Titulo VARCHAR(100) NOT NULL,
                          Contenido TEXT NOT NULL,
                          FechaPublicacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);