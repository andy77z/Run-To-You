package kr.or.ddit.notification.vo;

import lombok.Data;

@Data
public class NotificationVO {
	private int notNo;		//알림번호
	private String empCd;	//직원코드
	private String cmCd;	//공통코드
	private String pntCd;	//환자코드
	private int notYn;		//알림여부
	private int chkYn;		//확인여부
	private String notUrl;	//클릭 URL
	private String notDt;	//알림일시에서 현재까지 경과시간 (초)
	
	private String pntNm;   //환자명
	
	private String cdNm;	//공통코드 명
	private String cdEx;	//공통코드 설명
	private String opt;	//공통코드 옵션
}
