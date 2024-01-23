package com.multi.roadpet.lounge;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoungeLikeService {
	
	@Autowired
	LoungeLikeDAO loungeLikeDAO;
	
	public LoungeVO likeInsert(LoungeLikeVO loungeLikeVO) {
		return loungeLikeDAO.likeInsert(loungeLikeVO);
	}
	
	public LoungeVO likeDelete(LoungeLikeVO loungeLikeVO) {
		return loungeLikeDAO.likeDelete(loungeLikeVO);
	}
	
}
