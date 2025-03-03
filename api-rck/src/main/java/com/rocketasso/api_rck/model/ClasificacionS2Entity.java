package com.rocketasso.api_rck.model;


import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "TClasificacionS2")
@Getter
@Setter
public class ClasificacionS2Entity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "ClubId", nullable = false)
    private InfoClubS2Entity club;

    @Column(name = "NombreClub", length = 50, nullable = false)
    private String nombreClub;

    @Column(name = "Abreviatura", nullable = false, length = 4)
    private String abreviatura;

    @Column(name = "Logo", nullable = false, length = 255)
    private String logo;

    @Column(name = "Posicion", nullable = false)
    private int posicion;

    @Column(name = "PartidosGanados", nullable = false)
    private int partidosGanados;

    @Column(name = "PartidosPerdidos", nullable = false)
    private int partidosPerdidos;

    @Transient
    public int getDiferenciaPartidos() {
        return this.partidosGanados - this.partidosPerdidos;
    }

    @Column(name = "Puntos", nullable = false)
    private int puntos;
}