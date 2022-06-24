/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.booking;

import sample.user.DoctorDTO;

/**
 *
 * @author QUANG VAN
 */
public class ScheduleDTO {
    private String scheduleID;
    private DoctorDTO doctorID;
    private SlotDTO slotID;
    private String  status;

    public ScheduleDTO(String scheduleID, DoctorDTO doctorID, SlotDTO slotID, String status) {
        this.scheduleID = scheduleID;
        this.doctorID = doctorID;
        this.slotID = slotID;
        this.status = status;
    }

    public ScheduleDTO() {
    }

    public String getScheduleID() {
        return scheduleID;
    }

    public void setScheduleID(String scheduleID) {
        this.scheduleID = scheduleID;
    }

    public DoctorDTO getDoctorID() {
        return doctorID;
    }

    public void setDoctorID(DoctorDTO doctorID) {
        this.doctorID = doctorID;
    }

    public SlotDTO getSlotID() {
        return slotID;
    }

    public void setSlotID(SlotDTO slotID) {
        this.slotID = slotID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
