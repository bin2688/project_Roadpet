package com.multi.roadpet.pet;




public class PetWalkVO {

	private int pet_id;
	private String pet_name;
	private int walk_id;
	private String walk_date;
	private int walk_time;
	private int walk_distance ;
	private int user_id;
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getPet_id() {
		return pet_id;
	}
	public void setPet_id(int pet_id) {
		this.pet_id = pet_id;
	}
	
	public String getPet_name() {
		return pet_name;
	}
	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}
	public int getWalk_id() {
		return walk_id;
	}
	public void setWalk_id(int walk_id) {
		this.walk_id = walk_id;
	}
	
	public int getWalk_time() {
		return walk_time;
	}
	public void setWalk_time(int walk_time) {
		this.walk_time = walk_time;
	}
	public String getWalk_date() {
		return walk_date;
	}
	public void setWalk_date(String walk_date) {
		this.walk_date = walk_date;
	}
	
	public int getWalk_distance() {
		return walk_distance;
	}
	public void setWalk_distance(int walk_distance) {
		this.walk_distance = walk_distance;
	}
	@Override
	public String toString() {
		return "PetWalkVO [pet_id=" + pet_id + ", pet_name=" + pet_name + ", walk_id=" + walk_id + ", walk_date="
				+ walk_date + ", walk_time=" + walk_time + ", walk_distance=" + walk_distance + "]";
	}
	
	


	
	
}
