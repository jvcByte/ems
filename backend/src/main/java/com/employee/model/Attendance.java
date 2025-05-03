package com.employee.model;

import jakarta.persistence.*;

import java.util.Date;

@Entity
@Table(name = "attendance")
public class Attendance {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "employee_id", nullable = false)
    private Employee employee;

    @Column(nullable = false)
    private Date date;

    @Column(nullable = false)
    private Date checkInTime;

    @Column(nullable = true)
    private Date checkOutTime;

    @Column(nullable = false)
    private String status; // Present, Late, Absent

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Employee getEmployee() { return employee; }
    public void setEmployee(Employee employee) { this.employee = employee; }

    public Date getDate() { return date; }
    public void setDate(Date date) { this.date = date; }

    public Date getCheckInTime() { return checkInTime; }
    public void setCheckInTime(Date checkInTime) { this.checkInTime = checkInTime; }

    public Date getCheckOutTime() { return checkOutTime; }
    public void setCheckOutTime(Date checkOutTime) { this.checkOutTime = checkOutTime; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
