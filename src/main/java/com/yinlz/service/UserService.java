package com.yinlz.service;

import com.yinlz.config.ConfigFile;
import com.yinlz.dao.DaoBase;
import com.yinlz.tool.ToolClient;
import com.yinlz.tool.ToolSHA;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

/**
 * @作者 田应平
 * @版本 v1.0
 * @创建时间 2020-02-23 19:48
 * @QQ号码 444141300
 * @Email service@yinlz.com
 * @官网 <url>http://www.yinlz.com</url>
*/
@Service
public class UserService{

    @Resource
    private DaoBase dao;

    public String login(final HttpServletRequest request){
        final String userName = request.getParameter("userName");
        final String password = request.getParameter("password");
        final String pwd = ToolSHA.encoder(userName,password);
        final HashMap<String,String> params = new HashMap<>();
        params.put("userName",userName);
        params.put("password",pwd);
        final String userId = dao.queryForEntity("sys_user.userLogin",params);
        if(userId != null){
            final HttpSession session = request.getSession();
            session.setAttribute(ConfigFile.LOGIN_KEY,userId);
            session.setAttribute(ConfigFile.LOGIN_USER,userName);
            return ToolClient.createJsonSuccess("登录成功");
        }
        return ToolClient.createJsonFail("用户名或密码错误");
    }
}