package com.multi.roadpet.lounge;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class LoungeReplyController {
	
	@Autowired
	LoungeReplyServiceInterface lngRpService;	
	
	@RequestMapping("lounge/rpInsert")
	public void rpInsert(LoungeReplyVO lngRpVO, Model model) throws ParseException {
		int result = lngRpService.rpInsert(lngRpVO);
		model.addAttribute("result", result);
		
		Date now1= new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		String insFormat = dateFormat.format(now1);
		Date resultDate = dateFormat.parse(insFormat);	
		lngRpVO.setReply_date(resultDate);
		model.addAttribute("reply_date", lngRpVO.getReply_date());
		model.addAttribute("reply_content", lngRpVO.getReply_content());
		model.addAttribute("reply_id", lngRpVO.getReply_id());
		 
	}
	
	@RequestMapping("lounge/rpUpdate")
	public void rpUpdate(LoungeReplyVO lngRpVO, Model model) throws ParseException {
		int result = lngRpService.rpUpdate(lngRpVO);
		model.addAttribute("result", result);

		Date now1= new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm");
		String insFormat = dateFormat.format(now1);
		Date resultDate = dateFormat.parse(insFormat);
	
		lngRpVO.setReply_date(resultDate);
		model.addAttribute("reply_date", lngRpVO.getReply_date());
		model.addAttribute("reply_id", lngRpVO.getReply_id());
	    model.addAttribute("reply_content", lngRpVO.getReply_content());

	}
	
	@RequestMapping("lounge/rpDelete")
	@ResponseBody
	public void rpDelete(LoungeReplyVO lngRpVO) {
		 lngRpService.rpDelete(lngRpVO);
	}
	
	@RequestMapping("lounge/rpOne")
	public void rpOne(LoungeReplyVO lngRpVO) {
		lngRpService.rpOne(lngRpVO);
	}
	
	
	
}
