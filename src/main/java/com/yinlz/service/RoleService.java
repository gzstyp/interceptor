package com.yinlz.service;

import com.yinlz.dao.DaoBase;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 角色
 * @作者 田应平
 * @版本 v1.0
 * @创建时间 2020-02-23 19:48
 * @QQ号码 444141300
 * @Email service@yinlz.com
 * @官网 <url>http://www.yinlz.com</url>
*/
@Service
public class RoleService{

    @Resource
    private DaoBase dao;

    //获取角色
    public List<String> getRole(final String userId){
        return dao.selectListEntity("sys_role.getRole",userId);
    }

    //获取权限[菜单]
    public List<HashMap> getPermission(final String userId){
        return dao.selectListEntity("sys_role.getPermission",userId);
    }
}