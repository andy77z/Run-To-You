package kr.or.ddit.utils;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CommonInterceptor extends HandlerInterceptorAdapter {

	protected Log log = LogFactory.getLog(CommonInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		String callUrl = request.getRequestURI();

		if (!callUrl.contains("resources")) {
			log.info("===================       Info Log START       ===================");
			log.info(" Request URI \t:  " + request.getRequestURI());

			if (log.isDebugEnabled()) {
				log.debug("===================       Debug Log START       ===================");
				log.debug(" Request URI \t:                  " + request.getRequestURI());
			}
		}

		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

//		log.info("===================        Info Log END        ===================\n");
//
//		if (log.isDebugEnabled()) {
//			log.debug("===================        Debug Log END        ===================\n");
//		}

	}
}
