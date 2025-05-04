package com.example.ems.entity;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "Assets")
public class Asset {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long assetId;

    @ManyToOne
    @JoinColumn(name = "employee_id")
    private Employee employee;

    private String assetType;
    private String assetName;
    @Column(unique = true)
    private String serialNumber;
    private LocalDate assignmentDate;
    private LocalDate returnDate;
    private String condition;

    public Long getAssetId() { return assetId; }
    public void setAssetId(Long assetId) { this.assetId = assetId; }
    public Employee getEmployee() { return employee; }
    public void setEmployee(Employee employee) { this.employee = employee; }
    public String getAssetType() { return assetType; }
    public void setAssetType(String assetType) { this.assetType = assetType; }
    public String getAssetName() { return assetName; }
    public void setAssetName(String assetName) { this.assetName = assetName; }
    public String getSerialNumber() { return serialNumber; }
    public void setSerialNumber(String serialNumber) { this.serialNumber = serialNumber; }
    public LocalDate getAssignmentDate() { return assignmentDate; }
    public void setAssignmentDate(LocalDate assignmentDate) { this.assignmentDate = assignmentDate; }
    public LocalDate getReturnDate() { return returnDate; }
    public void setReturnDate(LocalDate returnDate) { this.returnDate = returnDate; }
    public String getCondition() { return condition; }
    public void setCondition(String condition) { this.condition = condition; }
}
