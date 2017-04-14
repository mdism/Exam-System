/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ExamSyatem;

/**
 *
 * @author mdism
 */
public class Error {

    private boolean IncompliteQuestion;
    private boolean IncompliteStudetInfo;
    private boolean ErrorInInsertingData;
    private boolean DBNameNotFound;
    private String IQ_Massege;
    private String IS_Massege;
    private Boolean NoError;

    public Error() {
    }

    public boolean isIncompliteQuestion() {
        return IncompliteQuestion;
    }

    public void setErrorInInsertingData(boolean ErrorInInsertingData) {
        this.ErrorInInsertingData = ErrorInInsertingData;
    }

    public boolean isErrorInInsertingData() {
        return ErrorInInsertingData;
    }

    public boolean isIncompliteStudetInfo() {
        return IncompliteStudetInfo;
    }

    public String getIQ_Massege() {
        return IQ_Massege;
    }

    public String getIS_Massege() {
        return IS_Massege;
    }

    public void setNoError(Boolean NoError) {
        this.NoError = NoError;
    }

    public Boolean getNoError() {
        chkError();
        return NoError;
    }

    public void setIncompliteQuestion(boolean IncompliteQuestion) {
        this.IncompliteQuestion = IncompliteQuestion;

    }

    public void setDBNameNotFound(boolean DBNameNotFound) {
        this.DBNameNotFound = DBNameNotFound;
    }

    public boolean isDBNameNotFound() {
        return DBNameNotFound;
    }

    public void setIncompliteStudetInfo(boolean IncompliteStudetInfo) {
        this.IncompliteStudetInfo = IncompliteStudetInfo;
    }

    public void setIQ_Massege(String IQ_Massege) {
        this.IQ_Massege = IQ_Massege;
    }

    public void setIS_Massege(String IS_Massege) {
        this.IS_Massege = IS_Massege;
    }

    void chkError() {
        this.NoError = IncompliteQuestion == false && IncompliteStudetInfo == false && ErrorInInsertingData == false
                && DBNameNotFound == false;
    }

    @Override
    public String toString() {
        return "Error{" + "IncompliteQuestion=" + IncompliteQuestion + ", IncompliteStudetInfo=" + IncompliteStudetInfo + ", ErrorInInsertingData=" + ErrorInInsertingData + ", DBNameNotFound=" + DBNameNotFound + ", IQ_Massege=" + IQ_Massege + ", IS_Massege=" + IS_Massege + ", NoError=" + NoError + '}';
    }
    

}
