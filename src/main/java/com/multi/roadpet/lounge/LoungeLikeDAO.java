package com.multi.roadpet.lounge;


public interface LoungeLikeDAO {

	int likeInsert(LoungeLikeVO loungeLikeVO);

	int likeDelete(LoungeLikeVO loungeLikeVO);

	int likeCount(int lounge_id);

	LoungeLikeVO likeCheck(int user_id, int lounge_id);


}