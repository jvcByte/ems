package com.example.ems.service;

import com.example.ems.entity.Position;
import com.example.ems.repository.PositionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PositionService {
    @Autowired
    private PositionRepository positionRepository;

    public List<Position> getAllPositions() {
        return positionRepository.findAll();
    }

    public Optional<Position> getPositionById(Long id) {
        return positionRepository.findById(id);
    }

    public Position createPosition(Position position) {
        return positionRepository.save(position);
    }

    public Position updatePosition(Long id, Position positionDetails) {
        Position position = positionRepository.findById(id).orElseThrow();
        position.setJobTitle(positionDetails.getJobTitle());
        position.setDescription(positionDetails.getDescription());
        position.setSalaryGrade(positionDetails.getSalaryGrade());
        position.setResponsibilities(positionDetails.getResponsibilities());
        position.setDepartment(positionDetails.getDepartment());
        return positionRepository.save(position);
    }

    public void deletePosition(Long id) {
        positionRepository.deleteById(id);
    }
}
