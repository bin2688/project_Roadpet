package com.multi.roadpet.lounge;

import java.util.List;

public interface LoungeReplyDAOInterface {

	int rpInsert(LoungeReplyVO lngRpVO);

	List<LoungeReplyVO> list(int reply_id);

	int rpUpdate(LoungeReplyVO lngRpVO);

	void rpDelete(LoungeReplyVO lngRpVO);

	void rpOne(LoungeReplyVO lngRpVO);

	int rpCount();

}