package com.multi.roadpet.map;

public class ShelterVO {
	private String careNm; // 동물보호센터명
	private String orgNm; // 관리기관명
	private String divisionNm; // 동물보호센터유형
	private String saveTrgtAnimal; // 구조대상동물
	private String careAddr; // 소재지도로명주소
	private double lat; // 위도
	private double lng; // 경도
	private String weekOprStime; // 평일 운영 시작시간
	private String weekOprEtime; // 평일 운영 종료시간
	private String closeDay; // 휴무일
	private String careTel; // 전화번호

	public String getCareNm() {
		return careNm;
	}

	public void setCareNm(String careNm) {
		this.careNm = careNm;
	}

	public String getOrgNm() {
		return orgNm;
	}

	public void setOrgNm(String orgNm) {
		this.orgNm = orgNm;
	}

	public String getDivisionNm() {
		return divisionNm;
	}

	public void setDivisionNm(String divisionNm) {
		this.divisionNm = divisionNm;
	}

	public String getSaveTrgtAnimal() {
		return saveTrgtAnimal;
	}

	public void setSaveTrgtAnimal(String saveTrgtAnimal) {
		this.saveTrgtAnimal = saveTrgtAnimal;
	}

	public String getCareAddr() {
		return careAddr;
	}

	public void setCareAddr(String careAddr) {
		this.careAddr = careAddr;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLng() {
		return lng;
	}

	public void setLng(double lng) {
		this.lng = lng;
	}

	public String getWeekOprStime() {
		return weekOprStime;
	}

	public void setWeekOprStime(String weekOprStime) {
		this.weekOprStime = weekOprStime;
	}

	public String getWeekOprEtime() {
		return weekOprEtime;
	}

	public void setWeekOprEtime(String weekOprEtime) {
		this.weekOprEtime = weekOprEtime;
	}

	public String getCloseDay() {
		return closeDay;
	}

	public void setCloseDay(String closeDay) {
		this.closeDay = closeDay;
	}

	public String getCareTel() {
		return careTel;
	}

	public void setCareTel(String careTel) {
		this.careTel = careTel;
	}

	@Override
	public String toString() {
		return "ShelterVO [careNm=" + careNm + ", orgNm=" + orgNm + ", divisionNm=" + divisionNm + ", saveTrgtAnimal=" + saveTrgtAnimal + ", careAddr=" + careAddr + ", lat=" + lat + ", lng=" + lng + ", weekOprStime=" + weekOprStime + ", weekOprEtime=" + weekOprEtime + ", closeDay=" + closeDay + ", careTel=" + careTel + "]";
	}
}
