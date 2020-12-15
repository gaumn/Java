package com.gaumn.utils;

import com.gaumn.controller.Constants;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 权限拦截器：判断用户是否登录的
 */
public class AuthInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();

        Object user = session.getAttribute(Constants.LOGIN_USER);
        System.out.println("AuthInterceptor");
        if (user == null){
            response.sendRedirect(request.getContextPath() + "/page/login");
            return false;
        }
        return true;
    }
}
