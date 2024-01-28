package com.multi.roadpet.lounge;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class LoungeReplyController {
	
	@Autowired
	LoungeReplyService lngRpService;	
	
	@RequestMapping("lounge/rpInsert")
	public String rpInsert(LoungeReplyVO lngRpVO, Model model) throws ParseException {
		int result = lngRpService.rpInsert(lngRpVO);
		
		Date nowDate= new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		String insFormat = dateFormat.format(nowDate);
		Date resultDate = dateFormat.parse(insFormat);	
		lngRpVO.setReply_date(resultDate);
		return "redirect:detail?lounge_id=" + lngRpVO.getReply_oriid();	
	}
	
	@RequestMapping("lounge/rpUpdate")
	public String rpUpdate(LoungeReplyVO lngRpVO, Model model) throws ParseException {
		int result = lngRpService.rpUpdate(lngRpVO);

		Date nowDate= new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		String insFormat = dateFormat.format(nowDate);
		Date resultDate = dateFormat.parse(insFormat);	
		lngRpVO.setReply_date(resultDate);
		return "redirect:detail?lounge_id=" + lngRpVO.getReply_oriid();

	}
	
	@RequestMapping("lounge/rpDelete")
	public String rpDelete(LoungeReplyVO lngRpVO) {
		 lngRpService.rpDelete(lngRpVO);
		return "redirect:detail?lounge_id=" + lngRpVO.getReply_oriid();
	}
	
	
}
