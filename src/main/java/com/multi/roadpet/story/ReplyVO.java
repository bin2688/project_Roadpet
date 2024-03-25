package com.multi.roadpet.story;

public class ReplyVO {
	private int reply_id;
	private int reply_oriid;
	private String reply_user_id;
	private String reply_content;
	private String reply_create;
	
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
	public String getReply_user_id() {
		return reply_user_id;
	}
	public void setReply_user_id(String reply_user_id) {
		this.reply_user_id = reply_user_id;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public String getReply_create() {
		return reply_create;
	}
	public void setReply_create(String reply_create) {
		this.reply_create = reply_create;
	}
	@Override
	public String toString() {
		return "ReplyVO [reply_id=" + reply_id + ", reply_oriid=" + reply_oriid + ", reply_user_id=" + reply_user_id
				+ ", reply_content=" + reply_content + ", reply_create=" + reply_create + "]";
	}
	
	
	
}
