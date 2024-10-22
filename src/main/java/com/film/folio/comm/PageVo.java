package com.film.folio.comm;


public class PageVo {
	private int currentPageNo =1;  //요청 페이지 번호
	private int recordCountPerPage =10; // 페이지 당 레코드 수
	private int pageSize=5; // 페이지 수
	private int totalRecordCount; //총 레코드 수 
	
	public int getCurrentPageNo() {
		return currentPageNo;
	}
	public void setCurrentPageNo(int currentPageNo) {
		this.currentPageNo = currentPageNo;
	}
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}
	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalRecordCount() {
		return totalRecordCount;
	}
	public void setTotalRecordCount(int totalRecordCount) {
		this.totalRecordCount = totalRecordCount;
	}
	
	
	//총 페이지 수
	// (총 레코드 수 -1) / (페이지당 레코드 수) +1 
	public int getTotalPageCount() {
		return ((getTotalRecordCount() - 1) / getRecordCountPerPage()) + 1;
	}

	//페이지네이션 페이지리스트의 첫번째 번호
	//(요청페이지 번호 -1) / 페이지 수 * 페이지수 +1
	public int getFirstPageNoOnPageList() {
		return ((getCurrentPageNo() - 1) / getPageSize()) * getPageSize() + 1;
	}
	
	//페이지네이션 페이지리스트의 마지막 번호
	//첫번째 번호 + 페이지수 -1
	//마지막 번호가 전체페이지수 보다 크다면 마지막 번호가 전체페이지수와 같다
	public int getLastPageNoOnPageList() {
		int lastPageNoOnPageList = getFirstPageNoOnPageList() + getPageSize() - 1;
		if (lastPageNoOnPageList > getTotalPageCount()) {
			lastPageNoOnPageList = getTotalPageCount();
		}
		return lastPageNoOnPageList;
	}

	// 몇번째 게시글 부터 가져올건지
	// 요청 페이지 번호 -1 * 페이지당 레코드수
	public int getFirstRecordIndex() {
		return (getCurrentPageNo() - 1) * getRecordCountPerPage();
	
	}
	
	// 몇번째 게시글 부터 가져올건지
	// 요청 페이지 번호 * 페이지당 레코드수
	public int getLastRecordIndex() {
		return getCurrentPageNo() * getRecordCountPerPage();
	}

}
