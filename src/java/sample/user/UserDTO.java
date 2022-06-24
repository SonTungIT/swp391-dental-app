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
public class UserDTO {

    private String userID;
    private String password;
    private String fullName;
    private String roleID;
    private String gender;
    private String address;
    private String image;
    private Date birthday;
    private String email;
    private String phone;
    private boolean status;

    public UserDTO() {
    }

    public UserDTO(String fullName) {
        this.fullName = fullName;
    }
    
    public UserDTO(String fullName, String gender) {
        this.fullName = fullName;
        this.gender = gender;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public UserDTO(String userID, String password, String fullName, String roleID, String gender, String address, String image, Date birthday, String email, String phone, boolean status) {
        this.userID = userID;
        this.password = password;
        this.fullName = fullName;
        this.roleID = roleID;
        this.gender = gender;
        this.address = address;
        this.image = image;
        this.birthday = birthday;
        this.email = email;
        this.phone = phone;
        this.status = status;
    }
    public UserDTO(String userID,  String fullName,  String gender,   String email, String phone, boolean status) {
        this.userID = userID;        
        this.fullName = fullName;        
        this.gender = gender;       
        this.email = email;
        this.phone = phone;
        this.status = status;
    }
    
    public UserDTO(String userID,  String fullName, String gender, String address, String image, Date birthday, String email, String phone, boolean status) {
        this.userID = userID;        
        this.fullName = fullName;     
        this.gender = gender;
        this.address = address;
        this.image = image;
        this.birthday = birthday;
        this.email = email;
        this.phone = phone;
        this.status = status;
    }

}
