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
public class DoctorDTO extends UserDTO{
    private String categoryID; 
    private String categoryName;
    private String serviceID;
    private String serviceName;
    public DoctorDTO() {
    }

    public DoctorDTO(String fullName) {
        super(fullName);
    }
    
    public DoctorDTO( String userID, String fullName, String gender, String email, String phone,String categoryName, boolean status) {
        super(userID, fullName, gender, email, phone, status);
        this.categoryName = categoryName;
    }
    

    public DoctorDTO(String categoryID, String categoryName, String serviceID, String serviceName, String userID, String password, String fullName, String roleID, String gender, String address, String image, Date birthday, String email, String phone, boolean status) {
        super(userID, password, fullName, roleID, gender, address, image, birthday, email, phone, status);
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.serviceID = serviceID;
        this.serviceName = serviceName;
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
    
    

}
