package com.rocketasso.api_rck.controller;

import com.rocketasso.api_rck.dto.NoticiaDto;
import com.rocketasso.api_rck.model.NoticiasEntity;
import com.rocketasso.api_rck.model.NoticiasRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import java.sql.Timestamp;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/noticias")
public class NoticiasController {

    @Autowired
    private NoticiasRepo noticiasRepository;

    // Endpoint para obtener todas las noticias (solo título y subtítulo)
    @GetMapping
    public List<NoticiaDto> getAllNoticias() {
        List<NoticiasEntity> noticias = noticiasRepository.findAll();
        return noticias.stream().map(this::mapToNoticiaDto).collect(Collectors.toList());
    }

    // Endpoint para obtener una noticia por ID (con contenido completo)
    @GetMapping("/{id}")
    public ResponseEntity<NoticiaDto> getNoticiaById(@PathVariable("id") Long id) {
        NoticiasEntity noticia = noticiasRepository.findById(id).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
        return ResponseEntity.ok(mapToNoticiaDto(noticia));
    }

    // Mapeo de la entidad Noticia a NoticiaDto
    private NoticiaDto mapToNoticiaDto(NoticiasEntity noticia) {
        NoticiaDto dto = new NoticiaDto();
        dto.setId(noticia.getId());
        dto.setTitulo(noticia.getTitulo());
        dto.setContenido(noticia.getContenido());
        dto.setFechaPublicacion(Timestamp.valueOf(noticia.getFechaPublicacion()));
        // Obtener el subtítulo como una corta parte del contenido
        dto.setSubtitulo(noticia.getContenido().length() > 100 ? noticia.getContenido().substring(0, 100) + "..." : noticia.getContenido());
        return dto;
    }
}