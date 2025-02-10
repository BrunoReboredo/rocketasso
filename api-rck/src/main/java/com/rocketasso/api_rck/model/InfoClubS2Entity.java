package com.rocketasso.api_rck.model;


import jakarta.persistence.*;

@Entity
@Table(name = "TInfoClubsS2")
public class InfoClubS2Entity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(nullable = false)
    private String nombre;
    @Column(nullable = false)
    private String abreviatura;
    @Column(nullable = false)
    private int puntuacion;
    @Column(nullable = false)
    private String correoElectronico;
    @Column(nullable = false)
    private String manager;
    @Column(nullable = false)
    private String x;
    @Column(nullable = false)
    private String tikTok;

    // Getters y setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getAbreviatura() {
        return abreviatura;
    }

    public void setAbreviatura(String abreviatura) {
        this.abreviatura = abreviatura;
    }

    public int getPuntuacion() {
        return puntuacion;
    }

    public void setPuntuacion(int puntuacion) {
        this.puntuacion = puntuacion;
    }

    public String getCorreoElectronico() {
        return correoElectronico;
    }

    public void setCorreoElectronico(String correoElectronico) {
        this.correoElectronico = correoElectronico;
    }

    public String getManager() {
        return manager;
    }

    public void setManager(String manager) {
        this.manager = manager;
    }

    public String getX() {
        return x;
    }

    public void setX(String x) {
        this.x = x;
    }

    public String getTikTok() {
        return tikTok;
    }

    public void setTikTok(String tikTok) {
        this.tikTok = tikTok;
    }
}
