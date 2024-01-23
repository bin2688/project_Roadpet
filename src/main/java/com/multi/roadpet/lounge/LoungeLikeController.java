package com.multi.roadpet.lounge;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoungeLikeController {
	
	@Autowired
	LoungeLikeService loungeLikeService;
	
	@ResponseBody
	@RequestMapping("lounge/likeInsert")
	public String likeInsert(LoungeLikeVO loungeLikeVO, Model model) {
		//loungeLikeVO.setLike_id(like_id);
		LoungeVO result = loungeLikeService.likeInsert(loungeLikeVO);
		model.addAttribute("result", result);
		return "" + result.getLikeCount();	
	}
	
	@ResponseBody
	@RequestMapping("lounge/likeDelete")
	public String likeDelete(LoungeLikeVO loungeLikeVO, Model model) {
		LoungeVO result = loungeLikeService.likeDelete(loungeLikeVO);
		model.addAttribute("result", result);
		return "" + result.getLikeCount();	
	}
}
