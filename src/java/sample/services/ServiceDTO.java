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
    private String price;
    private String status;

    public ServiceDTO() {
    }

    public ServiceDTO(String serviceName) {
        this.serviceName = serviceName;
    }

    public ServiceDTO(String serviceID, String serviceName) {
        this.serviceID = serviceID;
        this.serviceName = serviceName;
    }
 
    public ServiceDTO(String serviceID, String serviceName, String image,  String price, String status) {
        this.serviceID = serviceID;
        this.serviceName = serviceName;
        this.image = image;
        
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

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
     
}
