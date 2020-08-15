package com.kaiv.model;

import java.io.Serializable;

public enum UserProfileType implements Serializable{

    USER_ACCESS("USER_ACCESS"),
    ADMINISTRATOR_ACCESS("ADMINISTRATOR_ACCESS");

    String userProfileType;

    private UserProfileType(String userProfileType){
        this.userProfileType = userProfileType;
    }

    public String getUserProfileType(){
        return userProfileType;
    }

}