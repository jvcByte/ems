package com.example.ems.controller;

import com.example.ems.entity.Promotion;
import com.example.ems.service.PromotionService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/promotions")
public class PromotionController {

    @Autowired
    private PromotionService promotionService;

    @GetMapping
    public List<Promotion> getAllPromotions() {
        return promotionService.getAllPromotions();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Promotion> getPromotionById(@PathVariable Long id) {
        return promotionService
            .getPromotionById(id)
            .map(ResponseEntity::ok)
            .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public Promotion createPromotion(@RequestBody Promotion promotion) {
        return promotionService.createPromotion(promotion);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Promotion> updatePromotion(
        @PathVariable Long id,
        @RequestBody Promotion promotionDetails
    ) {
        try {
            Promotion updated = promotionService.updatePromotion(
                id,
                promotionDetails
            );
            return ResponseEntity.ok(updated);
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deletePromotion(@PathVariable Long id) {
        promotionService.deletePromotion(id);
        return ResponseEntity.noContent().build();
    }
}
