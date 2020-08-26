<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
final String path = request.getContextPath();
final String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8" />
    <base href="<%=basePath%>">
    <title>首页src/main/webapp/WEB-INF/view/index.jsp</title>
    <link rel="shortcut icon" href="images/favicon.ico" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
    <style type="text/css">
        input{
            height:36px;
            line-height:36px;
            width:340px;
            padding-left:4px;
        }
        a:link,a:visited,a:hover,a:active{
            text-decoration: none;
            outline:none;
        }
    </style>
  </head>
  <body>
    <a href="/login">登录</a>
  </body>
</html>