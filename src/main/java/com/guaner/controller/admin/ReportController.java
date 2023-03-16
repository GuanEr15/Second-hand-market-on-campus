package com.guaner.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guaner.bean.PageBean;
import com.guaner.bean.Result;
import com.guaner.entity.common.Goods;
import com.guaner.entity.common.ReportGoods;
import com.guaner.entity.common.Student;
import com.guaner.service.common.GoodsService;
import com.guaner.service.common.ReportGoodsService;
import com.guaner.service.common.StudentService;

/**
 * 后台物品举报管理控制器
 * @author Administrator
 *
 */
@RequestMapping("/admin/report")
@Controller
public class ReportController {

	@Resource
	private GoodsService goodsService;
	@Resource
	private StudentService studentService;
	@Resource
	private ReportGoodsService reportGoodsService;
	
	/**
	 * 物品举报管理列表页面
	 * @param
	 * @param pageBean
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/list")
	public String list(ReportGoods reportGoods,PageBean<ReportGoods> pageBean,Model model){
		if(reportGoods.getStudent() != null && reportGoods.getStudent().getSn() != null){
			Student student = studentService.findBySn(reportGoods.getStudent().getSn());
			if(student != null){
				reportGoods.setStudent(student);
			}
		}
		List<Goods> goodsList = null;
		if(reportGoods.getGoods() != null && reportGoods.getGoods().getName() != null){
			goodsList = goodsService.findListByName(reportGoods.getGoods().getName());
		}
		model.addAttribute("title", "物品举报列表");
		model.addAttribute("content", reportGoods.getContent());
		model.addAttribute("name", reportGoods.getGoods() == null ? null : reportGoods.getGoods().getName());
		model.addAttribute("sn", reportGoods.getStudent() == null ? null : reportGoods.getStudent().getSn());
		model.addAttribute("pageBean", reportGoodsService.findlist(pageBean, reportGoods,goodsList));
		return "admin/report/list";
	}
	
	

	
	/**
	 * 物品举报删除操作
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	@ResponseBody
	public Result<Boolean> delete(@RequestParam(name="id",required=true)Long id){
		reportGoodsService.delete(id);
		return Result.success(true);
	}
}
