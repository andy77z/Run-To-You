package kr.or.ddit.emp.vo;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kr.or.ddit.login.vo.UserAuth;
import kr.or.ddit.reservation.vo.ReservationVO;
import lombok.Data;

@Data
public class EmpVO {
	
	// 직원코드
	private String empCd;
	// 소속코드
	private String secCd;
	// 직원명
	private String empNm;
	// 직원주민번호
	private String empPrno;
	// 직원성별
	private String empSex;
	// 직원주소
	private String empAddr;
	// 직원전화번호
	private String empHp;
	// 직급
	private String position;
	// 면허번호
	private String lcnsNo;
	// 직원사진
	private String empPic;
	// 상태코드
	private String stateCd;
	// 입사일
	private String hireDate;
	// 퇴사여부
	private int leaveYn;
	// 활성화여부
	private String enabled;
	// 직원메일
	private String empMail;
	// 직원비밀번호
	private String empPw;
	// 수술시작시간
	private String operBgnTm;
	//권한리스트
	private List<UserAuth> authList;
	
	private MultipartFile uploadFile; //사진파일
	
	// 소속과 명
	private String secNm;
	// 상태코드 명
	private String cdNm;
	// 소속부서 명
	private String deptNm;
	
	//비밀번호 재설정 uuid
	private String pwUuid;
	
	private String major;
	
	private List<ReservationVO> reservation;
	
	public String viewSecurityEmpPrno() {
		return this.empPrno.substring(0, 8) + "******";
	}
	
	public String viewSecurityEmpPw() {
		String securityEmpPw = "";
		for(int i = 0; i < this.empPw.length(); i++) {
			securityEmpPw = securityEmpPw + "*";
		}
		return securityEmpPw;
	}
	
	public String viewAuthList() {
		Gson gson = new GsonBuilder().create();
		return gson.toJson(this.authList);
	}
	
}
