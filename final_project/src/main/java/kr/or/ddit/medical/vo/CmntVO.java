package kr.or.ddit.medical.vo;

import lombok.Data;

@Data
public class CmntVO {
	private String pntCd; // 환자 코드
	private String empCd; // 코멘트 작성자
	private String empNm; // 코멘트 작성자
	private String cmntNo; // 코멘트 번호
	private String cmntDt; // 코멘트 작성일시
	private String cmntDate; // 코멘트 작성일
	private String cmntTime; // 코멘트 작성시
	private String cmntCont; // 코멘트 내용
	private int cmntFixYn; // 코멘트 고정여부
	private String rsvtNo; // 예약번호
}
