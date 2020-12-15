package com.gaumn.dao;

import com.gaumn.domain.UserInfo;

/**
 * @ Creat by gaumn on  2020/9/27
 **/
public interface UserInfoDao extends CommonDao<UserInfo,Integer>{
    /**
     * 按用户名查找（登录时使用）
     */
    public  UserInfo getBytName(String t_name);
    public  UserInfo insertRegister(UserInfo userInfo);
}
