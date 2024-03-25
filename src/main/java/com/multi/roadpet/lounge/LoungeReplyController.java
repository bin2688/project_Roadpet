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
	public String rpInsert(LoungeReplyVO lngRpVO, Model model) {
		int result = lngRpService.rpInsert(lngRpVO);	
		return "redirect:detail?lounge_id=" + lngRpVO.getReply_oriid();	
	}
	
	@RequestMapping("lounge/rpUpdate")
	public String rpUpdate(LoungeReplyVO lngRpVO, Model model) {
		int result = lngRpService.rpUpdate(lngRpVO);
		return "redirect:detail?lounge_id=" + lngRpVO.getReply_oriid();
	}
	
	@RequestMapping("lounge/rpDelete")
	public String rpDelete(LoungeReplyVO lngRpVO) {
		 lngRpService.rpDelete(lngRpVO);
		return "redirect:detail?lounge_id=" + lngRpVO.getReply_oriid();
	}
	
	
}
