package kr.or.ddit.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.login.mapper.LoginMapper;
import kr.or.ddit.login.vo.LoginVO;

public class CustomUserDetailService implements UserDetailsService{
	private static final Logger logger = 
			LoggerFactory.getLogger(CustomUserDetailService.class);
	
	@Autowired
	LoginMapper loginMapper;
	
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		logger.warn("Load User By UserName : " + userName);
		
		//userName은 사용자명이 아니라 사용자 아이디를 의미
		//사용자 아이디를 조건으로 넘기면 해당 사용자 1행이 MemberVO 객체타입으로 리턴 됨
		EmpVO empVO = loginMapper.read(userName);
		
		logger.warn("queried by member mapper : " + empVO.toString());
		
		return empVO==null?null:new CustomUser(empVO);
	}
	
}





