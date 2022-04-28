package kr.or.ddit.ent.vo;

import java.text.DecimalFormat;
import java.util.Calendar;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class EntVO {

	// ent 테이블 
	private String entCd;
	private int bedNo;
	private String pntCd;
	private int entAmt;
	private int treatSum;
	
	public void setEntAmt(String entAmt) {
		entAmt.replaceAll("\\,", "");
		this.entAmt = Integer.parseInt(entAmt); 
	}
	
	public String getEntAmt() {
		DecimalFormat df = new DecimalFormat("###,###");	
		return String.valueOf(df.format(this.entAmt));
	}
	
	private String entDt;
	private String levDt;
	private String liskCd;
	private int age;
	
	public void setAge(String prno) {
	}
	
	public int getAge() {
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		
		String birth = this.pntPrno.substring(0, 2);
		
		char ch = pntPrno.charAt(7);
		
		if(ch < '3') {
			this.age = year - (1900 + Integer.parseInt(birth));
		}else {
			this.age = year - (2000 + Integer.parseInt(birth));
		}
		
		return age;
	}
	
	
	
	// ent_ward 테이블
	private int wardCls;
	private int roomCls;
	private int roomAmt;
	private int roomNope;
	private int bed;
	private int bedx;
	private int bedy;
	private int bedOrder;
	
	// patients 테이블
	private String pntNm;
	private String pntPrno;
	private String pntSex;
	private String pntAddr;
	private String pntHp;
	private String chrDr;
	private int height;
	private int weight;
	private int smkYn;
	private int drkYn;
	private int prgntYn;
	private String stateCd;
	private String prtcrNm;
	private String prtcrTel;
	private String pntRegDt;
	private int delYn;
	private String enabled;
	
	// 진료 TREAT VO
	private String treatCd;
	private String rcptNo;
	private String psrpNo;
	private String operCd;
	private String inspNo;
	private String empCd;
	private String injCd;
	private String treatOp;
	private String treatDt;
	
	// CARE_NOTE 테이블 VO
	private int noteNo;
	private String noteContent;
	private String noteWrtDt;
	private String empNm;
	
	// 바이탈 사인 VS 테이블 VO
	private String vsDt;
	private int vsBpMax;
	private String vsTmp;
	private int vsBs;
	private int vsBpMin;
	private int paging;
	
	// EMP테이블 VO
	private String secCd;
	private String secNm;
	private String deptNm;
	private String empPrno;
	private String empSex;
	private String empAddr;
	private String empHp;
	private String position;
	private String lcnsNo;
	private String empPic;
	private String hireDate;
	private int leaveYn;
	private String empMail;
	private String empPw;
	
	// DIET 테이블  VO
	private String dietCd;
	private String dietNm;
	private int dietAmt;
	
	// INJECT 테이블 VO
	private String drugCd;
	private String drugNm;
	private int dosage;
	private int injAmt;
	private String admst;
	private String cdNm;
	private String injDt;
	private String injDt1; 
	private String injDt2; 
	private int injCnt;
	private int drugRepeat;
	

}
