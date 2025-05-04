package com.example.ems.service;

import com.example.ems.entity.Training;
import com.example.ems.repository.TrainingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TrainingService {
    @Autowired
    private TrainingRepository trainingRepository;

    public List<Training> getAllTrainings() {
        return trainingRepository.findAll();
    }

    public Optional<Training> getTrainingById(Long id) {
        return trainingRepository.findById(id);
    }

    public Training createTraining(Training training) {
        return trainingRepository.save(training);
    }

    public Training updateTraining(Long id, Training trainingDetails) {
        Training training = trainingRepository.findById(id).orElseThrow();
        // Set fields to update here
        return trainingRepository.save(training);
    }

    public void deleteTraining(Long id) {
        trainingRepository.deleteById(id);
    }
}
