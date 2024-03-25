package com.multi.roadpet.lounge;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoungeLikeController {
	
	@Autowired
	LoungeLikeService loungeLikeService;
	
	@ResponseBody
	@RequestMapping("lounge/likeInsert")
	public Map<String, Integer> likeInsert(LoungeLikeVO loungeLikeVO) {
		int result = loungeLikeService.likeInsert(loungeLikeVO);
		int likeCnt = loungeLikeService.likeCount(loungeLikeVO.getLounge_id());
		Map<String, Integer> likeInsertMap = new HashMap<>();
		likeInsertMap.put("likeCnt", likeCnt);
		likeInsertMap.put("likeId", loungeLikeVO.getLike_id());

		return likeInsertMap;
	}
	
	@ResponseBody
	@RequestMapping("lounge/likeDelete")
	public int likeDelete(LoungeLikeVO loungeLikeVO) {
		int result = loungeLikeService.likeDelete(loungeLikeVO);
		int likeCnt = loungeLikeService.likeCount(loungeLikeVO.getLounge_id());	
		return likeCnt;	
	}
	
	@ResponseBody
	@RequestMapping("lounge/likeCheck")
	public LoungeLikeVO likeCheck(int user_id, int lounge_id) {
		LoungeLikeVO likeState = loungeLikeService.likeCheck(user_id, lounge_id);	
		return likeState;
	}
}
