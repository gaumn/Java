package com.gaumn.controller;


import com.gaumn.domain.UserInfo;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.registry.infomodel.User;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/sysUser")
public class LoginController {

    @RequestMapping(value = "/login")
    public String login(@RequestParam(value = "username", required = true) String username,
                        @RequestParam(value = "password", required = true) String password,
                        Model model){
        System.out.println("登陆用户输入的用户名：" + username + "，密码：" + password);

        String error = null;
        if (username != null && password != null) {
            //初始化
            Subject subject = SecurityUtils.getSubject();
            UsernamePasswordToken token = new UsernamePasswordToken(username, password);
            try {
                //登录，即身份校验，由通过Spring注入的UserRealm会自动校验输入的用户名和密码在数据库中是否有对应的值
                subject.login(token);
                System.out.println("用户是否登录：" + subject.isAuthenticated());
//                HttpServletRequest httpServletRequest = WebUtils.toHttp(request);
//                HttpSession session = httpServletRequest.getSession();
//                //把用户信息保存到session
//                session.setAttribute("activeUser", activeUser);
                return "/success";
            } catch (UnknownAccountException e) {
                e.printStackTrace();
                error = "用户账户不存在，错误信息：";// + e.getMessage();
            } catch (IncorrectCredentialsException e) {
                e.printStackTrace();
                error = "用户名或密码错误，错误信息：";// + e.getMessage();
            } catch (LockedAccountException e) {
                e.printStackTrace();
                error = "该账号已锁定，错误信息：" ;//+ e.getMessage();
            } catch (DisabledAccountException e) {
                e.printStackTrace();
                error = "该账号已禁用，错误信息：";// + e.getMessage();
            } catch (ExcessiveAttemptsException e) {
                e.printStackTrace();
                error = "该账号登录失败次数过多，错误信息：";// + e.getMessage();
            } catch (Exception e){
                e.printStackTrace();
                error = "未知错误，错误信息：" ;//+ e.getMessage();
            }
        } else {
            error = "请输入用户名和密码";
        }
        System.out.println(error);
        //登录失败，跳转到login页面
        model.addAttribute("error", error);
        return "/jsp/login.jsp";
    }


    @RequestMapping(value = "/refuse",method = RequestMethod.GET)
    public String refuse() throws Exception{
        System.out.println("login get");
        return "/jsp/error.jsp";
    }


    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String logout() throws Exception{

//        1.从SecurityUtils中获取user信息
//        获取userInfo信息
//        UserInfo user = (UserInfo) SecurityUtils.getSubject().getPrincipal();
//        System.out.println(user);

//        2.从session中获取user信息
//        获取request对象
//        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
//        //获取session
//        HttpSession   session   =   request.getSession();
//// 获取session中所有的键值
//        Enumeration<?> enumeration = session.getAttributeNames();
//// 遍历enumeration
//        while (enumeration.hasMoreElements()) {
//            // 获取session的属性名称
//            String name = enumeration.nextElement().toString();
//            // 根据键值取session中的值
//            Object value = session.getAttribute(name);
//            // 打印结果
//            System.out.println("name:" + name + ",value:" + value );
//        }
        System.out.println("logout");
        return "/logout.do";
    }

}
