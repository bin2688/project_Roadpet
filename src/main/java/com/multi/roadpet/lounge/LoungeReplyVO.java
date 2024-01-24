package com.multi.roadpet.lounge;

import java.util.Date;

public class LoungeReplyVO {
	private int reply_id;
	private int reply_oriid;
	private int user_id;
	private String reply_content;
	private String reply_date;
	
	public int getReply_id() {
		return reply_id;
	}
	public void setReply_id(int reply_id) {
		this.reply_id = reply_id;
	}
	public int getReply_oriid() {
		return reply_oriid;
	}
	public void setReply_oriid(int reply_oriid) {
		this.reply_oriid = reply_oriid;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getReply_date() {
		return reply_date;
	}
	public void setReply_date(Date reply_date) {
		this.reply_date = LoungeTimeDisplay.TimeCondition(reply_date);
	}
	
	@Override
	public String toString() {
		return "LoungeReplyVO [reply_id=" + reply_id + ", reply_oriid=" + reply_oriid + ", user_id="
				+ user_id + ", reply_content=" + reply_content + ", reply_date=" + reply_date + "]";
	}

	
	
	
}
