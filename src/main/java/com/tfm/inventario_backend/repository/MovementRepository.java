package com.tfm.inventario_backend.repository;

import com.tfm.inventario_backend.model.Movement;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MovementRepository extends JpaRepository<Movement, Long> {
}