package org.mccc.springboard.domain;

import java.util.Date;

public class ReplyVO {

	private int replyNo;
	private int articleNo;
	private String replyWriter;
	private String replyText;
	private Date replyRegdate;
	
	public int getReplyNo() {
		return replyNo;
	}
	
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	
	public int getArticleNo() {
		return articleNo;
	}
	
	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}
	
	public String getReplyWriter() {
		return replyWriter;
	}
	
	public void setReplyWriter(String replyWriter) {
		this.replyWriter = replyWriter;
	}
	
	public String getReplyText() {
		return replyText;
	}
	
	public void setReplyText(String replyText) {
		this.replyText = replyText;
	}
	
	public Date getReplyRegdate() {
		return replyRegdate;
	}
	
	public void setReplyRegdate(Date replyRegdate) {
		this.replyRegdate = replyRegdate;
	}

	@Override
	public String toString() {
		return "ReplyVO [replyNo=" + replyNo + ", articleNo=" + articleNo + ", replyWriter=" + replyWriter
				+ ", replyText=" + replyText + ", replyRegdate=" + replyRegdate + "]";
	}
	
}
