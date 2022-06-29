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
public class KnowledgeDTO {
    private int id;
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
    private Date timepost;

    public KnowledgeDTO() {
    }

    public KnowledgeDTO(int id, String title1, String context1, String image1, String title2, String context2, String image2, String title3, String context3, String image3, String title4, String context4, String image4, Date timepost) {
        this.id = id;
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
        this.timepost = timepost;
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

    public Date getTimepost() {
        return timepost;
    }

    public void setTimepost(Date timepost) {
        this.timepost = timepost;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "KnowledgeDTO{" + "id=" + id + ", title1=" + title1 + ", context1=" + context1 + ", image1=" + image1 + ", title2=" + title2 + ", context2=" + context2 + ", image2=" + image2 + ", title3=" + title3 + ", context3=" + context3 + ", image3=" + image3 + ", title4=" + title4 + ", context4=" + context4 + ", image4=" + image4 + ", timepost=" + timepost + '}';
    }

    
     
}
