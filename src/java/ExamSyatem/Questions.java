/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ExamSyatem;

import java.io.Serializable;
import java.util.logging.Logger;

/**
 *
 * @author mdism
 */
public class Questions implements Serializable {

    private int QId;
    private String Course;
    private String Qus;
    private String Option1;
    private String Option2;
    private String Option3;
    private String Option4;
    private String Answer;

    public Questions() {
    }

    public void flush() {
        Course = null;
        Qus = null;
        Option1 = null;
        Option2 = null;
        Option3 = null;
        Option4 = null;
        Answer = null;
    }

    public Questions(int QId, String Course, String Qus, String Option1, String Option2, String Option3, String Option4, String Answer) {
        this.QId = QId;
        this.Course = Course;
        this.Qus = Qus;
        this.Option1 = Option1;
        this.Option2 = Option2;
        this.Option3 = Option3;
        this.Option4 = Option4;
        this.Answer = Answer;
    }

    public Questions(int QId, String Course, String Qus, String Option1, String Answer) {
        this.QId = QId;
        this.Course = Course;
        this.Qus = Qus;
        this.Option1 = Option1;
        this.Answer = Answer;
    }

    public Questions(int QId, String Qus, String Option1, String Answer) {
        this.QId = QId;
        this.Qus = Qus;
        this.Option1 = Option1;
        this.Answer = Answer;
    }

    public String getCourse() {
        return Course;
    }

    public static Logger getLOG() {
        return LOG;
    }

    public void setCourse(String Course) {
        this.Course = Course;
    }

    public int getQId() {
        return QId;
    }

    public String getQus() {
        return Qus;
    }

    public String getOption1() {
        return Option1;
    }

    public String getOption2() {
        return Option2;
    }

    public String getOption3() {
        return Option3;
    }

    public String getOption4() {
        return Option4;
    }

    public String getAnswer() {
        return Answer;
    }
    private static final Logger LOG = Logger.getLogger(Questions.class.getName());

    public void setQId(int QId) {
        this.QId = QId;
    }

    public void setQus(String Qus) {
        this.Qus = Qus;
    }

    public void setOption1(String Option1) {
        this.Option1 = Option1;
    }

    public void setOption2(String Option2) {
        this.Option2 = Option2;
    }

    public void setOption3(String Option3) {
        this.Option3 = Option3;
    }

    public void setOption4(String Option4) {
        this.Option4 = Option4;
    }

    public final void setAnswer(String Answer) {
        if (null == Answer) {
            Answer = getOption4();
        } else {
            switch (Answer) {
                case "1":
                    Answer = getOption1();
                    break;
                case "2":
                    Answer = getOption2();
                    break;
                case "3":
                    Answer = getOption3();
                    break;
                default:
                    Answer = getOption4();
                    break;
            }
        }
        this.Answer = Answer;
    }

    @Override
    public String toString() {
        return "Questions{" + "QId=" + QId + ", Qus=" + Qus + ", Option1=" + Option1 + ", Option2=" + Option2 + ", Option3=" + Option3 + ", Option4=" + Option4 + ", Answer=" + Answer + '}';
    }

}
