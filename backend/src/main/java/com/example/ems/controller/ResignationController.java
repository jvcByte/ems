package com.example.ems.controller;

import com.example.ems.entity.Resignation;
import com.example.ems.service.ResignationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/resignations")
public class ResignationController {
    @Autowired
    private ResignationService resignationService;

    @GetMapping
    public List<Resignation> getAllResignations() {
        return resignationService.getAllResignations();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Resignation> getResignationById(@PathVariable Long id) {
        return resignationService.getResignationById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public Resignation createResignation(@RequestBody Resignation resignation) {
        return resignationService.createResignation(resignation);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Resignation> updateResignation(@PathVariable Long id, @RequestBody Resignation resignationDetails) {
        try {
            Resignation updated = resignationService.updateResignation(id, resignationDetails);
            return ResponseEntity.ok(updated);
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteResignation(@PathVariable Long id) {
        resignationService.deleteResignation(id);
        return ResponseEntity.noContent().build();
    }
}
