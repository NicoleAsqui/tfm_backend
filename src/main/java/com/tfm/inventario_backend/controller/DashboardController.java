package com.tfm.inventario_backend.controller;

import com.tfm.inventario_backend.model.Inventory;
import com.tfm.inventario_backend.model.Movement;
import com.tfm.inventario_backend.model.Alert;
import com.tfm.inventario_backend.repository.InventoryRepository;
import com.tfm.inventario_backend.repository.MovementRepository;
import com.tfm.inventario_backend.repository.AlertRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
public class DashboardController {

    @Autowired
    private InventoryRepository inventoryRepository;

    @Autowired
    private MovementRepository movementRepository;

    @Autowired
    private AlertRepository alertRepository;

    @GetMapping("/inventory")
    public List<Inventory> getInventory() {
        return inventoryRepository.findAll();
    }

    @GetMapping("/movements")
    public List<Movement> getMovements() {
        return movementRepository.findAll();
    }

    @GetMapping("/alerts")
    public List<Alert> getAlerts() {
        return alertRepository.findAll();
    }
}