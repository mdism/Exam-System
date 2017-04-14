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

public class LastTime {

    private String Date;
    private String Time;

    public LastTime(String Date, String Time) {
        this.Date = Date;
        this.Time = Time;
    }

    public LastTime(String Date) {
        this.Date = Date;
    }

    public LastTime() {
    }

    @Override
    public String toString() {
        return "LastLime{" + "Date=" + Date + ", Time=" + Time + '}';
    }

    public void setDate(String Date) {
        this.Date = Date;
    }

    public void setTime(String Time) {
        this.Time = Time;
    }

    public String getDate() {
        return Date;
    }

    public String getTime() {
        return Time;
    }

    public LastTime getLastDateTime() {
        LastTime temp = new LastTime();
        temp.Date = getDate();
        temp.Time = getTime();
        return temp;
    }

    public void setLastDateTime(String Date, String Time) {

        this.Date = getDate();
        this.Time = getTime();
    }
    public void setLastDateTime(LastTime temp) {

        this.Date = temp.getDate();
        this.Time = temp.getTime();
    }
    
        public void setLastDateTime(String Str) {
        String str1 = Str.substring(0, Str.indexOf(" "));
        String str2 = Str.substring(Str.indexOf(" ") + 1);
        setDate(str1);
        setTime(str2);
    }

}

