package com.gaumn.controller;

import com.gaumn.domain.UserInfo;
import org.apache.shiro.SecurityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * @ Creat by gaumn on  2020/12/18
 **/
@Controller
public class MainController {
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
    @RequestMapping(value = "/queryUserInfo")
    public String queryUserInfo(Model model){
        //将查询信息放入model
        UserInfo user = (UserInfo) SecurityUtils.getSubject().getPrincipal();
        model.addAttribute("T_name",user.getT_name());
        model.addAttribute("UserName",user.getUserName());
        model.addAttribute("UserPwd",user.getUserPwd());
        model.addAttribute("Address",user.getAddress());
        model.addAttribute("Score",user.getScore());
        model.addAttribute("FreezingScore",user.getFreezingScore());
        model.addAttribute("College",user.getCollege());
        model.addAttribute("Clbum",user.getClbum());
        return "/jsp/queryUserInfo.jsp";
    }
    @RequestMapping(value = "/logout.do",method = RequestMethod.GET)
    public String register() throws Exception{
        System.out.println("login get");
        return "/jsp/login.jsp";
    }
}
