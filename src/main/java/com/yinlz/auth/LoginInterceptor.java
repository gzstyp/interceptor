package com.yinlz.auth;

import com.yinlz.config.ConfigFile;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.resource.ResourceHttpRequestHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 登录拦截器[认证和权限拦截应该分开,各执其职]
 * @作者 田应平
 * @版本 v1.0
 * @创建时间 2020-02-23 15:33
 * @QQ号码 444141300
 * @Email service@yinlz.com
 * @官网 <url>http://www.yinlz.com</url>
*/
public final class LoginInterceptor implements HandlerInterceptor{

    /*在访问controller控制器之前的处理*/
    @Override
    public boolean preHandle(final HttpServletRequest request,final HttpServletResponse response,final Object handler) throws Exception{

        //静态资源不需要拦截,静态资源配置1,ok,但是优先权在实现接口类 WebMvcConfigurer 的拦截器配置
        //if(handler instanceof ResourceHttpRequestHandler){return true;}
        //if(handler instanceof HandlerMethod){//controller层的方法}//认证和权限拦截应该分开,各执其职
        final HttpSession session = request.getSession();
        //判断是否已登录
        final String login_key = (String)session.getAttribute(ConfigFile.LOGIN_KEY);
        if(login_key == null){
            final String path = request.getContextPath();
            System.out.println(path);
            response.sendRedirect(request.getContextPath() + "/login");//说明未登录或登录超时,所以要求去登录url
            return false;
        }else{
            return true;
        }
    }
}