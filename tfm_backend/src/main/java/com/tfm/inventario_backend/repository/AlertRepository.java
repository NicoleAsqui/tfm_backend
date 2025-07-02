package com.tfm.inventario_backend.repository;

import com.tfm.inventario_backend.model.Alert;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AlertRepository extends JpaRepository<Alert, String> {
}