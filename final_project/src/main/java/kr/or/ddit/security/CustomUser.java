package kr.or.ddit.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.login.vo.UserAuth;

public class CustomUser extends User {

	private EmpVO empVO;
	
	public CustomUser(String username, String password
			, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	//return member==null?null:new CustomUser(member);
	//사용자가 정의한 MemberVO 타입을 
	//스프링 시큐리티 UsersDetails 타입으로 변환
	public CustomUser(EmpVO empVO) {
		//super(username, password, authorities);
//		super(member.getMemberid(), member.getPassword(),
//				member.getAuthList().stream()
//				.map(auth->new SimpleGrantedAuthority(
//						auth.getAuth())).collect(Collectors.toList()));
		super(empVO.getEmpCd(), empVO.getEmpPw(),getList(empVO));
		
		this.empVO = empVO;
	}
	
	public EmpVO getUser() {
		return this.empVO;
	}
	
	public static List<SimpleGrantedAuthority> getList(EmpVO empVO) {
		List<SimpleGrantedAuthority> authorities = 
				new ArrayList<SimpleGrantedAuthority>();
		//authList : {"a001":"ROLE_MEMBER","a001":"ROLE_ADMIN"}
		List<UserAuth> authList = empVO.getAuthList();
		for(UserAuth auth : authList) {
			SimpleGrantedAuthority authority = new SimpleGrantedAuthority(auth.getAuth());
			authorities.add(authority);
		}
		
		return authorities;
	}
	
	
	
}




