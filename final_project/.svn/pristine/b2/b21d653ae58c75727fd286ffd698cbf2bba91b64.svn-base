package kr.or.ddit.operation;

import java.util.List;


import kr.or.ddit.operation.vo.OperTeamVO;

//페이징 처리를 위한 클래스
//게시글 데이터와 페이징 관련 정보를 담고 있음
public class ArticlePage {
	//페이징 관련 멤버변수
	//전체 글의 행의 수
	private int total;
	//현재 페이지 번호
	private int currentPage;
	//전체 페이지 개수
	private int totalPages;
	//시작 페이지 번호
	private int startPage;
	//종료 페이지 번호
	private int endPage;
	//페이징의 개수
	private int pagingCount;
	//게시글 데이터
	private List<OperTeamVO> content;
	//생성자
	//size : 한 화면에 보여질 행의 수
	public ArticlePage(int total, int currentPage, int size, int pagingCount,
			List<OperTeamVO> content) {
		this.total = total;
		this.currentPage = currentPage;
		this.content = content;
		this.pagingCount = pagingCount;
		
		if(total == 0) {//select 결과가 없다면..
			totalPages = 0;
			startPage = 0;
			endPage = 0;
		}else { //select 결과가 있을 때..
			//전체 페이지 개수 구하기(전체 글의 수 / 한 화면에 보여질 행의 수)
			//정수와 정수의 나눗셈의 결과는 정수이므로 13 / 7 => 1
			totalPages = total / size;
			//보정해줘야 할 경우는? 15 / 7 = 2 경우 처럼 나머자가 0보다 클 때 
			if(total % size>0) {
				//전체 페이지수를 1 증가 처리
				totalPages++;
			}
			
			//startPage : 이전 [1] [2] [3] [4] [5] 다음 일 때 1을 의미
			//공식 : startPage = 현재페이지 / 페이징의 개수 * 페이징의 개수 + 1;
			startPage = currentPage / pagingCount * pagingCount + 1;
			//보정해줘야 할 경우는? 5 / 5 * 5 + 1 => 6 경우처럼 
			//				현재페이지 % 5 == 0 일 때
			if(currentPage%pagingCount==0) {
				//startPage = startPage - 5(페이징의 개수);
				startPage -= pagingCount;
			}
			
			//endPage   : 이전 [1] [2] [3] [4] [5] 다음 일 때 5을 의미
			endPage = startPage + (pagingCount-1);
			//보정해줘야 할 경우는? endPage 5 > totalPages 3 일 때
			//				  endPage 5를 totalPages 3로 바꿔줘야 함
			if(endPage > totalPages) {
				endPage = totalPages;
			}
		}//end outer if
	}
	
	//전체 행의 수를 리턴
	public int getTotal() {
		return this.total;
	}
	
	//select결과가 없는가? 체킹 : true면 결과가 없다는 의미
	public boolean hasNoArticles() {
		return this.total == 0;
	}
	
	//select결과가 있는가? 체킹 : true면 결과가 있다는 의미
	public boolean hasArticles() {
		return this.total > 0;
	}
	
	//현재 페이지 번호 리턴
	public int getCurrentPage() {
		return this.currentPage;
	}
	
	//전체 페이지의 개수 리턴
	public int getTotalPages() {
		return totalPages;
	}
	
	//데이터 VO List 리턴
	public List<OperTeamVO> getContent(){
		return this.content;
	}
	
	//목록 하단의 시작 번호를 리턴
	public int getStartPage() {
		return this.startPage;
	}
	
	//목록 하단의 종료 번호를 리턴
	public int getEndPage() {
		return this.endPage;
	}
}





