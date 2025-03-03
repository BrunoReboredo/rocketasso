package com.rocketasso.api_rck.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;

@Entity
@Table(name = "TInfoClubsS2")
@Getter
@Setter
public class InfoClubS2Entity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "Nombre", nullable = false, length = 50)
    private String nombre;

    @Column(name = "Logo", nullable = false, length = 255)
    private String logo;

    @Column(name = "Abreviatura", nullable = false, length = 4)
    private String abreviatura;

    @Column(name = "Puntuacion", nullable = false)
    private int puntuacion;

    @Column(name = "CorreoElectronico", nullable = false, length = 50)
    private String correoElectronico;

    @Column(name = "Manager", nullable = false, length = 50)
    private String manager;

    @Column(name = "X", length = 30)
    private String x;

    @Column(name = "TikTok", length = 30)
    private String tikTok;
}

