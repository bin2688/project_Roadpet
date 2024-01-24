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
			return my.selectOne("lounge.one", new LoungeVO(loungeLikeVO.getLounge_id(), loungeLikeVO.getUser_id()));
		} else {
			return null;
		}
	}
	
	public LoungeVO likeDelete(LoungeLikeVO loungeLikeVO) {
		int deleteResult = my.delete("loungeLike.delete", loungeLikeVO);	    
	    System.out.println("deleteResult :" + deleteResult);
		if (deleteResult > 0 ) {	        
	        return new LoungeVO(); 
	    } else {	        
	        return null;
	    }	
	}
	
}
