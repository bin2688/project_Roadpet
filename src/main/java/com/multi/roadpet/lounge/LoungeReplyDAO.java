package com.multi.roadpet.lounge;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoungeReplyDAO implements LoungeReplyDAOInterface {
		
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
		public void rpDelete(LoungeReplyVO lngRpVO) {
			my.delete("loungeReply.delete", lngRpVO);
		}
		
		@Override
		public void rpOne(LoungeReplyVO lngRpVO) {
			my.selectOne("loungeReply.one", lngRpVO);
		}
		
		@Override
		public int rpCount() {
			return my.selectOne("loungeReply.count");
		}
}
