package com.yinlz.controller;

import com.yinlz.service.UserService;
import com.yinlz.tool.ToolClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
@RequestMapping("user")
public final class UserController{

    @Resource
    private HttpServletRequest request;

    @Resource
    private UserService userService;

    // http://127.0.0.1:1012/user/login?userName=admin&password=123456
    @GetMapping(value = "login",name = "user:login")
    public final void login(final HttpServletResponse response){
        final String json = userService.login(request);
        ToolClient.responseJson(json,response);
    }

    @GetMapping(value = "add",name = "user:add")
    public final void add(final HttpServletResponse response){
        System.out.println("add");
        final String json = ToolClient.createJsonFail("禁止操作!");
        ToolClient.responseJson(json,response);
    }

    @GetMapping(value = "del",name = "user:del")
    public final void del(final HttpServletResponse response){
        System.out.println("del");
        final String json = ToolClient.createJsonSuccess("可以操作");
        ToolClient.responseJson(json,response);
    }
}