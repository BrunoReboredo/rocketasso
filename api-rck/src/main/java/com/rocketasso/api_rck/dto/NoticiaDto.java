package com.rocketasso.api_rck.dto;

import java.sql.Timestamp;

public class NoticiaDto {
    private Long id;
    private String titulo;
    private String contenido;
    private String subtitulo;
    private Timestamp fechaPublicacion;

    // Getters y Setters
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getTitulo() {
        return titulo;
    }
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }
    public String getContenido() {
        return contenido;
    }
    public void setContenido(String contenido) {
        this.contenido = contenido;
    }
    public String getSubtitulo() {
        return subtitulo;
    }
    public void setSubtitulo(String subtitulo) {
        this.subtitulo = subtitulo;
    }
    public Timestamp getFechaPublicacion() {
        return fechaPublicacion;
    }
    public void setFechaPublicacion(Timestamp fechaPublicacion) {
        this.fechaPublicacion = fechaPublicacion;
    }
}

