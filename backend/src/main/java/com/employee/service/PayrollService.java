package com.employee.service;

import com.employee.model.Employee;
import com.employee.model.Payroll;
import com.employee.model.Attendance;
import com.employee.repository.PayrollRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Service
public class PayrollService {
    @Autowired
    private PayrollRepository payrollRepository;

    public Payroll generatePayroll(Payroll payroll) {
        return payrollRepository.save(payroll);
    }

    public List<Payroll> getEmployeePayrolls(Long employeeId) {
        return payrollRepository.findByEmployeeId(employeeId);
    }

    public List<Payroll> getEmployeePayrollsByDateRange(Long employeeId, Date startDate, Date endDate) {
        return payrollRepository.findByEmployeeIdAndPaymentDateBetween(employeeId, startDate, endDate);
    }

    public BigDecimal calculateNetSalary(Employee employee, List<Attendance> attendanceRecords) {
        BigDecimal basicSalary = new BigDecimal(employee.getSalary());
        BigDecimal deductions = calculateDeductions(attendanceRecords);
        return basicSalary.subtract(deductions);
    }

    private BigDecimal calculateDeductions(List<Attendance> attendanceRecords) {
        // Implement deduction calculation logic based on attendance
        return BigDecimal.ZERO;
    }
}
