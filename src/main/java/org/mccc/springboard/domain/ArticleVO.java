package org.mccc.springboard.domain;

import java.util.Date;

public class ArticleVO {

	private int articleNo;
	private String title;
	private String content;
	private String writer;
	private Date articleRegDate;
	private int hit;
	private int replyCnt;

	public int getArticleNo() {
		return articleNo;
	}

	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getArticleRegDate() {
		return articleRegDate;
	}

	public void setArticleRegDate(Date articleRegDate) {
		this.articleRegDate = articleRegDate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}
	
	public int getReplyCnt() {
		return replyCnt;
	}

	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}
	
	@Override
	public String toString() {
		return "ArticleVO [articleNo=" + articleNo + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", articleRegDate=" + articleRegDate + ", hit=" + hit + ", replyCnt=" + replyCnt + "]";
	}
    
}
