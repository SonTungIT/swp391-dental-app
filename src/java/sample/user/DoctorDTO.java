/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.user;

import java.sql.Date;

/**
 *
 * @author Xqy
 */
public class DoctorDTO extends UserDTO {

    private String categoryID;
    private String categoryName;
    private String serviceID;
    private String serviceName;
    private String aboutDR;
    private String shift;

    public DoctorDTO() {
    }

    public DoctorDTO(String categoryName, String shift, String userID, String password, String fullName, String roleID, String gender, String address, String image, Date birthday, String email, String phone, boolean status) {
        super(userID, password, fullName, roleID, gender, address, image, birthday, email, phone, status);
        this.categoryName = categoryName;
        this.shift = shift;
    }

    public DoctorDTO(String doctorID, String doctorName, String image, String categoryName, String shift) {
        super(doctorID, doctorName, image);
        this.categoryName = categoryName;
        this.shift = shift;
    }

    public DoctorDTO(String fullName) {
        super(fullName);
    }

    public DoctorDTO(String userID, String password, String fullName, String roleID, String gender, String address, String image, Date birthday, String email, String phone, boolean status) {
        super(userID, password, fullName, roleID, gender, address, image, birthday, email, phone, status);
    }

    public DoctorDTO(String categoryID, String aboutDR, String shift) {
        this.categoryID = categoryID;
        this.aboutDR = aboutDR;
        this.shift = shift;
    }

    public DoctorDTO(String categoryID, String categoryName, String serviceID, String serviceName, String aboutDR, String userID, String password, String fullName, String roleID, String gender, String address, String image, Date birthday, String email, String phone, String shift, boolean status) {
        super(userID, password, fullName, roleID, gender, address, image, birthday, email, phone, status);
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.serviceID = serviceID;
        this.serviceName = serviceName;
        this.aboutDR = aboutDR;
        this.shift = shift;
    }

    public DoctorDTO(String categoryID, String userID, String password, String fullName, String roleID, String gender, String address, String image, Date birthday, String email, String phone, boolean status) {
        super(userID, password, fullName, roleID, gender, address, image, birthday, email, phone, status);
        this.categoryID = categoryID;
    }

    public DoctorDTO(String userID, String fullName, String gender, String email, String phone, String categoryName, String shift, boolean status) {
        super(userID, fullName, gender, email, phone, status);
        this.categoryName = categoryName;
        this.shift = shift;
    }

    public DoctorDTO(String categoryID, String categoryName, String serviceID, String serviceName, String userID, String password, String fullName, String roleID, String gender, String address, String image, Date birthday, String email, String phone, boolean status) {
        super(userID, password, fullName, roleID, gender, address, image, birthday, email, phone, status);
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.serviceID = serviceID;
        this.serviceName = serviceName;
    }
    public DoctorDTO(String userID, String fullName, String image , String categoryID  ){
        super(userID, fullName, image);
        this.categoryID = categoryID;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
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

    public String getShift() {
        return shift;
    }

    public void setShift(String shift) {
        this.shift = shift;
    }

    public String getAboutDR() {
        return aboutDR;
    }

    public void setAboutDR(String aboutDR) {
        this.aboutDR = aboutDR;
    }

}
