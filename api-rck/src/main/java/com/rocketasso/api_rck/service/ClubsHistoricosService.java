package com.rocketasso.api_rck.service;


import com.rocketasso.api_rck.model.ClubsHistoricosEntity;
import com.rocketasso.api_rck.model.ClubsHistoricosRepo;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClubsHistoricosService {
    private final ClubsHistoricosRepo repository;

    public ClubsHistoricosService(ClubsHistoricosRepo repository) {
        this.repository = repository;
    }

    public List<ClubsHistoricosEntity> obtenerClasificacionHistorica() {
        List<ClubsHistoricosEntity> lista = repository.findAllOrdered();
        System.out.println("Consulta ejecutada. Registros obtenidos: " + lista.size());
        for (ClubsHistoricosEntity club : lista) {
            System.out.println(club);
        }
        return lista;
    }

}

