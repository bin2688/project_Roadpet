package com.multi.roadpet.lounge;

import java.util.HashMap;
import java.util.List;

public interface LoungeService {

	void insert(LoungeVO loungeVO);

	void updateSend(LoungeVO loungeVO);

	void delete(LoungeVO loungeVO);

	List<LoungeVO> list(HashMap<String, Object> loungeMap);

	LoungeVO detail(LoungeVO loungeVO);

	int pageCount(String keyWord, String searchType);
	
	List<LoungeVO> bestList(LoungeVO loungeVO);

}