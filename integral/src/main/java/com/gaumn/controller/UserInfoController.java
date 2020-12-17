package com.gaumn.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/sysUser")
public class UserInfoController {

    @RequestMapping(value = "/success")
    @ResponseBody
    public ModelAndView success(HttpSession session) throws Exception{
        ModelAndView model=new ModelAndView();
        System.out.println("成功 success");
//        Map<String,Object> map = new HashMap<>();
//        map.put("code",0);
        model.setViewName("/WEB-INF/sysUser/main.jsp");
        return model ;
    }

    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String login() throws Exception{
        System.out.println("login get");
        return "/jsp/login.jsp";
    }


    /**
     * post方式的login方式什么时候调用？
     * 身份认证失败的时候会自动调用
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView login(HttpServletRequest request) throws Exception{
        System.out.println("login post");
        ModelAndView model=new ModelAndView();
        System.out.println("认证失败了吧！来我这了吧");
        String exceptionName = request.getAttribute("shiroLoginFailure").toString();
        System.out.println(exceptionName);
        model.setViewName("/WEB-INF/sysUser/error.jsp");

        return model;
    }

    @RequestMapping(value = "/register",method = RequestMethod.GET)
    public String register() throws Exception{
        System.out.println("login get");
        return "/jsp/register.jsp";
    }
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String registerpost() throws Exception{
        System.out.println("login get");

        return "/jsp/login.jsp";
    }
    @RequestMapping(value = "/refuse",method = RequestMethod.GET)
    public String refuse() throws Exception{
        System.out.println("login get");
        return "/jsp/error.jsp";
    }

}
