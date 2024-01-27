package com.multi.roadpet.lounge;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoungeLikeServicelmpl implements LoungeLikeService {
	
	@Autowired
	LoungeLikeDAO loungeLikeDAO;
	
	@Override
	public int likeInsert(LoungeLikeVO loungeLikeVO) {
		return loungeLikeDAO.likeInsert(loungeLikeVO);	
	}
	
	@Override
	public int likeDelete(LoungeLikeVO loungeLikeVO) {
		return loungeLikeDAO.likeDelete(loungeLikeVO);
	}
	
	@Override
	public int likeCount(int lounge_id) {
		return loungeLikeDAO.likeCount(lounge_id);
	}
	
	@Override
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

}
