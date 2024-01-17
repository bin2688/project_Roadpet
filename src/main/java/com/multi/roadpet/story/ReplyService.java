package com.multi.roadpet.story;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyService {
	
	@Autowired
	ReplyDAO dao;
	
	public int insert(ReplyVO replyVO) {
		return dao.insert(replyVO);
	}
	public List<ReplyVO> list(int story_id){
		return dao.list(story_id);
	}
}
