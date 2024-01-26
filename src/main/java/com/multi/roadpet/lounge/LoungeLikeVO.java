package com.multi.roadpet.lounge;

public class LoungeLikeVO {
	private int like_id;
	private int user_id;
	private int lounge_id;
	private int likeCnt;
	private String likeState;
	
	public int getLike_id() {
		return like_id;
	}
	public void setLike_id(int like_id) {
		this.like_id = like_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getLounge_id() {
		return lounge_id;
	}
	public void setLounge_id(int lounge_id) {
		this.lounge_id = lounge_id;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	public String getLikeState() {
		return likeState;
	}
	public void setLikeState(String likeState) {
		this.likeState = likeState;
	}
	
	@Override
	public String toString() {
		return "LoungeLikeVO [like_id=" + like_id + ", user_id=" + user_id + ", lounge_id=" + lounge_id + ", likeCnt="
				+ likeCnt + ", likeState=" + likeState + "]";
	}
	
	

	
	
	
}
