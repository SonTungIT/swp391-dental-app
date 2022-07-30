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
public class ServiceDTO {
    private String serviceID;
    private String serviceName;
    private String image;
    private String categoryID;
    private int price;
    private String aboutSV;
    private String categoryName;
    private boolean status;

    public ServiceDTO() {
    }

    
    public ServiceDTO(String serviceID, String serviceName, String image, String categoryID, int price, boolean status) {
        this.serviceID = serviceID;
        this.serviceName = serviceName;
        this.image = image;
        this.categoryID = categoryID;
        this.price = price;
        this.status = status;
    }
    public ServiceDTO(String serviceName, String categoryName, int price) {
        this.serviceName = serviceName;
        this.categoryName = categoryName;
        this.price = price;
    }

    public ServiceDTO(String serviceID, String serviceName, String image, String categoryName, String aboutSV, boolean status) {
        this.serviceID = serviceID;
        this.serviceName = serviceName;
        this.image = image;
        this.categoryName = categoryName;
        this.aboutSV = aboutSV;
        this.status = status;
    }

    public ServiceDTO(String serviceID, String serviceName, String image, String categoryName, String aboutSV) {
        this.serviceID = serviceID;
        this.serviceName = serviceName;
        this.image = image;
        this.categoryName = categoryName;
        this.aboutSV = aboutSV;
    }
    public ServiceDTO(String serviceID, String serviceName, String image, String categoryID, int price, String aboutSV, boolean status) {
        this.serviceID = serviceID;
        this.serviceName = serviceName;
        this.image = image;
        this.categoryID = categoryID;
        this.price = price;
        this.aboutSV = aboutSV;
        this.status = status;
    }

    public ServiceDTO(String serviceName, int price) {
        this.serviceName = serviceName;
        this.price = price;
    }

    public ServiceDTO(String serviceID, boolean status) {
        this.serviceID = serviceID;
        this.status = status;
    }

    public ServiceDTO(String serviceID, String serviceName, String image, String categoryID, int price, String aboutSV) {
       this.serviceID = serviceID;
        this.serviceName = serviceName;
        this.image = image;
        this.categoryID = categoryID;
        this.price = price;
        this.aboutSV = aboutSV;
        
    }

    public ServiceDTO(String serviceID, String serviceName, String categoryID) {
        this.serviceID = serviceID;
        this.serviceName = serviceName;
        this.categoryID = categoryID;
    }
    
    public ServiceDTO(String serviceID, String serviceName, String image, boolean status) {
        this.serviceID = serviceID;
        this.serviceName = serviceName;
        this.image = image;
        this.status = status;
    }

    public ServiceDTO(String serviceName) {
         this.serviceName = serviceName;
    }
    
    public String getAboutSV() {
        return aboutSV;
    }

    public void setAboutSV(String aboutSV) {
        this.aboutSV = aboutSV;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
     
}
