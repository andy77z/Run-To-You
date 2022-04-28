package kr.or.ddit.emp.util;

import java.util.List;

import kr.or.ddit.emp.vo.EmpVO;




public class ArticlePageSoobo {

	private int total;
	private int currentPage;
	private int totalPage;
	private int startPage;
	private int endPage;
	private int pagingCount;
	private List<EmpVO> content;
	private int size;
	
	private int start; // 이전 버튼
	private int end; // 다음 버튼
	


	public ArticlePageSoobo(int total, int currentPage, int size, int pagingCount) {
		super();
		this.total = total;
		this.currentPage = currentPage;
		this.pagingCount = pagingCount;
		this.start = currentPage - pagingCount;
		this.end = currentPage + pagingCount;
		
		
		if(total == 0) {
			totalPage = 0;
			startPage = 0;
			endPage = 0;
		}else {
			totalPage = total/size;
			
			if(total % size > 0) {
				totalPage++;
			}

			if(start <= 0) {
				start = 1;
			}
			if(end >= totalPage) {
				end = totalPage;
			}
			
			startPage = currentPage / pagingCount * pagingCount + 1;
			if(currentPage % pagingCount == 0) {
				startPage -= pagingCount;
			}
			
			endPage = startPage + (pagingCount - 1);
			if(endPage > totalPage) {
				endPage = totalPage;
			}
		}
	}
	
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getPagingCount() {
		return pagingCount;
	}
	public void setPagingCount(int pagingCount) {
		this.pagingCount = pagingCount;
	}
	public List<EmpVO> getContent() {
		return content;
	}
	public void setContent(List<EmpVO> content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "ArticlePage [total=" + total + ", currentPage=" + currentPage + ", totalPage=" + totalPage
				+ ", startPage=" + startPage + ", endPage=" + endPage + ", pagingCount=" + pagingCount + ", content="
				+ content + ", size=" + size + ", start=" + start + ", end=" + end + "]";
	}
	
	
}
