package com.tfm.inventario_backend.controller;

import com.tfm.inventario_backend.model.Alert;
import com.tfm.inventario_backend.repository.AlertRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/api/alerts")
public class AlertController {

    @Autowired
    private AlertRepository alertRepository;

    @GetMapping
    public List<Alert> getAll() {
        return alertRepository.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Alert> getById(@PathVariable String id) {
        Optional<Alert> alert = alertRepository.findById(id);
        return alert.map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
    public Alert create(@RequestBody Alert alert) {
        alert.setId(UUID.randomUUID().toString());
        return alertRepository.save(alert);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Alert> update(@PathVariable String id, @RequestBody Alert alertDetails) {
        return alertRepository.findById(id).map(alert -> {
            alert.setTipo(alertDetails.getTipo());
            alert.setSeveridad(alertDetails.getSeveridad());
            alert.setTimestamp(alertDetails.getTimestamp());
            alert.setTitulo(alertDetails.getTitulo());
            alert.setDescripcion(alertDetails.getDescripcion());
            alert.setDetalles(alertDetails.getDetalles());
            alert.setLeida(alertDetails.isLeida());
            Alert updated = alertRepository.save(alert);
            return ResponseEntity.ok(updated);
        }).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Object> delete(@PathVariable String id) {
        return alertRepository.findById(id).map(alert -> {
            alertRepository.delete(alert);
            return ResponseEntity.noContent().build();
        }).orElseGet(() -> ResponseEntity.notFound().build());
    }
}