package com.rocketasso.api_rck.controller;


import com.rocketasso.api_rck.model.ClubsHistoricosEntity;
import com.rocketasso.api_rck.service.ClubsHistoricosService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/historicalclasificacion")
@CrossOrigin(origins = "*") // Permitir peticiones desde el frontend
public class ClubsHistoricosController {

    private final ClubsHistoricosService clubsHistoricosService;

    public ClubsHistoricosController(ClubsHistoricosService clubsHistoricosService) {
        this.clubsHistoricosService = clubsHistoricosService;
    }

    @GetMapping
    public List<ClubsHistoricosEntity> obtenerClasificacion() {
        return clubsHistoricosService.obtenerClasificacionHistorica();
    }
}
