/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data;

/**
 *
 * @author Steven
 */
public class Users {
    private long userID;
    private String userPass;
    private String userName;
    private String email;

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }
    
    public Users() {
    
}

    public void setUserID(long userID) {
        this.userID = userID;
    }


    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public long getUserID() {
        return userID;
    }


    public String getUserPass() {
        return userPass;
    }

    public String getUserName() {
        return userName;
    }

    public Users(long userID,String userName, String userPass) {
        this.userID = userID;
        this.userPass = userPass;
        this.userName = userName;
    }
}
