package com.multi.roadpet.lounge;

import java.util.HashMap;
import java.util.List;

public interface LoungeDAO {

	void insert(LoungeVO loungeVO);

	void updateSend(LoungeVO loungeVO);

	void delete(LoungeVO loungeVO);

	List<LoungeVO> list(HashMap<String, Object> loungeMap);

	LoungeVO detail(LoungeVO loungeVO);

	int countAll();

	int countSearch(String keyWord, String searchType);
	
	void replyCount(int lounge_id, int rpCntUpDown);
	
	List<LoungeVO> bestList(LoungeVO loungeVO);

}