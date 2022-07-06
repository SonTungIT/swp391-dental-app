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
public class ScheduleDTO {

    private String scheduleID;
    private String doctorID;
    private String slotID;
    private String dayWork;
    private boolean status;

    public ScheduleDTO() {
    }

    public ScheduleDTO(String doctorID, String dayWork) {
        this.doctorID = doctorID;
        this.dayWork = dayWork;
    }

    public ScheduleDTO(String scheduleID, String doctorID, String slotID, String dayWork, boolean status) {
        this.scheduleID = scheduleID;
        this.doctorID = doctorID;
        this.slotID = slotID;
        this.dayWork = dayWork;
        this.status = status;
    }

    public String getScheduleID() {
        return scheduleID;
    }

    public void setScheduleID(String scheduleID) {
        this.scheduleID = scheduleID;
    }

    public String getDoctorID() {
        return doctorID;
    }

    public void setDoctorID(String doctorID) {
        this.doctorID = doctorID;
    }

    public String getSlotID() {
        return slotID;
    }

    public void setSlotID(String slotID) {
        this.slotID = slotID;
    }

    public String getDayWork() {
        return dayWork;
    }

    public void setDayWork(String dayWork) {
        this.dayWork = dayWork;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

}
