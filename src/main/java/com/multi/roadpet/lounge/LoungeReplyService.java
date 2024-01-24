package com.multi.roadpet.lounge;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class LoungeReplyService implements LoungeReplyServiceInterface {
	
	@Autowired
	LoungeReplyDAOInterface lngRpDAO;
	
	@Autowired
	LoungeDAOInterface loungeDAO;
	
	@Override
	@Transactional
	public int rpInsert(LoungeReplyVO lngRpVO) {
				int result = lngRpDAO.rpInsert(lngRpVO);
		        if (result == 1) {        
		            int lounge_id = lngRpVO.getReply_oriid();
		            loungeDAO.replyCount(lounge_id, 1);
		        } 
		        return result;  
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
	public int rpDelete(LoungeReplyVO lngRpVO) {
		int result = lngRpDAO.rpDelete(lngRpVO);
		if (result == 1) {
			int lounge_id = lngRpVO.getReply_oriid();
			loungeDAO.replyCount(lounge_id, -1);	
		}
		return result;
	}
	
	@Override
	public void rpOne(LoungeReplyVO lngRpVO) {
		lngRpDAO.rpOne(lngRpVO);
	}
	
}
