<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登录</title>
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
<input id="userName" placeholder="用户账号"/><br/><br/>
<input id="password" placeholder="登录密码" type="password"/><br/><br/>
<a href="javascript:;" id="btnLogin" style="margin-left:150px;">登录</a><br/><br/>
<a href="javascript:;" id="checkLogin" style="margin-left:130px;">是否已登录</a>
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/page.libs.js"></script>
<script type="text/javascript">
    ;(function(){
        thisPage = {
            init : function(){
                $('#btnLogin').on('click',function(){
                    thisPage.login();
                });
                $('#checkLogin').on('click',function(){
                    thisPage.checkLogin();
                });
            },
            login : function(){
                var userName = $('#userName').val();
                var password = $('#password').val();
                if(userName == null || userName == ''){
                    alert('请输入用户账号');
                    return;
                }
                if(password == null || password == ''){
                    alert('请输入登录密码');
                    return;
                }
                var params = {
                    userName : userName,
                    password : password,
                }
                winFn.ajaxGet('user/login',params,function(data){
                    if(data.code == 200){
                        sessionStorage.setItem("access_token",data.access_token);
                        sessionStorage.setItem("refresh_token",data.refresh_token);
                        alert('登录成功');
                    }else{
                        alert(data.msg);
                    }
                },function(){
                    alert('链接服务器失败');
                });
            },
            checkLogin : function(){
                winFn.ajaxGet('api/token',null,function(data){
                    if(data.code == 200){
                        alert(data.msg);
                    }else{
                        alert(data.msg);
                    }
                },function(){
                    alert('链接服务器失败');
                });
            },
        }
        thisPage.init();
    })(jQuery);
</script>
</body>
</html>