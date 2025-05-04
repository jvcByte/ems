package com.example.ems.entity;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "Resignations")
public class Resignation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long resignationId;

    @ManyToOne
    @JoinColumn(name = "employee_id")
    private Employee employee;

    private LocalDate resignationDate;
    private LocalDate lastWorkingDay;
    private String reason;
    private String exitInterviewNotes;
    private Boolean rehireable;
    private String handoverNotes;

    public Long getResignationId() { return resignationId; }
    public void setResignationId(Long resignationId) { this.resignationId = resignationId; }
    public Employee getEmployee() { return employee; }
    public void setEmployee(Employee employee) { this.employee = employee; }
    public LocalDate getResignationDate() { return resignationDate; }
    public void setResignationDate(LocalDate resignationDate) { this.resignationDate = resignationDate; }
    public LocalDate getLastWorkingDay() { return lastWorkingDay; }
    public void setLastWorkingDay(LocalDate lastWorkingDay) { this.lastWorkingDay = lastWorkingDay; }
    public String getReason() { return reason; }
    public void setReason(String reason) { this.reason = reason; }
    public String getExitInterviewNotes() { return exitInterviewNotes; }
    public void setExitInterviewNotes(String exitInterviewNotes) { this.exitInterviewNotes = exitInterviewNotes; }
    public Boolean getRehireable() { return rehireable; }
    public void setRehireable(Boolean rehireable) { this.rehireable = rehireable; }
    public String getHandoverNotes() { return handoverNotes; }
    public void setHandoverNotes(String handoverNotes) { this.handoverNotes = handoverNotes; }
}
