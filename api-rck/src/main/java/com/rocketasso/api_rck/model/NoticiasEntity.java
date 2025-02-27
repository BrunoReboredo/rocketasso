package com.rocketasso.api_rck.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;


@Entity
@Table(name = "TNoticias")
@Getter
@Setter
public class NoticiasEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "Titulo", nullable = false, length = 100)
    private String titulo;

    @Column(name = "Contenido", nullable = false, columnDefinition = "TEXT")
    private String contenido;

    @Column(name = "FechaPublicacion", nullable = false, updatable = false)
    private LocalDateTime fechaPublicacion;

    @PrePersist
    protected void onCreate() {
        fechaPublicacion = LocalDateTime.now();
    }

}
