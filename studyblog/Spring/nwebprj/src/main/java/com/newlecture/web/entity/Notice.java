package com.newlecture.web.entity;

import java.util.Date;

public class Notice {
	
	private int id;
	private String title;
	private String writerId;
	private Date regDate;
	private String content;
	private int hit;
	private String files;
	
	//초기화를 하며 값을 채우기 위해 기본 생성자
	public Notice() {
		
	}
	
	//필드를 갖는 생성자
	public Notice(int id, String title, String writerId, Date regDate, String content, int hit, String files) {
		super();
		this.id = id;
		this.title = title;
		this.writerId = writerId;
		this.regDate = regDate;
		this.content = content;
		this.hit = hit;
		this.files = files;
	}


	//getter setter
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriterId() {
		return writerId;
	}
	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getFiles() {
		return files;
	}

	public void setFiles(String files) {
		this.files = files;
	}
	
	

}
