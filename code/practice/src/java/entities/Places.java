/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;

public class Places implements Serializable {

    private String place;
    private String adress;
    private String longtitude;
    private String latitude;

    public Places(String place, String adress, String longtitude, String latitude) {
        this.place = place;
        this.adress = adress;
        this.longtitude = longtitude;
        this.latitude = latitude;
    }
      
    public String getPlace() {
        return place;
    }

    public String getAdress() {
        return adress;
    }

    public String getLongtitude() {
        return longtitude;
    }

    public String getLatitude() {
        return latitude;
    }

    @Override
    public String toString() {
        return "Places{" + "place=" + place + ", adress=" + adress + ", longtitude=" + longtitude + ", latitude=" + latitude + '}';
    }
    
    

}
