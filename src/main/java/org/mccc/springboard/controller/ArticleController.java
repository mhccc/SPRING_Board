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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/article/*")
public class ArticleController {

	private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);
	
	@Inject
	private ArticleService articleService;
	
	//리스트 조회 GET
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) throws Exception {
		
		return "/article/list";
	}
	
	//쓰기 GET
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeGET() throws Exception {
		logger.info("Article write get ...... ");
		
		return "/article/write";
	}
	//쓰기 POST
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(ArticleVO articleVO, RedirectAttributes rttr) throws Exception {
		logger.info("Article write get ...... ");
		logger.info("ArticleVO : " + articleVO.toString());
		
		articleService.createArticle(articleVO);
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:/article/list";
	}
	
	//읽기 GET
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(int articleNo, Model model) throws Exception {
		logger.info("Article read get ...... ");
		
		return "/article/read";
	}
	
	//수정 GET
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGET(int articleNo, Model model) throws Exception {
		logger.info("Article modify get ...... ");
		
		return "/article/modify";
	}
	//수정 POST
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(ArticleVO articleVO, RedirectAttributes rttr) throws Exception {
		logger.info("Article write get ...... ");
		logger.info("ArticleVO : " + articleVO.toString());
		
		articleService.updateArticle(articleVO);
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:/article/read";
	}
	
	//삭제 POST
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(int articleNo, RedirectAttributes rttr) throws Exception {
		logger.info("Article remove post ...... ");
		
		return "redirect:/article/list";
	}
}
