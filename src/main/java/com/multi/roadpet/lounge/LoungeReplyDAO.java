package com.multi.roadpet.lounge;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoungeReplyDAO {
		
		@Autowired
		SqlSessionTemplate my;
		
		public int rpInsert(LoungeReplyVO lngRpVO) {
			 return my.insert("loungeReply.insert", lngRpVO);
		}
		
		public List<LoungeReplyVO> list(int reply_id) {
			return my.selectList("loungeReply.list", reply_id);
		
		}
}
