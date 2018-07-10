package org.mccc.springboard.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mccc.springboard.domain.MemberVO;
import org.mccc.springboard.dto.LoginDTO;
import org.mccc.springboard.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

@Controller
@RequestMapping("member/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private MemberService memberService;
	
	//회원가입 GET
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinGET() throws Exception {
		
		logger.info("Member join get ...... ");
		
		return "/member/join";
	}
	//회원가입 POST
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPOST(MemberVO memberVO, RedirectAttributes rttr) throws Exception {
		
		logger.info("Member join post ...... ");
		logger.info("MemberVO : " + memberVO.toString());

		memberService.createMember(memberVO);
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:/member/login";
	}
	
	//아이디 중복 검사
	@ResponseBody
	@RequestMapping(value = "/useridCheck", method = RequestMethod.POST)
	public String useridCheckPOST(@RequestParam("userid") String userid) throws Exception {
		
		logger.info("Member userid post ...... ");
		logger.info("userid : " + userid);
		
		MemberVO memberVO = memberService.readMember(userid);
		String result = "";
		
		if (memberVO != null) {
			result = "duplicate";
		}
		
		return result;
	}

	//로그인 GET
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET() throws Exception {
		
		logger.info("Member login get ...... ");
		
		return "/member/login";
	}
	//로그인 POST
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void loginPOST(LoginDTO loginDTO, HttpSession session, Model model) throws Exception {
		
		logger.info("Member login post ...... ");
		logger.info("LoginDTO : " + loginDTO.toString());
		
		MemberVO loginMemberVO = memberService.login(loginDTO);
		
		if (loginMemberVO == null) {
			model.addAttribute("userid", loginDTO.getUserid());
			
			if (memberService.readMember(loginDTO.getUserid()) == null) {
				model.addAttribute("invalidUserid", true);
			} else if (! memberService.readMember(loginDTO.getUserid()).getPassword().equals(loginDTO.getPassword())) {
				model.addAttribute("invalidPassword", true);
			}
			return ;
		}
		
		model.addAttribute("memberVO", loginMemberVO);
		
		if (loginDTO.isUserCookie()) {
			int amount = 60 * 60 * 24 * 7;
			Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));
			memberService.keepLogin(loginMemberVO.getUserid(), session.getId(), sessionLimit);
		}
	}
	
	//로그아웃 GET
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutGET(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("Member logout GET ...... ");
		
		Object object = session.getAttribute("login");
		
		if (object != null) {
			MemberVO memberVO = (MemberVO) object;
			
			session.removeAttribute("login");
			session.invalidate();
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				memberService.keepLogin(memberVO.getUserid(), session.getId(), new Date());
			}
		}
		
		return "redirect:/";
	}
	
}
