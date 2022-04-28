package kr.or.ddit.ent.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Repository;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@Data
@Repository
public class EntNotiVO {
		
	// 알림 테이블 NOTIFICATION
	private String noti;
	private String notDt;
	
	public String getNotDt() {
		String returnVal = "";

		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
			
			Date date = format.parse(this.notDt);  // DB 값
			Date now = new Date(); 				   // 현재 시간 밀리세컨드
			
			int result = (int)(now.getTime() - date.getTime()) / 1000;  // 밀리 세컨을 1000으로 나눠 원래의 초 단위로 만들고
			int res = result / 60;  // 분을 구한다.
			
			if(res >= 60) {   // 60 분이 넘으면 시간으로
				res = res / 60;
				returnVal = res + "시간 전";
				if(res >= 24) { // 시간이 24시가 넘으면 시간으로
					res = res / 24;
					returnVal = res + "일 전"; 
				}
			}else {
				returnVal = res + "분 전";
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return returnVal;
	}
	
	private int notiCnt;
	private int notNo;
	private String drugNoti;
	
}
