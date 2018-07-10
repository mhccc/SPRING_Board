package org.mccc.springboard.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mccc.springboard.domain.MemberVO;
import org.mccc.springboard.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

public class CookieInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Inject
	private MemberService memberService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		if (loginCookie != null) {
			MemberVO memberVO = memberService.checkLoginBefore(loginCookie.getValue());
			logger.info("MemberVO : " + memberVO);
			if(memberVO != null) {
				session.setAttribute("login", memberVO);
			}
		}
		return true;
	}
}
