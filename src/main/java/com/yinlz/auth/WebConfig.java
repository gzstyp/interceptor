package com.yinlz.auth;

import org.springframework.boot.SpringBootConfiguration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.Arrays;

/**
 * WebMvc配置器|Bean配置
 * @作者 田应平
 * @版本 v1.0
 * @创建时间 2020-02-23 17:47
 * @QQ号码 444141300
 * @Email service@yinlz.com
 * @官网 <url>http://www.yinlz.com</url>
*/
@SpringBootConfiguration
public class WebConfig implements WebMvcConfigurer{

    //静态资源配置2,优先级比 implements HandlerInterceptor 和 extends HandlerInterceptorAdapter
    @Override
    public void addInterceptors(final InterceptorRegistry registry){
        final String[] array = {"/error","","/","/index","/login","/user/login","/*.html","/*.ico","/css/**","/images/**","/js/**"};
        //登录拦截器
        registry.addInterceptor(new LoginInterceptor()).excludePathPatterns(Arrays.asList(array));
        //权限拦截器
        registry.addInterceptor(new AuthInterceptor()).excludePathPatterns(Arrays.asList(array));
    }
}