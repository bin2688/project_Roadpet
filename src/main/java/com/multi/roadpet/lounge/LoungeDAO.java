package com.multi.roadpet.lounge;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoungeDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public void insert(LoungeVO loungeVO) {
		my.insert("lounge.insert", loungeVO);
	}
	
	public void update(LoungeVO loungeVO) {
		my.update("lounge.update", loungeVO);
	}
	
	public void delete(LoungeVO loungeVO) {
		my.delete("lounge.delete", loungeVO);
	}
	
	public List<LoungeVO> list(LoungePageVO loungePageVO) {
		return my.selectList("lounge.list", loungePageVO);				 
	}
	
	public LoungeVO one(LoungeVO loungeVO) {
		return my.selectOne("lounge.one", loungeVO);
	}
	
	public int countAll() {
		 return my.selectOne("lounge.countAll");
		}
	
	public int countSearch(String keyWord, String searchType) {
	    Map<String, Object> searchMap = new HashMap<>();
	    searchMap.put("keyWord", keyWord);
	    searchMap.put("searchType", searchType);
	    
		return my.selectOne("lounge.countSearch", searchMap);
		}

}
