/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;


public class usersDiary implements Serializable {

    private String markOne;
    private String weekThree;
    private String lastUpdate;
    private String userName;
    private String userTheme;
    private String weekOne;
    private String weekTwo;
    private String markTwo;
    private String markThree;
    private String sgroup;

    public usersDiary(String markOne, String weekThree, String lastUpdate, String userName, String userTheme, String weekOne, String weekTwo, String markTwo, String markThree, String sgroup) {
        this.markOne = markOne;
        this.weekThree = weekThree;
        this.lastUpdate = lastUpdate;
        this.userName = userName;
        this.userTheme = userTheme;
        this.weekOne = weekOne;
        this.weekTwo = weekTwo;
        this.markTwo = markTwo;
        this.markThree = markThree;
        this.sgroup = sgroup;
    }

    public usersDiary(String markOne, String weekThree, String lastUpdate, String userName, String userTheme, String weekOne, String weekTwo, String markTwo, String markThree) {
        this.markOne = markOne;
        this.weekThree = weekThree;
        this.lastUpdate = lastUpdate;
        this.userName = userName;
        this.userTheme = userTheme;
        this.weekOne = weekOne;
        this.weekTwo = weekTwo;
        this.markTwo = markTwo;
        this.markThree = markThree;
    }
    
    

    

    public String getMarkOne() {
        return markOne;
    }

    public String getWeekThree() {
        return weekThree;
    }

    public String getLastUpdate() {
        return lastUpdate;
    }

    public String getUserName() {
        return userName;
    }

    public String getUserTheme() {
        return userTheme;
    }

    public String getWeekOne() {
        return weekOne;
    }

    public String getWeekTwo() {
        return weekTwo;
    }

    public String getMarkTwo() {
        return markTwo;
    }

    public String getMarkThree() {
        return markThree;
    }

    public String getSgroup() {
        return sgroup;
    }

    @Override
    public String toString() {
        return "usersDiary{" + "markOne=" + markOne + ", weekThree=" + weekThree + ", lastUpdate=" + lastUpdate + ", userName=" + userName + ", userTheme=" + userTheme + ", weekOne=" + weekOne + ", weekTwo=" + weekTwo + ", markTwo=" + markTwo + ", markThree=" + markThree + ", sgroup=" + sgroup + '}';
    }

    
    
}
