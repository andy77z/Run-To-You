package kr.or.ddit.operation.vo;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Repository;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Repository
@Getter
@Setter
@ToString
public class PatientVO {
	
	
	private String prno;
	
	private String telno;
	private String addr;
	private String chrDr;
	private int height;
	private int weight;
	private int smkYn;
	private int drkYn;
	private String prtcrNm;
	private String prtcrTel;
	private int statusCd;
	
	private String pntCd;		//환자코드
	private String pntNm;		//환자이름
	private String pntPrno;		//주민번호 - 나이로 변경할 
	private String pntSex;		//성별
	private String pntHp;		//휴대폰번호
	private String pntAddr;		//주소
	
}
