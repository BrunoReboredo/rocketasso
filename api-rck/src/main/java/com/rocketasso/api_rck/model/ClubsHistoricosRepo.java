package com.rocketasso.api_rck.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClubsHistoricosRepo extends JpaRepository<ClubsHistoricosEntity, Integer> {

    @Query("SELECT c FROM ClubsHistoricosEntity c ORDER BY c.puntuacion DESC, (c.partidosGanados - c.partidosPerdidos) DESC, c.nombre ASC")
    List<ClubsHistoricosEntity> findAllOrdered();
}
