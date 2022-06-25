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
     
}
