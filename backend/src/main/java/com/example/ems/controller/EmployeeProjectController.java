package com.example.ems.controller;

import com.example.ems.entity.EmployeeProject;
import com.example.ems.service.EmployeeProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/employee-projects")
public class EmployeeProjectController {
    @Autowired
    private EmployeeProjectService employeeProjectService;

    @GetMapping
    public List<EmployeeProject> getAllEmployeeProjects() {
        return employeeProjectService.getAllEmployeeProjects();
    }

    @GetMapping("/{id}")
    public ResponseEntity<EmployeeProject> getEmployeeProjectById(@PathVariable Long id) {
        return employeeProjectService.getEmployeeProjectById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @PostMapping
    public EmployeeProject createEmployeeProject(@RequestBody EmployeeProject employeeProject) {
        return employeeProjectService.createEmployeeProject(employeeProject);
    }

    @PutMapping("/{id}")
    public ResponseEntity<EmployeeProject> updateEmployeeProject(@PathVariable Long id, @RequestBody EmployeeProject employeeProjectDetails) {
        try {
            EmployeeProject updated = employeeProjectService.updateEmployeeProject(id, employeeProjectDetails);
            return ResponseEntity.ok(updated);
        } catch (Exception e) {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteEmployeeProject(@PathVariable Long id) {
        employeeProjectService.deleteEmployeeProject(id);
        return ResponseEntity.noContent().build();
    }
}
