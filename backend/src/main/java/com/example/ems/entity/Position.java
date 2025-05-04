package com.example.ems.entity;

import jakarta.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "Positions")
public class Position {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long positionId;

    private String jobTitle;
    private String description;
    private BigDecimal salaryGrade;
    private String responsibilities;

    @ManyToOne
    @JoinColumn(name = "department_id")
    private Department department;

    public Long getPositionId() { return positionId; }
    public void setPositionId(Long positionId) { this.positionId = positionId; }
    public String getJobTitle() { return jobTitle; }
    public void setJobTitle(String jobTitle) { this.jobTitle = jobTitle; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public BigDecimal getSalaryGrade() { return salaryGrade; }
    public void setSalaryGrade(BigDecimal salaryGrade) { this.salaryGrade = salaryGrade; }
    public String getResponsibilities() { return responsibilities; }
    public void setResponsibilities(String responsibilities) { this.responsibilities = responsibilities; }
    public Department getDepartment() { return department; }
    public void setDepartment(Department department) { this.department = department; }
}
