/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

import java.util.*;

/**
 *
 * @author CREAT10N
 */
public class Journey {
    private int ID;
    private int userID;         
    private double budget;
    private String deployDate;
    private int duration;
    private String type;
    
    private List<Day> listDays;             // specified list of locations
                                            // based on which day to visit
                                            // day ith is at index i - 1
                                            // e.g day 1 is at index 0
    
    private String country;                 // destination country for the journey
    private List<String> listCity;          // list of cities visited in the journey
    private List<Integer> daysCity;         // number of days spent on each city

//    private List<String> listCountry;
//    private List<Location> listLocation;
    
    public Journey()
    {
        
    }
    
    public void computeBudget()
    {
        double totalBudget = 0;
        for (int i = 0; i < listDays.size(); ++i)
        {
            totalBudget += listDays.get(i).getTotalPrice();
        }
        this.budget = totalBudget;
    }
    
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
    public String getDeployDate() {
        return deployDate;
    }

    /**
     * @param deployDate the deployDate to set
     */
    public void setDeployDate(String deployDate) {
        this.deployDate = deployDate;
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
     * @return the listDays
     */
    public List<Day> getListDays() {
        return listDays;
    }

    /**
     * @param listDays the listDays to set
     */
    public void setListDays(List<Day> listDays) {
        this.listDays = listDays;
    }

    /**
     * @return the country
     */
    public String getCountry() {
        return country;
    }

    /**
     * @param country the country to set
     */
    public void setCountry(String country) {
        this.country = country;
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
     * @return the daysCity
     */
    public List<Integer> getDaysCity() {
        return daysCity;
    }

    /**
     * @param daysCity the daysCity to set
     */
    public void setDaysCity(List<Integer> daysCity) {
        this.daysCity = daysCity;
    }
}
