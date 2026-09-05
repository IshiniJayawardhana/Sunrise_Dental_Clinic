package com.sunriseDental.model;

import java.io.Serializable;

/**
 * Plain data holder for a single appointment record.
 * Swap the in-memory AppointmentStore for a JDBC-backed DAO once a real
 * database is wired up; this class can stay as-is (or map 1:1 to a table row).
 */
public class Appointment implements Serializable {

    private static final long serialVersionUID = 1L;

    private String appointmentId;
    private String patientName;
    private String address;
    private String contact;
    private String dentist;
    private String treatmentType;
    private String appDate;   // yyyy-MM-dd (matches <input type="date">)
    private String appTime;   // HH:mm     (matches <input type="time">)
    private String status;    // Confirmed | Pending | Cancelled

    public Appointment() {
    }

    public Appointment(String appointmentId, String patientName, String address, String contact,
                        String dentist, String treatmentType, String appDate, String appTime, String status) {
        this.appointmentId = appointmentId;
        this.patientName = patientName;
        this.address = address;
        this.contact = contact;
        this.dentist = dentist;
        this.treatmentType = treatmentType;
        this.appDate = appDate;
        this.appTime = appTime;
        this.status = status;
    }

    public String getAppointmentId() { return appointmentId; }
    public void setAppointmentId(String appointmentId) { this.appointmentId = appointmentId; }

    public String getPatientName() { return patientName; }
    public void setPatientName(String patientName) { this.patientName = patientName; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getContact() { return contact; }
    public void setContact(String contact) { this.contact = contact; }

    public String getDentist() { return dentist; }
    public void setDentist(String dentist) { this.dentist = dentist; }

    public String getTreatmentType() { return treatmentType; }
    public void setTreatmentType(String treatmentType) { this.treatmentType = treatmentType; }

    public String getAppDate() { return appDate; }
    public void setAppDate(String appDate) { this.appDate = appDate; }

    public String getAppTime() { return appTime; }
    public void setAppTime(String appTime) { this.appTime = appTime; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
