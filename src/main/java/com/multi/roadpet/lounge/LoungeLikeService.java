package com.multi.roadpet.lounge;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoungeLikeService {
	
	@Autowired
	LoungeLikeDAO loungeLikeDAO;
	
	public int likeInsert(LoungeLikeVO loungeLikeVO) {
		return loungeLikeDAO.likeInsert(loungeLikeVO);
	
	}
	
	public int likeDelete(LoungeLikeVO loungeLikeVO) {
		return loungeLikeDAO.likeDelete(loungeLikeVO);
	}
	
	public int likeCount(int lounge_id) {
		return loungeLikeDAO.likeCount(lounge_id);
	}
	
	public LoungeLikeVO likeCheck(int user_id, int lounge_id) {
		LoungeLikeVO likeState = loungeLikeDAO.likeCheck(user_id, lounge_id);
		 if(likeState == null) {
			  	likeState = new LoungeLikeVO();
		        likeState.setUser_id(user_id);
		        likeState.setLounge_id(lounge_id);
		        likeState.setLikeState("off");
		 }
		return likeState;
	}

	public List<LoungeLikeVO> likeCountAll(LoungeLikeVO loungeLikeVO) {
		return loungeLikeDAO.likeCountAll(loungeLikeVO);
	}
}
