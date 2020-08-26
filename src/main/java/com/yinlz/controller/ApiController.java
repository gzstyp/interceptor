package com.yinlz.controller;

import com.yinlz.config.ConfigFile;
import com.yinlz.tool.ToolClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 登录认证及接口调用
 * @作者 田应平
 * @版本 v1.0
 * @创建时间 2020-02-23 15:40
 * @QQ号码 444141300
 * @Email service@yinlz.com
 * @官网 <url>http://www.yinlz.com</url>
*/
@RestController
@RequestMapping("api")
public final class ApiController{

    @Resource
    private HttpServletRequest request;

    @GetMapping("token")
    public final void token(final HttpServletResponse response){
        final String access_token = request.getHeader("access_token");
        final String refresh_token = request.getHeader("refresh_token");
        if(access_token == null || access_token.length() <= 0){
            final String josn = ToolClient.createJsonFail("未登录或登录已失效");
            ToolClient.responseJson(josn,response);
            return;
        }
        if(refresh_token == null || refresh_token.length() <= 0){
            final String josn = ToolClient.createJsonFail("未登录或登录已失效");
            ToolClient.responseJson(josn,response);
            return;
        }
        final String josn = ToolClient.createJsonSuccess("已登录");
        ToolClient.responseJson(josn,response);
    }

    @GetMapping("userList")
    public final void userList(final HttpServletResponse response){
        final String josn = ToolClient.createJsonSuccess("可以访问userList");
        ToolClient.responseJson(josn,response);
    }
}