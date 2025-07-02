package com.tfm.inventario_backend.controller;

import com.tfm.inventario_backend.model.Movement;
import com.tfm.inventario_backend.repository.MovementRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@CrossOrigin(origins = "http://localhost:5173")
@RestController
@RequestMapping("/api/movements")
public class MovementController {

    @Autowired
    private MovementRepository movementRepository;

    @GetMapping
    public List<Movement> getAll() {
        return movementRepository.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Movement> getById(@PathVariable Long id) {
        Optional<Movement> movement = movementRepository.findById(id);
        return movement.map(ResponseEntity::ok)
                .orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
    public Movement create(@RequestBody Movement movement) {
        return movementRepository.save(movement);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Movement> update(@PathVariable Long id, @RequestBody Movement movementDetails) {
        return movementRepository.findById(id).map(movement -> {
            movement.setFecha(movementDetails.getFecha());
            movement.setProducto(movementDetails.getProducto());
            movement.setTipo(movementDetails.getTipo());
            movement.setCategoria(movementDetails.getCategoria());
            movement.setCantidad(movementDetails.getCantidad());
            movement.setCostoUnitario(movementDetails.getCostoUnitario());
            movement.setCostoTotal(movementDetails.getCostoTotal());
            movement.setPuntoVenta(movementDetails.getPuntoVenta());
            movement.setResponsable(movementDetails.getResponsable());
            movement.setCliente(movementDetails.getCliente());
            movement.setMotivo(movementDetails.getMotivo());
            movement.setAprobadoPor(movementDetails.getAprobadoPor());
            Movement updated = movementRepository.save(movement);
            return ResponseEntity.ok(updated);
        }).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Object> delete(@PathVariable Long id) {
        return movementRepository.findById(id).map(movement -> {
            movementRepository.delete(movement);
            return ResponseEntity.noContent().build();
        }).orElseGet(() -> ResponseEntity.notFound().build());
    }
}