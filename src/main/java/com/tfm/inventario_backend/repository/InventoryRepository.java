package com.tfm.inventario_backend.repository;

import com.tfm.inventario_backend.model.Inventory;
import org.springframework.data.jpa.repository.JpaRepository;

public interface InventoryRepository extends JpaRepository<Inventory, String> {
}