package kr.or.ddit.login.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.login.mapper.LoginMapper;
import kr.or.ddit.login.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	LoginMapper loginMapper;
	
	@Override
	public EmpVO read(String username) {
		return loginMapper.read(username);
	}

	@Override
	public int findPw(Map<String, String> map) {
		return loginMapper.findPw(map);
	}

	@Override
	public int firstLogin(Map<String, String> map) {
		return loginMapper.firstLogin(map);
	}

	@Override
	public int infoReg(Map<String, String> map) {
		return loginMapper.infoReg(map);
	}

	@Override
	public int online(String empCd) {
		return loginMapper.online(empCd);
	}

	@Override
	public int offline(String empCd) {
		return loginMapper.offline(empCd);
	}

	@Override
	public int addAuth(String empCd) {
		return loginMapper.addAuth(empCd);
	}

	@Override
	public int setPwUuid(Map<String, String> map) {
		return loginMapper.setPwUuid(map);
	}

	@Override
	public String getPwUuid(String empCd) {
		return loginMapper.getPwUuid(empCd);
	}

}
