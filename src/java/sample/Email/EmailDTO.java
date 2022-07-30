/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.Email;

/**
 *
 * @author Admin
 */
public class EmailDTO {
     private String from;
    private String to;
    private String fromPassword;
    private String content;
    private String subject;

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getFromPassword() {
        return fromPassword;
    }

    public void setFromPassword(String fromPassword) {
        this.fromPassword = fromPassword;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public EmailDTO() {
    }

    public EmailDTO(String from, String to, String fromPassword, String content, String subject) {
        this.from = from;
        this.to = to;
        this.fromPassword = fromPassword;
        this.content = content;
        this.subject = subject;
    }

}

