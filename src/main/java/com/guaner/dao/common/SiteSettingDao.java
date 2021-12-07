package com.guaner.dao.common;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.guaner.entity.common.SiteSetting;

/**
 * 网站设置dao层
 */
@Repository
public interface SiteSettingDao extends JpaRepository<SiteSetting, Long> {
	
	/**
	 * 根据id查找
	 * @param id
	 * @return
	 */
	@Query("select ss from SiteSetting ss where id = 1")
	SiteSetting find();
}
