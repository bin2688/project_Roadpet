package com.multi.roadpet.lounge;

public class LoungeLikeVO {
	private int like_id;
	private int member_user_id;
	private int lounge_id;
	
	public int getLike_id() {
		return like_id;
	}
	public void setLike_id(int like_id) {
		this.like_id = like_id;
	}
	public int getMember_user_id() {
		return member_user_id;
	}
	public void setMember_user_id(int member_user_id) {
		this.member_user_id = member_user_id;
	}
	public int getLounge_id() {
		return lounge_id;
	}
	public void setLounge_id(int lounge_id) {
		this.lounge_id = lounge_id;
	}
	
	@Override
	public String toString() {
		return "LoungeLikeVO [like_id=" + like_id + ", member_user_id=" + member_user_id + ", lounge_id=" + lounge_id
				+ "]";
	}
	
	
	
	
}
