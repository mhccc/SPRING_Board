package org.mccc.springboard.controller;

import javax.inject.Inject;

import org.mccc.springboard.domain.MemberVO;
import org.mccc.springboard.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	//이메일 중복 검사

	//로그인 GET
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET() throws Exception {
		logger.info("Member login get ...... ");
		return "/member/login";
	}
	//로그인 POST
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPOST(MemberVO memberVO) throws Exception {
		logger.info("Member login post ...... ");
		logger.info("MemberVO : " + memberVO.toString());
		
		if (memberService.loginCheck(memberVO)) {
			return "redirect:/";
		}
		
		return "/member/login";
	}
	
}
