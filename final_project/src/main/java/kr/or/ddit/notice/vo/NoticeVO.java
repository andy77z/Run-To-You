package kr.or.ddit.notice.vo;

import org.hibernate.validator.constraints.NotBlank;

import lombok.Data;

@Data
public class NoticeVO {
	
	// 공지사항 번호
	private String ntcNo;
	// 제목
	@NotBlank
	private String title;
	// 내용
	@NotBlank
	private String content;
	// 작성자
	private String writer;
	// 공개 범위
	private String privBounds;
	// 삭제 여부
	private int delYn;
	// 최초 등록 일
	private String firstRegDt;
	// 최근 수정 일
	private String lastMdfyDt;
	// 조회 수
	private int hits;
	
	private String viewFRegDt;
	private String viewLMdfyDt;
	
	public String viewFirstRegDt() {
		String regDt = this.firstRegDt.substring(0, 8);
		return regDt.substring(0, 4) + "-" + regDt.substring(4, 6) + "-" + regDt.substring(6);
	}
	
	public String viewLastMdfyDt() {
		String mdfyDt = this.lastMdfyDt.substring(0, 8);
		return mdfyDt.substring(0, 4) + "-" + mdfyDt.substring(0, 4) + "-" + mdfyDt.substring(6);
	}
	
}
