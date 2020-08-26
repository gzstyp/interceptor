/**
 * 基于jquery封装工具
 * @作者 田应平
 * @创建时间 2020-02-22 22:50
 * @QQ号码 444141300
 * @官网 <url>http://www.yinlz.com</url>
*/
/*
jquery.cookie.js
window.sessionStorage
保存数据语法：
sessionStorage.setItem("key", "value");
读取数据语法：
var lastname = sessionStorage.getItem("key");
删除指定键的数据语法：
sessionStorage.removeItem("key");
删除所有数据：
sessionStorage.clear();
*/
;(function(){
    window.winFn = {
        /**POST请求远程数据,不带正在加载提示信息;winFn.ajaxPost(url,params,succeed,failure);*/
        ajaxPost : function(url,params,succeed,failure){
            var access_token = sessionStorage.getItem("access_token");
            var refresh_token = sessionStorage.getItem("refresh_token");
            if(access_token == null || access_token == undefined || access_token == "undefined"){
                access_token = '';
            }
            if(refresh_token == null || refresh_token == undefined || refresh_token == "undefined"){
                refresh_token = '';
            }
            $.ajax({
                type : "POST",
                url : url,
                headers: {'access_token': access_token,"refresh_token":refresh_token},
                dataType : "json",
                data : params,
                success : function(result){
                    succeed(result);
                },
                error : function(response,err){
                    if (failure != null && failure != ''){
                        failure(err);
                    }
                }
            });
        },
        /**GET请求远程数据,不带正在加载提示信息;winFn.ajaxGet(url,params,succeed,failure);*/
        ajaxGet : function(url,params,succeed,failure){//无正在加载提示信息
            var access_token = sessionStorage.getItem("access_token");
            var refresh_token = sessionStorage.getItem("refresh_token");
            if(access_token == null || access_token == undefined || access_token == "undefined"){
                access_token = '';
            }
            if(refresh_token == null || refresh_token == undefined || refresh_token == "undefined"){
                refresh_token = '';
            }
            $.ajax({
                type : "GET",
                url : url,
                headers: {'access_token': access_token,"refresh_token":refresh_token},
                dataType : "json",
                data : params,
                success : function(result){
                    succeed(result);
                },
                error : function(response,err){
                    if (failure != null && failure != ''){
                        failure(err);
                    }
                }
            });
        },
        getPageHashToken : function(url){
            var access_token = sessionStorage.getItem("access_token");
            var refresh_token = sessionStorage.getItem("refresh_token");
            if(access_token == null || access_token == undefined || access_token == "undefined"){
                access_token = '';
            }
            if(refresh_token == null || refresh_token == undefined || refresh_token == "undefined"){
                refresh_token = '';
            }
            window.location.href = url + '?&access_token=' + access_token + '&refresh_token=' + refresh_token;
        },
        getPageNormal : function(url){
            window.location.href = url;
        }
    }
})(jQuery);