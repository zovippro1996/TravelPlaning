/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

import java.sql.Date;
import java.util.List;

/**
 *
 * @author CREAT10N
 */
public class Journey {
    private int ID;
    private int userID;
    private List<Location> listLocation;
    private List<String> listCountry;
    private List<String> listCity;
    private double budget;
    private Date deployDate;
    private String type;
    private int duration;

    /**
     * @return the ID
     */
    public int getID() {
        return ID;
    }

    /**
     * @param ID the ID to set
     */
    public void setID(int ID) {
        this.ID = ID;
    }

    /**
     * @return the userID
     */
    public int getUserID() {
        return userID;
    }

    /**
     * @param userID the userID to set
     */
    public void setUserID(int userID) {
        this.userID = userID;
    }

    /**
     * @return the listLocation
     */
    public List<Location> getListLocation() {
        return listLocation;
    }

    /**
     * @param listLocation the listLocation to set
     */
    public void setListLocation(List<Location> listLocation) {
        this.listLocation = listLocation;
    }

    /**
     * @return the listCountry
     */
    public List<String> getListCountry() {
        return listCountry;
    }

    /**
     * @param listCountry the listCountry to set
     */
    public void setListCountry(List<String> listCountry) {
        this.listCountry = listCountry;
    }

    /**
     * @return the listCity
     */
    public List<String> getListCity() {
        return listCity;
    }

    /**
     * @param listCity the listCity to set
     */
    public void setListCity(List<String> listCity) {
        this.listCity = listCity;
    }

    /**
     * @return the budget
     */
    public double getBudget() {
        return budget;
    }

    /**
     * @param budget the budget to set
     */
    public void setBudget(double budget) {
        this.budget = budget;
    }

    /**
     * @return the deployDate
     */
    public Date getDeployDate() {
        return deployDate;
    }

    /**
     * @param deployDate the deployDate to set
     */
    public void setDeployDate(Date deployDate) {
        this.deployDate = deployDate;
    }

    /**
     * @return the type
     */
    public String getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * @return the duration
     */
    public int getDuration() {
        return duration;
    }

    /**
     * @param duration the duration to set
     */
    public void setDuration(int duration) {
        this.duration = duration;
    }
    
    
}
