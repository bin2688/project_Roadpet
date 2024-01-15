package com.multi.roadpet.lounge;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoungeReplyService {
	
	@Autowired
	LoungeReplyDAO lngRpDAO;
	
	public int rpInsert(LoungeReplyVO lngRpVO) {
		return lngRpDAO.rpInsert(lngRpVO);
	}
	
	public List<LoungeReplyVO> list(int reply_id) {
		return lngRpDAO.list(reply_id);
	}
}
