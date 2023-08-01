package com.guaner.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

/**
 * 网站基础信息配置类
 * 
 * @author Administrator
 *
 */
@Component
@PropertySource(value = "classpath:site.properties")
public class SiteConfig {

	@Value("${guaner.site.name}")
	private String siteName;

	@Value("${guaner.site.url}")
	private String siteUrl;

	/*
	 * 获取名称
	 */
	public String getSiteName() {
		return siteName;
	}

	/*
	 * 设置名称
	 */
	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}

	public String getSiteUrl() {
		return siteUrl;
	}

	public void setSiteUrl(String siteUrl) {
		this.siteUrl = siteUrl;
	}

}
