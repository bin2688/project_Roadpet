package com.multi.roadpet.lounge;

import java.util.Date;

public class LoungeTimeDisplay {
	
	private static class Time {
		public static final int sec = 60;
		public static final int min = 60;
		public static final int hour = 24;
		public static final int	day = 30;
		public static final int month = 12;
		public static final int year = 12;
	}
	
	public static String TimeCondition(Date date) {
		long timeNow = System.currentTimeMillis();
		long insTime = date.getTime();
		long difTime = (timeNow - insTime) / 1000;
		String displayTime = null;
		if (difTime < Time.sec) { 
			displayTime = "방금 전"; //60초 미만
		} else if ((difTime /= Time.sec) < Time.min) {
			displayTime = difTime + "분 전"; //60분 미만
		} else if ((difTime /= Time.min) < Time.hour) {
			displayTime = (difTime) + "시간 전"; //24시간 미만
		} else if ((difTime /= Time.hour) < Time.day) {
			displayTime = (difTime) + "일 전"; //30일 미만
		} else if ((difTime /= Time.day) < Time.month) {
			displayTime = (difTime) + "달 전"; //12개월 미만
		} else if ((difTime /= Time.month) < Time.year) {
			displayTime = (difTime) + "년 전"; //12년 미만
		} else {
			displayTime = "오래 전";
		}
		return displayTime;		
	}
	
}
