package com.example.ems.service;

import com.example.ems.entity.Salary;
import com.example.ems.repository.SalaryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class SalaryService {
    @Autowired
    private SalaryRepository salaryRepository;

    public List<Salary> getAllSalaries() {
        return salaryRepository.findAll();
    }

    public Optional<Salary> getSalaryById(Long id) {
        return salaryRepository.findById(id);
    }

    public Salary createSalary(Salary salary) {
        return salaryRepository.save(salary);
    }

    public Salary updateSalary(Long id, Salary salaryDetails) {
        Salary salary = salaryRepository.findById(id).orElseThrow();
        salary.setEmployee(salaryDetails.getEmployee());
        salary.setBaseSalary(salaryDetails.getBaseSalary());
        salary.setBonuses(salaryDetails.getBonuses());
        salary.setDeductions(salaryDetails.getDeductions());
        salary.setEffectiveDate(salaryDetails.getEffectiveDate());
        salary.setEndDate(salaryDetails.getEndDate());
        salary.setCurrency(salaryDetails.getCurrency());
        salary.setPaymentType(salaryDetails.getPaymentType());
        return salaryRepository.save(salary);
    }

    public void deleteSalary(Long id) {
        salaryRepository.deleteById(id);
    }
}
