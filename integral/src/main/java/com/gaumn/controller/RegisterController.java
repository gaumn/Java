package com.gaumn.controller;

import com.gaumn.dao.UserInfoDao;
import com.gaumn.domain.UserInfo;
import com.gaumn.utils.SaltUtils;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @ Creat by gaumn on  2020/12/18
 **/
@Controller
@RequestMapping("/User")
public class RegisterController {
    @Autowired
    private UserInfoDao userInfoDao;

    @RequestMapping(value = "/register",method = RequestMethod.GET)
    public String register() throws Exception{
        System.out.println("login get");
        return "/jsp/register.jsp";
    }

    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String registerpost(UserInfo userInfo, Model model) throws Exception{
        System.out.println(userInfo.toString());
        //检测有无相同的t_name,若有返回错误 用户名已经存在
        //若数据库中没有该t_name 写入数据库中，并弹出窗口 注册成功。
        UserInfo user= userInfoDao.getBytName(userInfo.getT_name());
        if (user!=null){
            String error = "用户名已经存在";
            model.addAttribute("error", error);
            return "/jsp/register.jsp";
        }
        //UserInfo{id=0, t_name='凤飞飞', UserName='多大的',
        // UserPwd='123456789', locked=0, salt=0,
        // address='浙江省', score=0,
        // freezingScore=0, college='时代的',
        // clbum='对对对', role='null'}
        //salt是一个随机生成数
        userInfo.setSalt(SaltUtils.getSalt((int)(Math.random()*50)+1));
        ByteSource salt =ByteSource.Util.bytes(userInfo.getSalt());
        //score 设定默认值为100
        userInfo.setScore(100);
        //role 设定默认值为普通成员(members)
        // （一共分为两类  管理员 普通成员）
        userInfo.setRole("普通成员");
        userInfo.setUserPwd(SaltUtils.encoderPassword(userInfo.getUserPwd(),salt));
        userInfoDao.insertRegister(userInfo);
        System.out.println("注册界面");
        return "/jsp/login.jsp";
    }
}
