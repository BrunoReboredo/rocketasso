package com.rocketasso.api_rck.controller;

import java.util.List;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/hall-of-fame")
@CrossOrigin(origins = "*")
public class HallOfFameController {
    private final JdbcTemplate jdbc;

    public HallOfFameController(JdbcTemplate jdbc) {
        this.jdbc = jdbc;
    }

    public record Champion(int temporada, String nombre, String logo, List<String> jugadores) {}

    @GetMapping
    public List<Champion> champions() {
        return jdbc.query("SELECT temporada, club_nombre, logo FROM rck_championship_winners ORDER BY temporada DESC",
            (rs, row) -> new Champion(rs.getInt("temporada"), rs.getString("club_nombre"), rs.getString("logo"),
                jdbc.queryForList("SELECT nombre FROM rck_champion_players WHERE temporada=? ORDER BY orden, nombre",
                    String.class, rs.getInt("temporada"))));
    }
}