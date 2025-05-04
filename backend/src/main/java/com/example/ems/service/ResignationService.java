package com.example.ems.service;

import com.example.ems.entity.Resignation;
import com.example.ems.repository.ResignationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ResignationService {
    @Autowired
    private ResignationRepository resignationRepository;

    public List<Resignation> getAllResignations() {
        return resignationRepository.findAll();
    }

    public Optional<Resignation> getResignationById(Long id) {
        return resignationRepository.findById(id);
    }

    public Resignation createResignation(Resignation resignation) {
        return resignationRepository.save(resignation);
    }

    public Resignation updateResignation(Long id, Resignation resignationDetails) {
        Resignation resignation = resignationRepository.findById(id).orElseThrow();
        // Set fields to update here
        return resignationRepository.save(resignation);
    }

    public void deleteResignation(Long id) {
        resignationRepository.deleteById(id);
    }
}
