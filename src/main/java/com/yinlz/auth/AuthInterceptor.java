package com.yinlz.auth;

import com.yinlz.config.ConfigFile;
import com.yinlz.service.RoleService;
import com.yinlz.tool.ToolClient;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * 菜单|权限拦截器[认证和权限拦截应该分开,各执其职]
 * @作者 田应平
 * @版本 v1.0
 * @创建时间 2020-02-23 18:22
 * @QQ号码 444141300
 * @Email service@yinlz.com
 * @官网 <url>http://www.yinlz.com</url>
*/
public final class AuthInterceptor extends HandlerInterceptorAdapter{

    @Override
    public boolean preHandle(final HttpServletRequest request,final HttpServletResponse response,final Object handler) throws Exception{
        /*
            1.获取用户的请求路径
            2.判断当前的路径是否需要权限认证,即哪些路径需要权限哪些不需要
            3.查询所有需要验证认证的路径集合
        */
        //静态资源不需要拦截,静态资源配置1,ok,但是优先权在实现接口类 WebMvcConfigurer 的拦截器配置
        //if(handler instanceof ResourceHttpRequestHandler){return true;}

        final String userId = (String)request.getSession().getAttribute(ConfigFile.LOGIN_KEY);

        final BeanFactory factory = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getServletContext());
        final RoleService roleService = factory.getBean(RoleService.class);//解决spring boot无法注入bean的问题

        final String uri = request.getRequestURI();
        final List<HashMap> list = roleService.getPermission(userId);
        final Set<String> set = new HashSet<>();
        for(int i = 0; i < list.size(); i++){
            set.add(String.valueOf(list.get(i).get("url")));
        }
        if(set.contains(uri)){
            return true;
        }else{
            final String json = ToolClient.createJsonFail("无权限操作!");
            ToolClient.responseJson(json,response);
            return false;
        }
    }
}