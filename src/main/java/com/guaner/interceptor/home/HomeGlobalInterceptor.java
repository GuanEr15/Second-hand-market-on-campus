package com.guaner.interceptor.home;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.guaner.config.SiteConfig;
import com.guaner.entity.common.SiteSetting;
import com.guaner.service.common.FriendLinkService;
import com.guaner.service.common.GoodsCategoryService;
import com.guaner.service.common.SiteSettingService;
import com.guaner.util.StringUtil;

/**
 * 前台全局拦截器
 * @author Administrator
 *
 */
@Component
public class HomeGlobalInterceptor implements HandlerInterceptor{

	@Resource
	private GoodsCategoryService goodsCategoryService;

	@Resource
	private SiteConfig siteConfig;

	@Resource
	private FriendLinkService friendLinkService;

	@Resource
	private SiteSettingService siteSettingService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler){
		
		if(!StringUtil.isAjax(request)){
			//若不是ajax请求，则将菜单信息放入页面模板变量
			request.setAttribute("goodsCategorys", goodsCategoryService.findAll());
			request.setAttribute("friendLinkList", friendLinkService.findList(8));
			SiteSetting siteSetting = siteSettingService.find();
			if(siteSetting != null){
				request.setAttribute("siteName", siteSetting.getSiteName());
				request.setAttribute("siteSetting", siteSetting);
			}
		}
		return true;
	}
}
