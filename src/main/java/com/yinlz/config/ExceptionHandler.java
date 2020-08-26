package com.yinlz.config;

import com.yinlz.tool.ToolClient;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.support.MissingServletRequestPartException;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 全局的系统异常处理json数据格式提示
 * @作者 田应平
 * @版本 v1.0
 * @创建时间 2017年5月14日 下午1:01:22
 * @QQ号码 444141300
 * @官网 http://www.fwtai.com
*/
@ControllerAdvice
public class ExceptionHandler implements HandlerExceptionResolver{

	@ResponseBody
	@Override
	public ModelAndView resolveException(final HttpServletRequest request,final HttpServletResponse response,final Object object,final Exception exception){

        if(exception instanceof MissingServletRequestPartException){
            ToolClient.responseJson(ToolClient.exceptionJson("请选择文件再操作"),response);
            return null;
        }
        if(exception instanceof MaxUploadSizeExceededException){
            ToolClient.responseJson(ToolClient.exceptionJson("上传的文件过大"),response);
            return null;
        }
        if(exception instanceof HttpRequestMethodNotSupportedException){
            ToolClient.responseJson(ToolClient.exceptionJson("不支持该请求方式"),response);
            return null;
        }
	    ToolClient.responseException(response);
		return null;
	}
}