package com.film.folio.diary;

import java.util.Date;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Past;
import org.springframework.format.annotation.DateTimeFormat;

import com.film.folio.comm.CheckInt;
import com.film.folio.movie.MovieVo;

public class DiaryVo extends MovieVo{
	
	//일기 id
	private String diaryId;
	
	//시청 날짜
	@Past
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date watchDate;
	
	//별점
	//@Min(value = 0) @Max(value = 5) 
	@CheckInt
	private int rating;
	
	//일기 제목
	@NotBlank
	private String title;
	
	//일기 내용
	@NotBlank
	private String content;
	
	//일기 쓴 날짜
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date reviewAt;
	
	//공개여부
	private String openAt;
	
	//일기삭제여부
	private String delAt;
	
	
	public String getDiaryId() {
		return diaryId;
	}
	public void setDiaryId(String diaryId) {
		this.diaryId = diaryId;
	}
	public Date getWatchDate() {
		return watchDate;
	}
	public void setWatchDate(Date watchDate) {
		this.watchDate = watchDate;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReviewAt() {
		return reviewAt;
	}
	public void setReviewAt(Date reviewAt) {
		this.reviewAt = reviewAt;
	}
	public String getOpenAt() {
		return openAt;
	}
	public void setOpenAt(String openAt) {
		this.openAt = openAt;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDelAt() {
		return delAt;
	}
	public void setDelAt(String delAt) {
		this.delAt = delAt;
	}
	
}
