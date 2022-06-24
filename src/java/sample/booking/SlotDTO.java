/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.booking;

/**
 *
 * @author QUANG VAN
 */
public class SlotDTO {
    private String slotID;
    private String slotName;
    private String slotTime;
    private String slotDateStart;
    private String slotDateEnd;
    private String status;

    public SlotDTO() {
    }

    public SlotDTO(String slotName, String slotTime) {
        this.slotName = slotName;
        this.slotTime = slotTime;
    }

    public SlotDTO(String slotID, String slotName, String slotTime, String slotDateStart, String slotDateEnd, String status) {
        this.slotID = slotID;
        this.slotName = slotName;
        this.slotTime = slotTime;
        this.slotDateStart = slotDateStart;
        this.slotDateEnd = slotDateEnd;
        this.status = status;
    }

    public String getSlotID() {
        return slotID;
    }

    public void setSlotID(String slotID) {
        this.slotID = slotID;
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

    public String getSlotDateStart() {
        return slotDateStart;
    }

    public void setSlotDateStart(String slotDateStart) {
        this.slotDateStart = slotDateStart;
    }

    public String getSlotDateEnd() {
        return slotDateEnd;
    }

    public void setSlotDateEnd(String slotDateEnd) {
        this.slotDateEnd = slotDateEnd;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
