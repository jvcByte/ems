package com.example.ems.service;

import com.example.ems.entity.EmployeeProject;
import com.example.ems.repository.EmployeeProjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class EmployeeProjectService {
    @Autowired
    private EmployeeProjectRepository employeeProjectRepository;

    public List<EmployeeProject> getAllEmployeeProjects() {
        return employeeProjectRepository.findAll();
    }

    public Optional<EmployeeProject> getEmployeeProjectById(Long id) {
        return employeeProjectRepository.findById(id);
    }

    public EmployeeProject createEmployeeProject(EmployeeProject employeeProject) {
        return employeeProjectRepository.save(employeeProject);
    }

    public EmployeeProject updateEmployeeProject(Long id, EmployeeProject employeeProjectDetails) {
        EmployeeProject employeeProject = employeeProjectRepository.findById(id).orElseThrow();
        // Set fields to update here
        return employeeProjectRepository.save(employeeProject);
    }

    public void deleteEmployeeProject(Long id) {
        employeeProjectRepository.deleteById(id);
    }
}
