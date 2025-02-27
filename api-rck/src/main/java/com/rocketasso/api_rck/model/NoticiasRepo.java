package com.rocketasso.api_rck.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface NoticiasRepo extends JpaRepository<NoticiasEntity, Long> {
}
