package kr.or.ddit.patients.vo;



import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import kr.or.ddit.inspection.vo.InspectionVO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@AllArgsConstructor
@Data
public class PatientsVO {
	private String pntCd;	//환자 코드
	private String pntNm;	//이름
	private String pntPrno;	//주민번호
	private String fPrno;	//폼태그에서 입력받은 주민번호 앞자리
	private String bPrno;	//폼태그에서 입력받은 주민번호 뒷자리
	
	private String pntSex;	//성별
	private String M;	//남성
	private String F;	//여성
	
	private String pntAddr;	//주소
	private String zipcode;	//폼태그에서 입력받은 우편번호 
	private String addr;	//폼태그에서 입력받은 주소
	private String detaddr;	//폼태그에서 입력받은 상세주소
	
	private String pntHp;	//연락처
	private String pntHp1;	//폼태그에서 입력받은 연락처 앞자리
	private String pntHp2;	//폼태그에서 입력받은 연락처 가운데자리
	private String pntHp3;	//폼태그에서 입력받은 연락처 끝자리
	
	private String chrDr;	//담당의사
	private String locCd;	//진료과 (이전 위치)
	private int entYn;		//입원여부
	
	private long height;	//신장
	private long weight;	//체중
	private long smkYn;		//흡연 여부	
	private long drkYn;		//음주 여부
	private long prgntYn;	//임신 여부
	private String smoking;	//흡연 여부
	private String drinking;//음주 여부
	private String pregnancy;	//임신 여부
	private String stateCd;	//상태코드
	private String prtcrNm;	//보호자 이름
	private String prtcrTel;//보호자 연락처
	private String rtel1;//폼태그에서 입력받은 보호자 연락처 앞자리
	private String rtel2;//폼태그에서 입력받은 보호자 연락처 가운데자리
	private String rtel3;//폼태그에서 입력받은 보호자 연락처 끝자리
	
	private String age;		//나이
	private String pntRegDt;//예약일시
	private long delYn;		//예약등록일자
	@DateTimeFormat(pattern = "yyy-MM-dd PM | AM hh:mm:ss")
	private String vsDt;	//측정일시
	private long vsBpMax;	//최고혈압
	private double vsTmp;		//체온
	private long vsBs;		//혈당
	private long vsBpMin;	//최저혈압
	
	private String notDt; 	//검사에서 쓸 알림일시
	private int rownum;		//검사에서 쓸 순번
	private String treatCd;	//검사에서 쓸 진료코드
	private String rcptNo;	//검사에서 쓸 접수번호
	private String secNm;	//검사에서 쓸 진료과
	
	private List<InspectionVO> inspectionVO;
	
	private String empCd;	//진료내역 출력 의사코드
	private String empNm;	//진료내역 출력 의사이름
	private String treatOp;	//진료내역 출력 진료소견
	private String treatDt; //진료내역 출력 진료일시
	
	
}
