package com.gaumn.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/sysUser")
public class UserInfoController {

    @RequestMapping("/success")
    @ResponseBody
    public String success(HttpSession session) throws Exception{
        System.out.println("成功 success");
        Map<String,Object> map = new HashMap<>();
        map.put("code",0);

        return "main";
    }

    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String login() throws Exception{
        System.out.println("login get");
        return "login";
    }


    /**
     * post方式的login方式什么时候调用？
     * 身份认证失败的时候会自动调用
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> login(HttpServletRequest request) throws Exception{
        System.out.println("login post");

        Map<String,Object> map = new HashMap<>();
        System.out.println("认证失败了吧！来我这了吧");
        String exceptionName = request.getAttribute("shiroLoginFailure").toString();
        System.out.println(exceptionName);
        map.put("code",1);
        map.put("msg","用户名不正确");
        System.out.println(map.get("code"));
        return map;
//        if (exceptionName.equals(UnknownAccountException.class.getName())){
//            map.put("code",1);
//            map.put("msg","用户名不正确");
//            return map;
//        }else if(exceptionName.equals(IncorrectCredentialsException.class.getName())){
//            map.put("code",2);
//            map.put("msg","密码不正确");
//            return map;
//        }
//        System.out.println("sssss");
//        return map;
    }



}
