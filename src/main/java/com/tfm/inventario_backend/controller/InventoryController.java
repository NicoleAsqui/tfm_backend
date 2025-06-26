package com.tfm.inventario_backend.controller;

import com.tfm.inventario_backend.model.Inventory;
import com.tfm.inventario_backend.repository.InventoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/inventory")
public class InventoryController {

    @Autowired
    private InventoryRepository inventoryRepository;

    @GetMapping
    public List<Inventory> getAll() {
        return inventoryRepository.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Inventory> getById(@PathVariable String id) {
        Optional<Inventory> inventory = inventoryRepository.findById(id);
        return inventory.map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
    public Inventory create(@RequestBody Inventory inventory) {
        return inventoryRepository.save(inventory);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Inventory> update(@PathVariable String id, @RequestBody Inventory inventoryDetails) {
        return inventoryRepository.findById(id).map(inventory -> {
            inventory.setNombre(inventoryDetails.getNombre());
            inventory.setCategoria(inventoryDetails.getCategoria());
            inventory.setMarca(inventoryDetails.getMarca());
            inventory.setPrecioCompra(inventoryDetails.getPrecioCompra());
            inventory.setPrecioVenta(inventoryDetails.getPrecioVenta());
            inventory.setStockTotal(inventoryDetails.getStockTotal());
            inventory.setStockMinimo(inventoryDetails.getStockMinimo());
            inventory.setCaducidad(inventoryDetails.getCaducidad());
            inventory.setLote(inventoryDetails.getLote());
            inventory.setPuntoVenta(inventoryDetails.getPuntoVenta());
            Inventory updated = inventoryRepository.save(inventory);
            return ResponseEntity.ok(updated);
        }).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Object> delete(@PathVariable String id) {
        return inventoryRepository.findById(id).map(inventory -> {
            inventoryRepository.delete(inventory);
            return ResponseEntity.noContent().build();
        }).orElseGet(() -> ResponseEntity.notFound().build());
    }
}