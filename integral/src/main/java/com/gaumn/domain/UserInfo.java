package com.gaumn.domain;

/**
 * @ Creat by gaumn on  2020/9/27
 **/
public class UserInfo {
    private  int id;
    private  String t_name;
    private  String UserName;
    private  String UserPwd;
    private  int locked;
    private  String salt;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getT_name() {
        return t_name;
    }

    public void setT_name(String t_name) {
        this.t_name = t_name;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String userName) {
        UserName = userName;
    }

    public String getUserPwd() {
        return UserPwd;
    }

    public void setUserPwd(String userPwd) {
        UserPwd = userPwd;
    }

    public int getLocked() {
        return locked;
    }

    public void setLocked(int locked) {
        this.locked = locked;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    @Override
    public String toString() {
        return "UserInfo{" +
                "id=" + id +
                ", t_name='" + t_name + '\'' +
                ", UserName='" + UserName + '\'' +
                ", UserPwd='" + UserPwd + '\'' +
                ", locked=" + locked +
                ", salt='" + salt + '\'' +
                '}';
    }
}
