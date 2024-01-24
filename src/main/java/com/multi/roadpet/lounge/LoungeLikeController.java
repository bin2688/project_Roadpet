package com.multi.roadpet.lounge;

import java.util.HashMap;
import java.util.Map;

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
	public Map<String, Integer> likeInsert(LoungeLikeVO loungeLikeVO, Model model) {
		LoungeVO result = loungeLikeService.likeInsert(loungeLikeVO);
		model.addAttribute("result", result);
		System.out.println("loungeLikeVO.getLike_id() :" + loungeLikeVO.getLike_id());
		Map<String, Integer> likeCountMap = new HashMap<>();
		likeCountMap.put("result", result.getLikeCount());
		likeCountMap.put("likeId", loungeLikeVO.getLike_id());
		return 	likeCountMap;
	}
	
	@ResponseBody
	@RequestMapping("lounge/likeDelete")
	public String likeDelete(LoungeLikeVO loungeLikeVO, Model model) {
		//user_id=2&lounge_id=50
		System.out.println("likeDelete");
		System.out.println("loungeLikeVO : " + loungeLikeVO);
		LoungeVO result = loungeLikeService.likeDelete(loungeLikeVO);
		System.out.println("result : " + result);
		model.addAttribute("result", result);
		return "" + result.getLikeCount();	
	}
}
