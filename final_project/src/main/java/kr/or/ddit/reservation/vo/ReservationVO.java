package kr.or.ddit.reservation.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@AllArgsConstructor
@Data
public class ReservationVO {

	private String rsvtNo;			//예약 번호
	private String pntCd;			//환자 코드
	private String pntNm;			//환자 이름
	private String major;			//진료부서
	private String empCd;			//의사 코드
	private String empNm;			//의사 이름
	private String symptoms;		//증상
	private String rsvtDt;			//진료일시
	private String rsvDate;			//진료일자	
	private String rsvTime;			//진료시작시간
	private String rsvtRegDt;	//예약한 날짜
	
	private String pntPrno;
	private String pntHp;
	private String stateCd;
	private String rcptYn;	//접수 여부
}
