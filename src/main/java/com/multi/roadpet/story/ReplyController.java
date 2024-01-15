package com.multi.roadpet.story;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReplyController {
	
	@Autowired
	ReplyDAO replyDAO;
	
	@RequestMapping("oldProduct/insert4") //ajax호출!
	public void insert(ReplyVO replyVO, Model model) {
		System.out.println(replyVO);
		int result = replyDAO.insert(replyVO);
		System.out.println("reply insert 결과>>" + result);
		//스프리은 자동으로 클래스 이름 앞글자를 소문자로 변수로 만들어두면 views까지 모델 속성으로 지정하여 전달해준다
		//model.addAttribute("replyDTO", replyDTO);
		model.addAttribute("result", result);
	}
}
