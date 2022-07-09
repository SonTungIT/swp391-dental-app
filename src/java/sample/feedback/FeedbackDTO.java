/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.feedback;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author dangk
 */
public class FeedbackDTO {
    private String feedbackID;
    private String patientID;
    private String bookingID;
    private String comment;
    private Date dateFeedback;
    private String timeFeedback ;
    private String patientName;
    private String doctorName;
    private String serviceName;
    private String image;
    private boolean status;
    private int rating;

    public FeedbackDTO() {
        this.feedbackID = "";
        this.patientID = "";
        this.bookingID = "";
        this.comment = "";
        this.dateFeedback = null;
        this.timeFeedback = "";
        this.status = false;
        this.patientName="";
        this.doctorName="";
        this.serviceName="";
        this.image="";
        this.rating=0;
    }

    public FeedbackDTO(String feedbackID, String patientID, String bookingID, String comment, Date dateFeedback, String timeFeedback, boolean status) {
        this.feedbackID = feedbackID;
        this.patientID = patientID;
        this.bookingID = bookingID;
        this.comment = comment;
        this.dateFeedback = dateFeedback;
        this.timeFeedback = timeFeedback;
        this.status = status;
    }

    public FeedbackDTO(String feedbackID, String bookingID, String patientName, String doctorName, String serviceName, String comment, Date dateFeedback, boolean status,int rating) {
        this.feedbackID = feedbackID;
        this.bookingID = bookingID;
        this.comment = comment;
        this.dateFeedback = dateFeedback;
        this.patientName = patientName;
        this.doctorName = doctorName;
        this.serviceName = serviceName;
        this.status = status;
        this.rating= rating;
    }

    public FeedbackDTO(String comment, Date dateFeedback, String patientName, String image, boolean status) {
        this.comment = comment;
        this.dateFeedback = dateFeedback;
        this.patientName = patientName;
        this.image = image;
        this.status = status;
    }

    public FeedbackDTO(String comment, Date dateFeedback, String patientName, String doctorName, String serviceName, String image, boolean status , int rating) {
        this.comment = comment;
        this.dateFeedback = dateFeedback;
        this.patientName = patientName;
        this.doctorName = doctorName;
        this.serviceName = serviceName;
        this.image = image;
        this.status = status;
        this.rating = rating;
    }
    
    public FeedbackDTO(String feedbackID, String patientID, String bookingID, String comment, Date dateFeedback, String timeFeedback, boolean status, int rating) {
        this.feedbackID = feedbackID;
        this.patientID = patientID;
        this.bookingID = bookingID;
        this.comment = comment;
        this.dateFeedback = dateFeedback;
        this.timeFeedback = timeFeedback;
        this.status = status;
        this.rating = rating;
    }
    


    public String getFeedbackID() {
        return feedbackID;
    }

    public void setFeedbackID(String feedbackID) {
        this.feedbackID = feedbackID;
    }

    public String getPatientID() {
        return patientID;
    }

    public void setPatientID(String patientID) {
        this.patientID = patientID;
    }

    public String getBookingID() {
        return bookingID;
    }

    public void setBookingID(String bookingID) {
        this.bookingID = bookingID;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getDateFeedback() {
        return dateFeedback;
    }

    public void setDateFeedback(Date dateFeedback) {
        this.dateFeedback = dateFeedback;
    }

    public String getTimeFeedback() {
        return timeFeedback;
    }

    public void setTimeFeedback(String timeFeedback) {
        this.timeFeedback = timeFeedback;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getPatientName() {
        return patientName;
    }

    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    public String getDoctorName() {
        return doctorName;
    }

    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    
    
   
    
    
}
