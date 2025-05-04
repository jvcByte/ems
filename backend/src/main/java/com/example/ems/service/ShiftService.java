package com.example.ems.service;

import com.example.ems.entity.Shift;
import com.example.ems.repository.ShiftRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ShiftService {
    @Autowired
    private ShiftRepository shiftRepository;

    public List<Shift> getAllShifts() {
        return shiftRepository.findAll();
    }

    public Optional<Shift> getShiftById(Long id) {
        return shiftRepository.findById(id);
    }

    public Shift createShift(Shift shift) {
        return shiftRepository.save(shift);
    }

    public Shift updateShift(Long id, Shift shiftDetails) {
        Shift shift = shiftRepository.findById(id).orElseThrow();
        // Set fields to update here
        return shiftRepository.save(shift);
    }

    public void deleteShift(Long id) {
        shiftRepository.deleteById(id);
    }
}
