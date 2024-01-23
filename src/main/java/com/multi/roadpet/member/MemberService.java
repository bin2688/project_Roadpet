package com.multi.roadpet.member;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

	@Autowired
	MemberDAOImpl dao;

	@Autowired
	BCryptPasswordEncoder pwEncoder;

	// 鍮꾨�踰덊샇 �븫�샇�솕�븯湲�
	public int signUp(MemberDTO dto) {
		System.out.println("MemberService");
		// 1. dto password 媛� �솗�씤!
		System.out.println(dto.getPassword());
		// 2. pwEncoder.encode() �솗�씤!
		System.out.println(pwEncoder.encode(dto.getPassword()));

		dto.setPassword(pwEncoder.encode(dto.getPassword()));
		int signUp = dao.signUp(dto);

		return signUp;
	}

	// �븫�샇�솕�븳 鍮꾨�踰덊샇瑜� 鍮꾧탳�빐�꽌 濡쒓렇�씤
	public HashMap<String, Object> login(MemberDTO dto) {

		// db mem �뀒�씠釉붿뿉�꽌 �엯�젰�븯怨� dto.getId媛믪쑝濡� �븫�샇�맂 pw 援ы빐�삤湲�
		MemberDTO dto2 = dao.login(dto);
			System.out.println(dto2);
		boolean result = true; // pw �떎由�d
		System.out.println("비번"+dto2.getPassword());
		System.out.println("비번"+dto.getPassword());
		if (pwEncoder.matches(dto.getPassword(), dto2.getPassword())) { // (input 1234 . db pw)
			// login �꽦怨�!
			result = true;
		}
		System.out.println("서비스 결과 :"+result);
		HashMap<String, Object> result2 = new HashMap<String, Object>();
		result2.put("result",result);
		result2.put("user_id",dto2.getUser_id());
		return result2;
	}
	
		

}

