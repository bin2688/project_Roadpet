package com.multi.roadpet.lounge;

import java.util.List;

public interface LoungeReplyDAO {

	int rpInsert(LoungeReplyVO lngRpVO);

	List<LoungeReplyVO> list(int reply_id);

	int rpUpdate(LoungeReplyVO lngRpVO);

	int rpDelete(LoungeReplyVO lngRpVO);

}