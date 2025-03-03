package com.rocketasso.api_rck.service;


import com.rocketasso.api_rck.model.ClubsHistoricosEntity;
import com.rocketasso.api_rck.model.ClubsHistoricosRepo;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClubsHistoricosService {

    private final ClubsHistoricosRepo clubsHistoricosRepo;

    public ClubsHistoricosService(ClubsHistoricosRepo clubHistoricoRepository, ClubsHistoricosRepo clubsHistoricosRepo) {
        this.clubsHistoricosRepo = clubsHistoricosRepo;
    }

    public List<ClubsHistoricosEntity> obtenerClasificacionHistorica() {
        return clubsHistoricosRepo.findAllOrdered();
    }
}
