package com.guaner.controller.home;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.guaner.bean.PageBean;
import com.guaner.entity.common.WantedGoods;
import com.guaner.service.common.WantedGoodsService;

/**
 * 求购物品控制器
 * @author Administrator
 *
 */
@RequestMapping("/home/wanted_goods")
@Controller
public class HomeWantedGoodsController {

	@Resource
	private WantedGoodsService wantedGoodsService;
	
	/**
	 * 求购物品列表页面
	 * @param model
	 * @param pageBean
	 * @param WantedGoods
	 * @return
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String list(Model model,PageBean<WantedGoods> pageBean,WantedGoods WantedGoods){
		model.addAttribute("pageBean", wantedGoodsService.findlist(pageBean, WantedGoods));
		return "home/wanted_goods/list";
	}
}
