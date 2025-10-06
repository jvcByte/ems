package com.example.ems.service;

import com.example.ems.entity.AuditLog;
import com.example.ems.repository.AuditLogRepository;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AuditLogService {

    @Autowired
    private AuditLogRepository auditLogRepository;

    public List<AuditLog> getAllAuditLogs() {
        return auditLogRepository.findAll();
    }

    public Optional<AuditLog> getAuditLogById(Long id) {
        return auditLogRepository.findById(id);
    }

    public AuditLog createAuditLog(AuditLog auditLog) {
        return auditLogRepository.save(auditLog);
    }

    public AuditLog updateAuditLog(Long id, AuditLog auditLogDetails) {
        AuditLog auditLog = auditLogRepository.findById(id).orElseThrow();
        // Set fields to update here
        return auditLogRepository.save(auditLog);
    }

    public void deleteAuditLog(Long id) {
        auditLogRepository.deleteById(id);
    }
}
