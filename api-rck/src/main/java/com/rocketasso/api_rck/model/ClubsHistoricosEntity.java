package com.rocketasso.api_rck.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "tclubshistoricos")
public class ClubsHistoricosEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "ClubId", unique = true, nullable = false)
    private int clubId;

    @Column(name = "Nombre", nullable = false)
    private String nombre;

    @Column(name = "Logo", nullable = false)
    private String logo;

    @Column(name = "Puntuacion", nullable = false)
    private int puntuacion;

    @Column(name = "PartidosGanados", nullable = false)
    private int partidosGanados;

    @Column(name = "PartidosPerdidos", nullable = false)
    private int partidosPerdidos;


    @Column(name = "DiferenciaPartidos")
    private Integer diferenciaPartidos;


    @Override
    public String toString() {
        return "ClubsHistoricosEntity{" +
                "id=" + id +
                ", clubId=" + clubId +
                ", nombre='" + nombre + '\'' +
                ", logo='" + logo + '\'' +
                ", puntuacion=" + puntuacion +
                ", partidosGanados=" + partidosGanados +
                ", partidosPerdidos=" + partidosPerdidos +
                ", diferenciaPartidos=" + diferenciaPartidos +
                '}';
    }

}

