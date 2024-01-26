package com.multi.roadpet.story;

public class PetStoryVO {
	private int story_no;
	private int story_id;
	private int user_id;
	private String story_title;
	private String story_content;
	private String story_date;
	private String story_photo;
	private int story_private;
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getStory_no() {
		return story_no;
	}
	public void setStory_no(int story_no) {
		this.story_no = story_no;
	}
	public int getStory_id() {
		return story_id;
	}
	public void setStory_id(int story_id) {
		this.story_id = story_id;
	}
	public String getStory_title() {
		return story_title;
	}
	public void setStory_title(String story_title) {
		this.story_title = story_title;
	}
	public String getStory_content() {
		return story_content;
	}
	public void setStory_content(String story_content) {
		this.story_content = story_content;
	}
	public String getStory_date() {
		return story_date;
	}
	public void setStory_date(String story_date) {
		this.story_date = story_date;
	}
	public String getStory_photo() {
		return story_photo;
	}
	public void setStory_photo(String story_photo) {
		this.story_photo = story_photo;
	}
	public int getStory_private() {
		return story_private;
	}
	public void setStory_private(int story_private) {
		this.story_private = story_private;
	}
	@Override
	public String toString() {
		return "PetStoryVO [story_id=" + story_id + ", user_id=" + user_id + ", story_title=" + story_title
				+ ", story_content=" + story_content + ", story_date=" + story_date + ", story_photo=" + story_photo
				+ ", story_private=" + story_private + "]";
	}
	
}
