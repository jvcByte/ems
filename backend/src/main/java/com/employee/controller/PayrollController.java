package com.employee.controller;

import com.employee.model.Payroll;
import com.employee.service.PayrollService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/api/payroll")
public class PayrollController {
    @Autowired
    private PayrollService payrollService;

    @PostMapping
    public Payroll generatePayroll(@RequestBody Payroll payroll) {
        return payrollService.generatePayroll(payroll);
    }

    @GetMapping("/employee/{employeeId}")
    public List<Payroll> getEmployeePayrolls(@PathVariable Long employeeId) {
        return payrollService.getEmployeePayrolls(employeeId);
    }

    @GetMapping("/employee/{employeeId}/date-range")
    public List<Payroll> getEmployeePayrollsByDateRange(
            @PathVariable Long employeeId,
            @RequestParam("start") Date startDate,
            @RequestParam("end") Date endDate) {
        return payrollService.getEmployeePayrollsByDateRange(employeeId, startDate, endDate);
    }
}
