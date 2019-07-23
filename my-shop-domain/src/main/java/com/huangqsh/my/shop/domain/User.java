package com.huangqsh.my.shop.domain;

import java.io.Serializable;

public class User implements Serializable {
    private String userName;
    private String password;
    private String email;

    //是否记住密码
    private boolean isRemamber;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isRemamber() {
        return isRemamber;
    }

    public void setRemamber(boolean remamber) {
        isRemamber = remamber;
    }

    @Override
    public String toString() {
        return "User{" +
                "userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
