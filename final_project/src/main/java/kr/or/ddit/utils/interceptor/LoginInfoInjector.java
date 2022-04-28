package kr.or.ddit.utils.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.or.ddit.emp.service.EmpService;
import kr.or.ddit.emp.vo.EmpVO;

public class LoginInfoInjector extends HandlerInterceptorAdapter {

	@Autowired
	EmpService empService;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		
		modelAndView.addObject("loginUser", (EmpVO)session.getAttribute("loginUser"));
		modelAndView.addObject("secSelectBox", empService.secSelectBox());
		
		super.postHandle(request, response, handler, modelAndView);
	}
}
