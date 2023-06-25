package com.guaner.config.home;

import javax.annotation.Resource;

/**
 * 用来配置拦截器的配置类
 */
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.guaner.constant.RuntimeConstant;
import com.guaner.interceptor.home.HomeGlobalInterceptor;
import com.guaner.interceptor.home.HomeLoginInterceptor;

@Configuration
public class HomeWebConfig implements WebMvcConfigurer {

	@Resource
	private HomeLoginInterceptor homeLoginInterceptor;

	@Resource
	private HomeGlobalInterceptor homeGlobalInterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(homeLoginInterceptor).addPathPatterns("/**")
				.excludePathPatterns(RuntimeConstant.homeLoginExcludePathPatterns);
		registry.addInterceptor(homeGlobalInterceptor).addPathPatterns("/**")
				.excludePathPatterns(RuntimeConstant.homeGlobalExcludePathPatterns);
	}

}
