/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.booking;

import java.sql.Date;

/**
 *
 * @author QUANG VAN
 */
public class BookingDTO {

    private String bookingID;
    private String patientID;
    private String doctorID;
    private String patientName;
    private String patientGender;
    private String serviceID;
    private String serviceName;
    private String doctorName;
    private Date dateBooking;
    private String timeBooking;
    private String slotName;
    private String slotTime;
    private String status;

    public BookingDTO() {
    }

    public BookingDTO(String bookingID, String serviceID, String serviceName, String doctorID, String doctorName, Date dateBooking, String timeBooking, String status) {
        this.bookingID = bookingID;
        this.serviceID = serviceID;
        this.serviceName = serviceName;
        this.doctorID = doctorID;
        this.doctorName = doctorName;
        this.dateBooking = dateBooking;
        this.timeBooking = timeBooking;
        this.status = status;
    }

    public BookingDTO(String bookingID, String patientName, String serviceName, Date dateBooking, String timeBooking, String status) {
        this.bookingID = bookingID;
        this.patientName = patientName;
        this.serviceName = serviceName;
        this.dateBooking = dateBooking;
        this.timeBooking = timeBooking;
        this.status = status;
    }



    public BookingDTO(String bookingID, String patientID, String serviceID, String doctorID, Date dateBooking, String timeBooking, String status) {
        this.bookingID = bookingID;
        this.patientID = patientID;
        this.serviceID = serviceID;
        this.doctorID = doctorID;
        this.dateBooking = dateBooking;
        this.timeBooking = timeBooking;
        this.status = status;
    }

    public BookingDTO(String bookingID, String patientName, String patientGender, String serviceName, String doctorName, Date dateBooking, String timeBooking, String slotName, String slotTime, String status) {

        this.bookingID = bookingID;
        this.patientName = patientName;
        this.patientGender = patientGender;
        this.serviceName = serviceName;
        this.doctorName = doctorName;
        this.dateBooking = dateBooking;
        this.timeBooking = timeBooking;
        this.slotName = slotName;
        this.slotTime = slotTime;
        this.status = status;
    }

    public BookingDTO(String bookingID, String patientID, String patientName, String patientGender, String serviceID, String serviceName, String doctorName, Date dateBooking, String timeBooking, String slotName, String slotTime, String status) {

        this.bookingID = bookingID;
        this.patientID = patientID;
        this.patientName = patientName;
        this.patientGender = patientGender;
        this.serviceID = serviceID;
        this.serviceName = serviceName;
        this.doctorName = doctorName;
        this.dateBooking = dateBooking;
        this.timeBooking = timeBooking;
        this.slotName = slotName;
        this.slotTime = slotTime;
        this.status = status;
    }
    public BookingDTO(String bookingID, String serviceName, String doctorName, Date dateBooking, String timeBooking) {
        this.bookingID = bookingID;
        this.serviceName = serviceName;
        this.doctorName = doctorName;
        this.dateBooking = dateBooking;
        this.timeBooking = timeBooking;
    }

    public String getDoctorID() {
        return doctorID;
    }

    public void setDoctorID(String doctorID) {
        this.doctorID = doctorID;
    }

    public String getBookingID() {
        return bookingID;
    }

    public void setBookingID(String bookingID) {
        this.bookingID = bookingID;
    }

    public String getPatientID() {
        return patientID;
    }

    public void setPatientID(String patientID) {
        this.patientID = patientID;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public String getPatientGender() {
        return patientGender;
    }

    public void setPatientGender(String patientGender) {
        this.patientGender = patientGender;
    }

    public String getServiceID() {
        return serviceID;
    }

    public void setServiceID(String serviceID) {
        this.serviceID = serviceID;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getDoctorName() {
        return doctorName;
    }

    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    public Date getDateBooking() {
        return dateBooking;
    }

    public void setDateBooking(Date dateBooking) {
        this.dateBooking = dateBooking;
    }

    public String getTimeBooking() {
        return timeBooking;
    }

    public void setTimeBooking(String timeBooking) {
        this.timeBooking = timeBooking;
    }

    public String getSlotName() {
        return slotName;
    }

    public void setSlotName(String slotName) {
        this.slotName = slotName;
    }

    public String getSlotTime() {
        return slotTime;
    }

    public void setSlotTime(String slotTime) {
        this.slotTime = slotTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
