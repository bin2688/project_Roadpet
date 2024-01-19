package com.multi.roadpet.story;

public class PetStoryMapVO {
	private double lat;
	private double lon;
	private String location;

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
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	@Override
	public String toString() {
		return "MapVO [lat=" + lat + ", lon=" + lon + ", location=" + location + "]";
	}
	
	
	
	
}
