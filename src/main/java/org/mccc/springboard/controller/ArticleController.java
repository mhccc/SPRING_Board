package org.mccc.springboard.controller;

import javax.inject.Inject;

import org.mccc.springboard.domain.ArticleVO;
import org.mccc.springboard.service.ArticleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/article/*")
public class ArticleController {

	private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);
	
	@Inject
	private ArticleService articleService;
	
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void writeGET(ArticleVO articleVO, Model model) throws Exception {
		logger.info("Article write get ...... ");
	}
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(ArticleVO articleVO, Model model) throws Exception {
		logger.info("Article write get ...... ");
		logger.info("ArticleVO : " + articleVO.toString());
		
		articleService.createArticle(articleVO);
		model.addAttribute("result", "success");
		
		return "/article/success";
	}
	
}
