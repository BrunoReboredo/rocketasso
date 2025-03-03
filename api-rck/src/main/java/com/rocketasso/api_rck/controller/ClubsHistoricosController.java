package com.rocketasso.api_rck.controller;

import com.rocketasso.api_rck.model.ClubsHistoricosEntity;
import com.rocketasso.api_rck.service.ClubsHistoricosService;
import io.swagger.v3.oas.annotations.Operation;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/historicalclassification")
@CrossOrigin(origins = "*") // Permite peticiones desde cualquier origen (configurable)
public class ClubsHistoricosController {

    private final ClubsHistoricosService clubsHistoricosService;

    public ClubsHistoricosController(ClubsHistoricosService clubsHistoricosService) {
        this.clubsHistoricosService = clubsHistoricosService;
    }

    @GetMapping("/")
    @Operation(summary = "Obtener todos los datos de TClubsHistoricos", description = "Devuelve la clasificación histórica ordenada por puntuación, diferencia de partidos y nombre.")
    public ResponseEntity<List<ClubsHistoricosEntity>> obtenerClasificacion() {
        List<ClubsHistoricosEntity> clasificacion = clubsHistoricosService.obtenerClasificacionHistorica();
        if (clasificacion.isEmpty()) {
            return ResponseEntity.noContent().build(); // HTTP 204 si no hay datos
        }
        return ResponseEntity.ok(clasificacion); // HTTP 200 con la lista de datos
    }
}
