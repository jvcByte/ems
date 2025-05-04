package com.example.ems.service;

import com.example.ems.entity.UserRole;
import com.example.ems.repository.UserRoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserRoleService {
    @Autowired
    private UserRoleRepository userRoleRepository;

    public List<UserRole> getAllUserRoles() {
        return userRoleRepository.findAll();
    }

    public Optional<UserRole> getUserRoleById(Long id) {
        return userRoleRepository.findById(id);
    }

    public UserRole createUserRole(UserRole userRole) {
        return userRoleRepository.save(userRole);
    }

    public UserRole updateUserRole(Long id, UserRole userRoleDetails) {
        UserRole userRole = userRoleRepository.findById(id).orElseThrow();
        // Set fields to update here
        return userRoleRepository.save(userRole);
    }

    public void deleteUserRole(Long id) {
        userRoleRepository.deleteById(id);
    }
}
