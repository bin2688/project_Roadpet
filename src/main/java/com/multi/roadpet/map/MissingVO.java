package com.multi.roadpet.map;

public class MissingVO {

	private int missing_id;
	private String user_phone;
	private String pet_name;
	private int pet_age;
	private char pet_sex;
	private String pet_type;
	private String pet_img;
	private double lat; // location(POINT X)
	private double lon; // location(POINT Y)
	private String location_explain;
	private String missing_time;
	private String missing_notice;

	
	public int getMissing_id() {
		return missing_id;
	}

	public void setMissing_id(int missing_id) {
		this.missing_id = missing_id;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getPet_name() {
		return pet_name;
	}

	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}

	public int getPet_age() {
		return pet_age;
	}

	public void setPet_age(int pet_age) {
		this.pet_age = pet_age;
	}

	public char getPet_sex() {
		return pet_sex;
	}

	public void setPet_sex(char pet_sex) {
		this.pet_sex = pet_sex;
	}

	public String getPet_type() {
		return pet_type;
	}

	public void setPet_type(String pet_type) {
		this.pet_type = pet_type;
	}

	public String getPet_img() {
		return pet_img;
	}

	public void setPet_img(String savedName) {
		this.pet_img = savedName;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLon() {
		return lon;
	}
	public void setLon(double lon) {
		this.lon = lon;
	}

	public String getLocation_explain() {
		return location_explain;
	}

	public void setLocation_explain(String location_explain) {
		this.location_explain = location_explain;
	}

	public String getMissing_time() {
		return missing_time;
	}

	public void setMissing_time(String missing_time) {
		this.missing_time = missing_time;
	}

	public String getMissing_notice() {
		return missing_notice;
	}

	public void setMissing_notice(String missing_notice) {
		this.missing_notice = missing_notice;
	}

	@Override
	public String toString() {
		return "MissingVO [missing_id=" + missing_id + ", user_phone=" + user_phone + ", pet_name=" + pet_name + ", pet_age=" + pet_age + ", pet_sex=" + pet_sex + ", pet_type=" + pet_type + ", pet_img=" + pet_img + ", lat=" + lat + ", lon=" + lon + ", location_explain=" + location_explain + ", missing_time=" + missing_time + ", missing_notice=" + missing_notice + "]";
	}

}