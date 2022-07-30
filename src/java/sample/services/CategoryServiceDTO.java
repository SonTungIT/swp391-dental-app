/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.services;

/**
 *
 * @author QUANG VAN
 */
public class CategoryServiceDTO {
    private String categoryID;
    private String categoryName;
    private boolean status;
    private String serviceID;
    private String serviceName;

    public CategoryServiceDTO() {
    }

    public CategoryServiceDTO(String categoryID, String categoryName, boolean status) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.status = status;
    }

    public CategoryServiceDTO(String categoryID, String categoryName) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
    }

    public CategoryServiceDTO(String categoryName) {
        this.categoryName = categoryName;
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

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

   

    public CategoryServiceDTO(String categoryID, String categoryName, String serviceID, String serviceName, boolean status) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.serviceID = serviceID;
        this.serviceName = serviceName;
        this.status = status;
    }

    
    
    
    
}
