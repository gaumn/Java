package com.gaumn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @ Creat by gaumn on  2020/12/18
 **/
@Controller
@RequestMapping("/User")
public class RegisterController {
    @RequestMapping(value = "/register",method = RequestMethod.GET)
    public String register() throws Exception{
        System.out.println("login get");
        return "/jsp/register.jsp";
    }
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String registerpost( ) throws Exception{



        return "/jsp/login.jsp";
    }
}
