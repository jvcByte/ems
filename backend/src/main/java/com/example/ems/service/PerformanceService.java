package com.example.ems.service;

import com.example.ems.entity.Performance;
import com.example.ems.repository.PerformanceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PerformanceService {
    @Autowired
    private PerformanceRepository performanceRepository;

    public List<Performance> getAllPerformances() {
        return performanceRepository.findAll();
    }

    public Optional<Performance> getPerformanceById(Long id) {
        return performanceRepository.findById(id);
    }

    public Performance createPerformance(Performance performance) {
        return performanceRepository.save(performance);
    }

    public Performance updatePerformance(Long id, Performance performanceDetails) {
        Performance performance = performanceRepository.findById(id).orElseThrow();
        // Set fields to update here
        return performanceRepository.save(performance);
    }

    public void deletePerformance(Long id) {
        performanceRepository.deleteById(id);
    }
}
