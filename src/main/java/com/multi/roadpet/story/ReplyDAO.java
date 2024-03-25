package com.multi.roadpet.story;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAO {
	
	@Autowired
	SqlSessionTemplate my;


	public int insert(ReplyVO replyVO) {
		return my.insert("reply.create",replyVO);

	}
	// 리스트 전체 보기
	public List<ReplyVO> list(int reply_id) {
		return my.selectList("reply.list", reply_id);
	   }
	 


}
