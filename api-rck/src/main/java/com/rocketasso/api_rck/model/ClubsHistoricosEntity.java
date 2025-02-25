package com.rocketasso.api_rck.model;

import jakarta.persistence.*;

@Entity
@Table(name = "TClubsHistoricos")
public class ClubsHistoricosEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "ClubId", unique = true)
    private Integer clubId;

    @Column(name = "Nombre", nullable = false, length = 50)
    private String nombre;

    @Column(name = "Abreviatura", nullable = false, length = 4)
    private String abreviatura;

    @Column(name = "Puntuacion", nullable = false)
    private Integer puntuacion;

    @Column(name = "PartidosGanados", nullable = false)
    private Integer partidosGanados;

    @Column(name = "PartidosPerdidos", nullable = false)
    private Integer partidosPerdidos;

    // La columna calculada no la mapeamos directamente
    // pero podemos crear un método para calcularla cuando sea necesario
    @Transient
    public Integer getDiferenciaPartidos() {
        return this.partidosGanados - this.partidosPerdidos;
    }
  

}
