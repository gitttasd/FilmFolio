package com.film.folio.diaryRepl;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class DiaryReplVo {
	
	//댓글번호
	private String diaryReplId;
	//댓글 작성자
	private String diaryReplUser;
	//댓글 내용
	private String diaryReplContent;
	//댓글 쓴 날짜
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date diaryReplAt;
	//댓글공개여부
	private String diaryReplOpen;
	//댓글삭제여부
	private String diaryReplDel;
	//게시판 번호
	private String diaryId;
	
	public String getDiaryReplId() {
		return diaryReplId;
	}
	public void setDiaryReplId(String diaryReplId) {
		this.diaryReplId = diaryReplId;
	}
	public String getDiaryReplUser() {
		return diaryReplUser;
	}
	public void setDiaryReplUser(String diaryReplUser) {
		this.diaryReplUser = diaryReplUser;
	}
	public String getDiaryReplContent() {
		return diaryReplContent;
	}
	public void setDiaryReplContent(String diaryReplContent) {
		this.diaryReplContent = diaryReplContent;
	}
	public Date getDiaryReplAt() {
		return diaryReplAt;
	}
	public void setDiaryReplAt(Date diaryReplAt) {
		this.diaryReplAt = diaryReplAt;
	}
	public String getDiaryReplOpen() {
		return diaryReplOpen;
	}
	public void setDiaryReplOpen(String diaryReplOpen) {
		this.diaryReplOpen = diaryReplOpen;
	}
	public String getDiaryReplDel() {
		return diaryReplDel;
	}
	public void setDiaryReplDel(String diaryReplDel) {
		this.diaryReplDel = diaryReplDel;
	}
	
	
	
}
