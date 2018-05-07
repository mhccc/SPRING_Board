package org.mccc.springboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/replyy")
public class ReplyTestContetoller {

	@RequestMapping("/test")
	public String replyAjaxTest() {
		return "/tutorial/reply_test";
	}
	
}
