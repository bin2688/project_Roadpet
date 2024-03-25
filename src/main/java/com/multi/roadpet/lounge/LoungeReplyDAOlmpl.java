package com.multi.roadpet.lounge;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoungeReplyDAOlmpl implements LoungeReplyDAO {
		
		@Autowired
		SqlSessionTemplate my;
		
		@Override
		public int rpInsert(LoungeReplyVO lngRpVO) {
			 return my.insert("loungeReply.insert", lngRpVO);
		}
		
		@Override
		public List<LoungeReplyVO> list(int reply_id) {
			return my.selectList("loungeReply.list", reply_id);
		
		}
		
		@Override
		public int rpUpdate(LoungeReplyVO lngRpVO) {
			return my.update("loungeReply.update", lngRpVO);
		}
		
		@Override
		public int rpDelete(LoungeReplyVO lngRpVO) {
			return my.delete("loungeReply.delete", lngRpVO);
		}
		
		
}
