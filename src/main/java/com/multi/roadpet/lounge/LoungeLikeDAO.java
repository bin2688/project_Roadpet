package com.multi.roadpet.lounge;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoungeLikeDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public LoungeVO likeInsert(LoungeLikeVO loungeLikeVO) {
		if(my.insert("loungeLike.insert", loungeLikeVO) == 1) {
			return my.selectOne("lounge.one", new LoungeVO(loungeLikeVO.getLounge_id(), loungeLikeVO.getMember_user_id()));
		} else {
			return null;
		}
	}
	
	public LoungeVO likeDelete(LoungeLikeVO loungeLikeVO) {
		int deleteResult = my.delete("loungeLike.delete", loungeLikeVO);	    
	    if (deleteResult == 1) {	        
	        return new LoungeVO(); 
	    } else {	        
	        return null;
	    }	
	}
	
}
