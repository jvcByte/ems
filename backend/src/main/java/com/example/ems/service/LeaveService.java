package com.example.ems.service;

import com.example.ems.entity.Leave;
import com.example.ems.repository.LeaveRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class LeaveService {
    @Autowired
    private LeaveRepository leaveRepository;

    public List<Leave> getAllLeaves() {
        return leaveRepository.findAll();
    }

    public Optional<Leave> getLeaveById(Long id) {
        return leaveRepository.findById(id);
    }

    public Leave createLeave(Leave leave) {
        return leaveRepository.save(leave);
    }

    public Leave updateLeave(Long id, Leave leaveDetails) {
        Leave leave = leaveRepository.findById(id).orElseThrow();
        // Set fields to update here
        return leaveRepository.save(leave);
    }

    public void deleteLeave(Long id) {
        leaveRepository.deleteById(id);
    }
}
