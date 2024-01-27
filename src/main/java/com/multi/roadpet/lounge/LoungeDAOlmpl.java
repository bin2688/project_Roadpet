package com.multi.roadpet.lounge;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoungeDAOlmpl implements LoungeDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	@Override
	public void insert(LoungeVO loungeVO) {
		my.insert("lounge.insert", loungeVO);
	}
	
	@Override
	public void update(LoungeVO loungeVO) {
		my.update("lounge.update", loungeVO);
	}
	
	@Override
	public void delete(LoungeVO loungeVO) {
		my.delete("lounge.delete", loungeVO);
	}
	
	@Override
	public List<LoungeVO> list(HashMap<String, Object> loungeMap) {
		return my.selectList("lounge.list", loungeMap);				 
	}
	
	@Override
	public LoungeVO one(LoungeVO loungeVO) {
		return my.selectOne("lounge.one", loungeVO);
	}
	
	@Override
	public int countAll() {
		 return my.selectOne("lounge.countAll");
		}
	
	@Override
	public int countSearch(String keyWord, String searchType) {
	    Map<String, Object> searchMap = new HashMap<>();
	    searchMap.put("keyWord", keyWord);
	    searchMap.put("searchType", searchType);
	    
		return my.selectOne("lounge.countSearch", searchMap);
		}
	
	@Override
	public void replyCount(int lounge_id, int rpCntUpDown) {
		Map<String, Object> rpCntMap  = new HashMap<>();
		rpCntMap.put("lounge_id", lounge_id);
		rpCntMap.put("rpCntUpDown", rpCntUpDown);
		my.update("lounge.replyCount",rpCntMap);
	}
	
	@Override
	public List<LoungeVO> bestList(LoungeVO loungeVO) {
		return my.selectList("lounge.bestList", loungeVO);
	}

}
