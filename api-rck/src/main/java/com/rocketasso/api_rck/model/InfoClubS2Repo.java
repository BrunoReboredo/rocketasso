package com.rocketasso.api_rck.model;


import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import org.springframework.data.jpa.repository.JpaRepository;

@Entity
@Table(name = "TInfoClubsS2")
public interface InfoClubS2Repo extends JpaRepository<InfoClubS2Entity, Integer> {

}
