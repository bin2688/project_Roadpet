package com.multi.roadpet.lounge;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoungeReplyService implements LoungeReplyServiceInterface {
	
	@Autowired
	LoungeReplyDAOInterface lngRpDAO;
	
	@Override
	public int rpInsert(LoungeReplyVO lngRpVO) {
		return lngRpDAO.rpInsert(lngRpVO);
	}
	
	@Override
	public List<LoungeReplyVO> list(int reply_id) {
		return lngRpDAO.list(reply_id);
	}
	
	@Override
	public int rpUpdate(LoungeReplyVO lngRpVO) {
		return lngRpDAO.rpUpdate(lngRpVO);
	}
	
	@Override
	public void rpDelete(LoungeReplyVO lngRpVO) {
		lngRpDAO.rpDelete(lngRpVO);
	}
	
	@Override
	public void rpOne(LoungeReplyVO lngRpVO) {
		lngRpDAO.rpOne(lngRpVO);
	}
	
	@Override
	public int rpCount() {
		return lngRpDAO.rpCount();
	}
}
