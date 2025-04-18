package com.employee.controller;

import com.employee.model.Attendance;
import com.employee.service.AttendanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/api/attendance")
public class AttendanceController {
    @Autowired
    private AttendanceService attendanceService;

    @PostMapping
    public Attendance markAttendance(@RequestBody Attendance attendance) {
        return attendanceService.markAttendance(attendance);
    }

    @GetMapping("/employee/{employeeId}")
    public List<Attendance> getEmployeeAttendance(@PathVariable Long employeeId) {
        return attendanceService.getEmployeeAttendance(employeeId);
    }

    @GetMapping("/employee/{employeeId}/date-range")
    public List<Attendance> getEmployeeAttendanceByDateRange(
            @PathVariable Long employeeId,
            @RequestParam("start") Date startDate,
            @RequestParam("end") Date endDate) {
        return attendanceService.getEmployeeAttendanceByDateRange(employeeId, startDate, endDate);
    }
}
