package kr.or.ddit.login.mapper;

import java.util.Map;

import kr.or.ddit.emp.vo.EmpVO;

public interface LoginMapper {
	public EmpVO read(String username);
	
	public int findPw(Map<String, String> map);
	
	public int firstLogin(Map<String, String> map);
	
	public int infoReg(Map<String, String> map);
	
	public int online(String empCd);
	
	public int offline(String empCd);
	
	public int addAuth(String empCd);
	
	public int setPwUuid(Map<String, String> map);
	
	public String getPwUuid(String empCd);
}
