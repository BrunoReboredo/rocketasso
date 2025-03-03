package com.rocketasso.api_rck.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "THallOfFame")
@Getter
@Setter
public class HallOfFameEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "Nombre", nullable = false, length = 50)
    private String nombre;

    @Column(name = "Logo", nullable = false, length = 255)
    private String logo;

    @Column(name = "Abreviatura", nullable = false, length = 4)
    private String abreviatura;

    @Column(name = "Competicion", nullable = false, length = 50)
    private String competicion;

    @Column(name = "Puesto", nullable = false)
    private int puesto;
}
