package com.multi.roadpet.lounge;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoungeReplyController {
	
	@Autowired
	LoungeReplyService lngRpService;
	
	@RequestMapping("lounge/rpInsert")
	public void rpInsert(LoungeReplyVO lngRpVO, Model model) {
		int result = lngRpService.rpInsert(lngRpVO);
		System.out.println(result);
		model.addAttribute("result", result);
		model.addAttribute("reply_date", lngRpVO.getReply_date());
		System.out.println(lngRpVO.getReply_date());
	    model.addAttribute("reply_content", lngRpVO.getReply_content());
	}
}
