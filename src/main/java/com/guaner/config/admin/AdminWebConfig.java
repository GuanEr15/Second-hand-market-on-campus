package com.guaner.config.admin;
/**
 * 用来配置拦截器的配置类
 */
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.guaner.constant.RuntimeConstant;
import com.guaner.interceptor.admin.AuthorityInterceptor;
import com.guaner.interceptor.admin.AdminLoginInterceptor;
@Configuration
public class AdminWebConfig implements WebMvcConfigurer {
	
	@Resource
	private AdminLoginInterceptor loginInterceptor;
	
	@Resource
	private AuthorityInterceptor authorityInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
	    registry.addInterceptor(loginInterceptor).addPathPatterns("/**").excludePathPatterns(RuntimeConstant.loginExcludePathPatterns);
	    registry.addInterceptor(authorityInterceptor).addPathPatterns("/**").excludePathPatterns(RuntimeConstant.authorityExcludePathPatterns);
	}

}
