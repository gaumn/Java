package com.gaumn.utils;

import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.util.DigestUtils;

import java.util.Random;
import java.util.UUID;

/**
 * @ Creat by gaumn on  2021/1/17
 **/
public class SaltUtils {
    //摘要算法
    private static final String MD5_HASH = "MD5";
    //加密次数
    private static final int HASH_ITERATIONS=1;
    public static String getSalt(int n){
        char[] chars = ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" +
                "1234567890!@#$%^&*()_+").toCharArray();
        StringBuilder sb = new StringBuilder();
        for(int i = 0; i < n; i++){
            //Random().nextInt()返回值为[0,n)
            char aChar = chars[new Random().nextInt(chars.length)];
            sb.append(aChar);
        }
        return sb.toString();
    }
    /**
     * 密码加密，采用shiro框架里的SimpleHash算法
     * 通过MD5算法+salt来加密，加密三次
     * @param pass 原始密码
     * @param salt 盐值
     * @return 加密后的摘要
     */
    public static String encoderPassword(String pass,String salt){
        Object object=new SimpleHash(MD5_HASH,pass,salt,HASH_ITERATIONS);
        return object.toString();
    }


}

