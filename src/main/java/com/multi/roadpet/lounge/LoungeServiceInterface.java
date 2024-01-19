package com.multi.roadpet.lounge;

import java.util.List;

public interface LoungeServiceInterface {

	void insert(LoungeVO loungeVO);

	void update(LoungeVO loungeVO);

	void delete(LoungeVO loungeVO);

	List<LoungeVO> list(LoungePageVO loungePageVO);

	LoungeVO one(LoungeVO loungeVO);

	int pageCount(String keyWord, String searchType);

}