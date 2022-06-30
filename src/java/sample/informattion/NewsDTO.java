/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.informattion;

import java.util.Date;



/**
 *
 * @author QUANG VAN
 */
public class NewsDTO {

    private int categoryId;
    private String title1;
    private String context1;
    private String image1;
    private String title2;
    private String context2;
    private String image2;
    private String title3;
    private String context3;
    private String image3;
    private String title4;
    private String context4;
    private String image4;
    private String title5;
    private String context5;
    private String image5;
    private Date timepost;
    private int idDetai;
    private String allcontext;

    public NewsDTO() {
    }

    public NewsDTO(int categoryId, String title1, String context1, String image1, String title2, String context2, String image2, String title3, String context3, String image3, String title4, String context4, String image4, String title5, String context5, String image5, Date timepost,int idDetai,String allcontext) {
        this.categoryId = categoryId;
        this.title1 = title1;
        this.context1 = context1;
        this.image1 = image1;
        this.title2 = title2;
        this.context2 = context2;
        this.image2 = image2;
        this.title3 = title3;
        this.context3 = context3;
        this.image3 = image3;
        this.title4 = title4;
        this.context4 = context4;
        this.image4 = image4;
        this.title5 = title5;
        this.context5 = context5;
        this.image5 = image5;
        this.timepost = timepost;
        this.idDetai = idDetai;
        this.allcontext = allcontext;
    }

    public String getAllcontext() {
        return allcontext;
    }

    public void setAllcontext(String allcontext) {
        this.allcontext = allcontext;
    }
 
    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getIdDetai() {
        return idDetai;
    }

    public void setIdDetai(int idDetai) {
        this.idDetai = idDetai;
    }

    

    public String getTitle1() {
        return title1;
    }

    public void setTitle1(String title1) {
        this.title1 = title1;
    }

    public String getContext1() {
        return context1;
    }

    public void setContext1(String context1) {
        this.context1 = context1;
    }

    public String getImage1() {
        return image1;
    }

    public void setImage1(String image1) {
        this.image1 = image1;
    }

    public String getTitle2() {
        return title2;
    }

    public void setTitle2(String title2) {
        this.title2 = title2;
    }

    public String getContext2() {
        return context2;
    }

    public void setContext2(String context2) {
        this.context2 = context2;
    }

    public String getImage2() {
        return image2;
    }

    public void setImage2(String image2) {
        this.image2 = image2;
    }

    public String getTitle3() {
        return title3;
    }

    public void setTitle3(String title3) {
        this.title3 = title3;
    }

    public String getContext3() {
        return context3;
    }

    public void setContext3(String context3) {
        this.context3 = context3;
    }

    public String getImage3() {
        return image3;
    }

    public void setImage3(String image3) {
        this.image3 = image3;
    }

    public String getTitle4() {
        return title4;
    }

    public void setTitle4(String title4) {
        this.title4 = title4;
    }

    public String getContext4() {
        return context4;
    }

    public void setContext4(String context4) {
        this.context4 = context4;
    }

    public String getImage4() {
        return image4;
    }

    public void setImage4(String image4) {
        this.image4 = image4;
    }

    public String getTitle5() {
        return title5;
    }

    public void setTitle5(String title5) {
        this.title5 = title5;
    }

    public String getContext5() {
        return context5;
    }

    public void setContext5(String context5) {
        this.context5 = context5;
    }

    public String getImage5() {
        return image5;
    }

    public void setImage5(String image5) {
        this.image5 = image5;
    }

    public Date getTimepost() {
        return timepost;
    }

    public void setTimepost(Date timepost) {
        this.timepost = timepost;
    }

    @Override
    public String toString() {
        return "NewsDTO{" + "categoryId=" + categoryId + ", title1=" + title1 + ", context1=" + context1 + ", image1=" + image1 + ", title2=" + title2 + ", context2=" + context2 + ", image2=" + image2 + ", title3=" + title3 + ", context3=" + context3 + ", image3=" + image3 + ", title4=" + title4 + ", context4=" + context4 + ", image4=" + image4 + ", title5=" + title5 + ", context5=" + context5 + ", image5=" + image5 + ", timepost=" + timepost + ", idDetai=" + idDetai + ", allcontext=" + allcontext + '}';
    }

    

    

     
}
