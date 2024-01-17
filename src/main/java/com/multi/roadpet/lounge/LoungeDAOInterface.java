package com.multi.roadpet.lounge;

import java.util.List;

public interface LoungeDAOInterface {

	void insert(LoungeVO loungeVO);

	void update(LoungeVO loungeVO);

	void delete(LoungeVO loungeVO);

	List<LoungeVO> list(LoungePageVO loungePageVO);

	LoungeVO one(LoungeVO loungeVO);

	int countAll();

	int countSearch(String keyWord, String searchType);
	
	void replyCount(int lounge_id);

}