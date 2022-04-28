package kr.or.ddit.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

//인증 전에 접근을 시도한 URL(/login)로 redirect하는 기능을 갖고 있음
//스프링 시큐리티에서 기본적으로 사용되는 구현 클래스
public class CustomLoginSuccessHandler extends
	SavedRequestAwareAuthenticationSuccessHandler{
	private static final Logger logger = 
			LoggerFactory.getLogger(CustomLoginSuccessHandler.class);
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request,
			HttpServletResponse response, Authentication authentication)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		CustomUser customUser = (CustomUser) authentication.getPrincipal();
		session.setAttribute("loginId", customUser.getUsername());
		session.setAttribute("loginUser", customUser.getUser());
//		logger.info("login 상태 변경 : " + customUser.getUsername());
//		loginMapper.online(customUser.getUsername());
		
		super.onAuthenticationSuccess(request, response, authentication);
	}
}
