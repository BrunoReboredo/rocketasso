CREATE TABLE TInfoClubsS2 (
                              Id INT PRIMARY KEY AUTO_INCREMENT,
                              Nombre VARCHAR(50) NOT null,
                              Logo VARCHAR(255) NOT NULL,
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
                                  Abreviatura CHAR(4) NOT NULL,
                                  Logo VARCHAR(255) NOT NULL,
                                  Posicion INT NOT NULL,
                                  PartidosGanados INT(5) NOT NULL,
                                  PartidosPerdidos INT(5) NOT NULL,
                                  DiferenciaPartidos INT(5) as (PartidosGanados - PartidosPerdidos),
                                  Puntos INT NOT NULL,
                                  FOREIGN KEY (ClubId) REFERENCES TInfoClubsS2 (Id) ON DELETE CASCADE
);

-- drop table TClasificacionS2;

CREATE TABLE TClubsHistoricos (
                                  Id INT PRIMARY KEY AUTO_INCREMENT,
                                  ClubId INT UNIQUE,
                                  Nombre VARCHAR(50) NOT NULL,
                                  Logo VARCHAR(255) NOT NULL,
                                  Puntuacion INT(10) NOT NULL,
                                  PartidosGanados INT(5) NOT NULL,
                                  PartidosPerdidos INT(5) NOT NULL,
                                  DiferenciaPartidos INT(5) as (PartidosGanados-PartidosPerdidos)
);

-- drop table tclubshistoricos;

-- select * from tclubshistoricos;

CREATE TABLE THallOfFame (
                             Id INT PRIMARY KEY AUTO_INCREMENT,
                             Nombre VARCHAR(50) NOT NULL,
                             Logo VARCHAR(255) NOT NULL,
                             Abreviatura CHAR(4) NOT NULL,
                             Competicion varchar (50) not null,
                             Puesto int (1) not null
);

-- drop table tHallOfFame;

create table TNoticias(
                          Id INT PRIMARY KEY AUTO_INCREMENT,
                          Titulo VARCHAR(100) NOT NULL,
                          Foto varchar(255),
                          Contenido TEXT NOT NULL,
                          FechaPublicacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- drop table tnoticias ;