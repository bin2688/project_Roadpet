package com.multi.roadpet.lounge;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoungeLikeDAOlmpl implements LoungeLikeDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	@Override
	public int likeInsert(LoungeLikeVO loungeLikeVO) {
		return my.insert("loungeLike.insert", loungeLikeVO);
			
	}
	
	@Override
	public int likeDelete(LoungeLikeVO loungeLikeVO) {    
		return my.delete("loungeLike.delete", loungeLikeVO);

	}
	
	@Override
	public int likeCount(int lounge_id) {
		return my.selectOne("loungeLike.likeCount", lounge_id);
	}
	
	@Override
	public LoungeLikeVO likeCheck(int user_id, int lounge_id) {
		Map<String, Integer> likeCheckMap  = new HashMap<>();
		likeCheckMap.put("lounge_id", lounge_id);
		likeCheckMap.put("user_id", user_id);	
		return my.selectOne("loungeLike.likeCheck", likeCheckMap);
	}
	

}
