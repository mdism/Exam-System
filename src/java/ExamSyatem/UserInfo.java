/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ExamSyatem;

import java.time.LocalDate;
import java.time.LocalTime;

/**
 *
 * @author mdism
 */
public class UserInfo{

    private int id;
    private String Name;
    private String Mobile;
    private String Email;
    private String Password;
    private LastTime lasttime;
    private String SecLevel;
    private String course ;

    public UserInfo(int id, String Name, String Mobile, String Email, String Password, LastTime lasttime, String SecLevel, String course) {
        this.id = id;
        this.Name = Name;
        this.Mobile = Mobile;
        this.Email = Email;
        this.Password = Password;
        this.lasttime = lasttime;
        this.SecLevel = SecLevel;
        this.course = course;
    }
    public UserInfo(int id, String Name, String Mobile, String Email, String Password, LastTime lasttime) {
        this.id = id;
        this.Name = Name;
        this.Mobile = Mobile;
        this.Email = Email;
        this.Password = Password;
        this.lasttime = lasttime;
    }

    public UserInfo(int id, String Name, String Mobile, String Email, String Password, LastTime lasttime, String SecLevel) {
        this.id = id;
        this.Name = Name;
        this.Mobile = Mobile;
        this.Email = Email;
        this.Password = Password;
        this.lasttime = lasttime;
        this.SecLevel = SecLevel;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getCourse() {
        return course;
    }

    public UserInfo(int id, String Name, String Mobile) {
        this.id = id;
        this.Name = Name;
        this.Mobile = Mobile;
    }

    public UserInfo(int id, String Name, String Mobile, String Email, String Password) {
        this.id = id;
        this.Name = Name;
        this.Mobile = Mobile;
        this.Email = Email;
        this.Password = Password;
    }

    public UserInfo(int id, String Name) {
        this.id = id;
        this.Name = Name;
    }

    public UserInfo(String Name) {
        this.Name = Name;
    }

    public UserInfo() {
    }

    public void setSecLevel(String SecLevel) {
        this.SecLevel = SecLevel;
    }

    @Override
    public String toString() {
        return "UserInfo{" + "id=" + id + ", Name=" + Name + ", Mobile=" + Mobile + ", Email=" + Email + ", Password=" + Password + ", lasttime=" + lasttime + ", SecLevel=" + SecLevel + ", course=" + course + '}';
    }
    

    public LastTime getLasttime() {
        return lasttime;
    }

    public void setLasttime(String Str) {
//        String str1 = Str.substring(0, Str.indexOf(" "));
//        String str2 = Str.substring(Str.indexOf(" ")+1);
        LastTime lt = new LastTime();
        lt.setLastDateTime(Str);
        this.lasttime = lt;
//        this.lasttime = lasttime;
    }

    public String getSecLevel() {
        return SecLevel;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return Name;
    }

    public String getMobile() {
        return Mobile;
    }

    public String getEmail() {
        return Email;
    }

    public String getPassword() {
        return Password;
    }
    
    public void setId(int id) {
        this.id = id;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public void setMobile(String Mobile) {
        this.Mobile = Mobile;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

}
