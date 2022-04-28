package kr.or.ddit.operation.vo;

import org.springframework.stereotype.Repository;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Repository
@Getter
@Setter
@ToString
public class OperDetailVO {
	private String operCd;		//수술코드
	private String empNm;		//수술진
	private String pntCd;		//환자코드
	private String pntNm;		//환자이름
	private String pntPrno;		//주민번호 - 나이로 변경할 
	private String pntSex;		//성별
	private String pntAddr;		//주소
	private String pntHp;		//휴대폰번호
	private String chrDr;		//주치의
	private String smoking;		//흡연 여부
	private String drinking;	//음주 여부
	private String pregnancy;	//임신 여부
	private String age;			//나이 
	private String height;		//신장
	private String weight;		//체중
	private String vsDt;		//바이탈사인 : 측정일자
	private String vsBpMax;		//바이탈사인 : 최고혈압
	private String vsBpMin;		//바이탈사인 : 최저혈압
	private String vsTmp;		//바이탈사인 : 체온
	private String vsBs;		//바이탈사인 : 혈당
	private String disNm;		//질환명
	private String inspNm;		//검사항목명
	private String inspDt;
	private String drugNm;		//투약한 약물 이름
	private String dosage;		//투약량
	private String injDt;		//투약 일시
	private String opcNm;		//수술기법 이름
	private String filePath;	//차트파일의 경로
	private String fileNm;		//차트파일의 이름
	
	private String deptNm;
	private String secNm;
	
	private String sgNm;
	
}
