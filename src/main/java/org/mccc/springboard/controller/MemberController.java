package org.mccc.springboard.controller;

import javax.inject.Inject;

import org.mccc.springboard.domain.MemberVO;
import org.mccc.springboard.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("member/*")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	private MemberService memberService;
	
	//회원가입
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void joinGET() throws Exception {
		logger.info("Member join get ...... ");
	}
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPOST(MemberVO memberVO, Model model) throws Exception {
		logger.info("Member join post ...... ");
		logger.info("MemberVO : " + memberVO.toString());

		memberService.createMember(memberVO);
		
		model.addAttribute("result", "success");
		
		return "/index";
	}
	
	//아이디 중복 검사
	//이메일 중복 검사

	//로그인
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET() throws Exception {
		logger.info("Member login get ...... ");
	}
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void loginPOST(Model model) throws Exception {
		logger.info("Member login post ...... ");
	}
	
}
