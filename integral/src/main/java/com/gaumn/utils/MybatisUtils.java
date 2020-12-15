package com.gaumn.utils;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

/**
 * @ Creat by gaumn on  2020/8/13
 **/
public class MybatisUtils {
//    private static SqlSessionFactory sqlSessionFactory =null;
//
//    static {
//        //定义mybatis主配置文件的根路径
//        String config ="config/mybatis.xml";
//        //加载mybatis的主配置文件
//        try {
//            //InputStream in = Resources.getResourceAsStream(config);
//            InputStream in = Resources.getResourceAsStream(config);
//            //创建sqlSessionFactoryBuilder对象
//            SqlSessionFactoryBuilder sqlSessionFactoryBuilder=new SqlSessionFactoryBuilder();
//            //创建sqlsessionfactory对象
//           sqlSessionFactory =sqlSessionFactoryBuilder.build(in);
//
//
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//
//
//    }
//
//
//    //获取sqlsession对象
//    static  public SqlSession getsqlSession(){
//
//        //创建sqlsession对象
//         SqlSession sqlSessions=null;
//        if (sqlSessionFactory!=null)
//            sqlSessions =sqlSessionFactory.openSession();//非自动提交
//        return sqlSessions;
//
//
//    }
}
