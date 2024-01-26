package com.multi.roadpet.member;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.multi.roadpet.member.MemberController;

@Controller
public class MemberController {
	

	@Autowired // �뒪�봽留곸씠 李얠븘�꽌 二쇱냼瑜� �꽔�뼱以�.
	MemberDAO dao;

	@Autowired
	MemberService service;

	
	@RequestMapping("member/signUp")
	public void signUp(MemberDTO dto) throws Exception {
		System.out.println("MemberController");
		System.out.println(dto);

		int result = service.signUp(dto);
		String resultText = "";
		if (result == 1) {
			resultText = "�쉶�썝媛��엯�뿉 �꽦怨듯뻽�뒿�땲�떎.";
		} else {
			resultText = "�쉶�썝媛��엯�뿉 �떎�뙣�뻽�뒿�땲�떎.";
		}
		System.out.println(resultText);
	}

	@RequestMapping("member/login")
	public void login(MemberDTO dto, HttpSession session) throws Exception {
		System.out.println(dto);

		HashMap<String, Object> result2 = service.login(dto); // boolean(true/false)
		System.out.println(result2);
		boolean result = (boolean)result2.get("result");
		int user_id = (int)result2.get("user_id");
		String nickName = (String)result2.get("nickName");

		if (result == true) {
			session.setAttribute("user_id", user_id);
			session.setAttribute("nickName", nickName);
		}
	}

	//�븘�씠�뵒 以묐났泥댄겕
	@PostMapping("member/idCheck")
	@ResponseBody
	public Object idCheck(@RequestParam("id") String id, MemberDTO dto) throws Exception {
		
		System.out.println("id :" + id);
		int result = dao.idCheck(id);
		System.out.println("result :" + result);
		return result;
		
	}
	
	@RequestMapping("member/naverLogin")
	@ResponseBody
	public void naverLogin(MemberDTO dto) throws Exception {
		int result = service.signUp(dto);
		String resultText = "";
		if (result == 1) {
			resultText = "�쉶�썝媛��엯�뿉 �꽦怨듯뻽�뒿�땲�떎.";
		} else {
			resultText = "�쉶�썝媛��엯�뿉 �떎�뙣�뻽�뒿�땲�떎.";
		}
		System.out.println(resultText);
	}

}// �겢�옒�뒪
