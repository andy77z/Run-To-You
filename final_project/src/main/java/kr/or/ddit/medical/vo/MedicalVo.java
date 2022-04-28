package kr.or.ddit.medical.vo;

import java.util.List;

import lombok.Data;

@Data
public class MedicalVo {
	private String pntCd; // 환자 코드
	private String rsvtRegDt; // 예약 날짜
	private String rsvtRegTime; // 예약 시간
	private String pntNm; // 환자 이름
	private String empCd; // 코멘트 작성자
	private String pntHp; // 환자 전화번호
	private String pntPrno; // 환자 주민번호
	private String addr; // 환자주소
	private String stateCd; // 환자 상태
	private String age; // 환자 나이
	private String symptoms; // 증상
	private String rsvtNo; // 예약 번호
	private String sex; // 환자 성별
	private String base64img; // base64 인코딩 값
	private String fileNo; // 파일 번호
	private String fileNm; // 파일명
	private String fileCls; // 파일 분류
	private String rcptNo; // 접수번호
	private List<CmntVO> cmnt; // 코멘트 리스트
}
