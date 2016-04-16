package com.cousin.borrow.basic.interceptot;

import java.util.Map;

import com.cousin.borrow.basic.entity.Userrole;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

/**
 *@author 戴嘉诚 E-mail:a773807943@gmail.com
 *@version V0.1 创建时间：2016年4月17日 上午1:37:28
 */
public class LoginInterceptor extends MethodFilterInterceptor {

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		System.out.println("========================1拦截器开始");
		// 取得请求相关的ActionContext实例  
        ActionContext ctx = invocation.getInvocationContext();  
        Map session = ctx.getSession();  
        Userrole user = (Userrole) session.get("user");
        if(user!=null){
        	System.out.println("=============================2拦截器");
        	return invocation.invoke();	
        }
        ctx.put("msg", "请登录系统啊");
        System.out.println("=====================3拦截器");
		return Action.LOGIN;
	}

}
