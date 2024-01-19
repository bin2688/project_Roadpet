package com.multi.roadpet.lounge;

import java.util.List;

public interface LoungeReplyServiceInterface {

	int rpInsert(LoungeReplyVO lngRpVO);

	List<LoungeReplyVO> list(int reply_id);

	int rpUpdate(LoungeReplyVO lngRpVO);

	int rpDelete(LoungeReplyVO lngRpVO);

	void rpOne(LoungeReplyVO lngRpVO);

}