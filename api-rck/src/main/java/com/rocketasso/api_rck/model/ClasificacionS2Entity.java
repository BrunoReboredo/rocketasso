package com.rocketasso.api_rck.model;


import jakarta.persistence.*;

@Entity
@Table(name = "TClasificacionS2")
public class ClasificacionS2Info {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "ClubId", nullable = false)
    private InfoClubsS2 club;

    @Column(name = "NombreClub", length = 50, nullable = false)
    private String nombreClub;

    @Column(name = "Posicion", nullable = false)
    private int posicion;

    @Column(name = "PartidosGanados", nullable = false)
    private int partidosGanados;

    @Column(name = "PartidosPerdidos", nullable = false)
    private int partidosPerdidos;

    @Column(name = "DiferenciaPartidos", insertable = false, updatable = false)
    private int diferenciaPartidos;

    @Column(name = "Puntos", nullable = false)
    private int puntos;

    // Constructor vacío
    public ClasificacionS2Info() {
    }

    // Getters y Setters
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public InfoClubsS2 getClub() {
        return club;
    }

    public void setClub(InfoClubsS2 club) {
        this.club = club;
        this.nombreClub = club.getNombre(); // Asegurar consistencia en el nombre
    }

    public String getNombreClub() {
        return nombreClub;
    }

    public int getPosicion() {
        return posicion;
    }

    public void setPosicion(int posicion) {
        this.posicion = posicion;
    }

    public int getPartidosGanados() {
        return partidosGanados;
    }

    public void setPartidosGanados(int partidosGanados) {
        this.partidosGanados = partidosGanados;
    }

    public int getPartidosPerdidos() {
        return partidosPerdidos;
    }

    public void setPartidosPerdidos(int partidosPerdidos) {
        this.partidosPerdidos = partidosPerdidos;
    }

    public int getDiferenciaPartidos() {
        return diferenciaPartidos;
    }

    public int getPuntos() {
        return puntos;
    }

    public void setPuntos(int puntos) {
        this.puntos = puntos;
    }
}
