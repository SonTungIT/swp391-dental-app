/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

/**
 *
 * @author Admin
 */
public class UserError {

    private String UserIDError;
    private String passwordError;
    private String EmailError;
    private String RoleIDError;
    private String fullNameError;
    private String phoneError;
    private String DuplicateError;
    private String AddressError;

    public UserError() {
        UserIDError = "";
        passwordError = "";
        EmailError = "";
        RoleIDError = "";
        fullNameError = "";
        phoneError = "";
        DuplicateError = "";
        AddressError = "";
    }

    public UserError(String UserIDError, String passwordError, String EmailError, String RoleIDError, String fullNameError, String phoneError, String DuplicateError, String AddressError) {
        this.UserIDError = UserIDError;
        this.passwordError = passwordError;
        this.EmailError = EmailError;
        this.RoleIDError = RoleIDError;
        this.fullNameError = fullNameError;
        this.phoneError = phoneError;
        this.DuplicateError = DuplicateError;
        this.AddressError = AddressError;
    }

    
    public String getAddressError() {
        return AddressError;
    }

    public void setAddressError(String AddressError) {
        this.AddressError = AddressError;
    }

   

    public String getDuplicateError() {
        return DuplicateError;
    }

    public void setDuplicateError(String DuplicateError) {
        this.DuplicateError = DuplicateError;
    }

    public String getUserIDError() {
        return UserIDError;
    }

    public void setUserIDError(String UserIDError) {
        this.UserIDError = UserIDError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public String getEmailError() {
        return EmailError;
    }

    public void setEmailError(String EmailError) {
        this.EmailError = EmailError;
    }

    public String getRoleIDError() {
        return RoleIDError;
    }

    public void setRoleIDError(String RoleIDError) {
        this.RoleIDError = RoleIDError;
    }

    public String getFullNameError() {
        return fullNameError;
    }

    public void setFullNameError(String fullNameError) {
        this.fullNameError = fullNameError;
    }

    public String getPhoneError() {
        return phoneError;
    }

    public void setPhoneError(String phoneError) {
        this.phoneError = phoneError;
    }

}
