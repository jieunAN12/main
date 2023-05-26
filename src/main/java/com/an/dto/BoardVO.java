package com.an.dto;

import java.util.Date;

public class BoardVO {
	
	private int bno;
	private String title;
	private String bcontent;
	private String writer;
	private String userName;
	private Date regdate;
	private int viewcnt;
	private int recnt;
	
	public BoardVO() {
		super();
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public int getRecnt() {
		return recnt;
	}

	public void setRecnt(int recnt) {
		this.recnt = recnt;
	}

	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", title=" + title + ", bcontent=" + bcontent + ", writer=" + writer
				+ ", userName=" + userName + ", regdate=" + regdate + ", viewcnt=" + viewcnt + ", recnt=" + recnt + "]";
	}

}
