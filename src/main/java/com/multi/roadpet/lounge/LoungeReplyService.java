package com.multi.roadpet.lounge;

import java.util.List;

public interface LoungeReplyService {

	int rpInsert(LoungeReplyVO lngRpVO);

	List<LoungeReplyVO> list(int reply_id);

	int rpUpdate(LoungeReplyVO lngRpVO);

	int rpDelete(LoungeReplyVO lngRpVO);


}