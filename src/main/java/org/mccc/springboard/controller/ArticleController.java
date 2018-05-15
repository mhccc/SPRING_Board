package org.mccc.springboard.controller;

import javax.inject.Inject;

import org.mccc.springboard.domain.ArticleVO;
import org.mccc.springboard.domain.Criteria;
import org.mccc.springboard.domain.PageMaker;
import org.mccc.springboard.service.ArticleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/article")
public class ArticleController {

	private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);
	
	@Inject
	private ArticleService articleService;
	
	//리스트 GET
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(@ModelAttribute("criteria") Criteria criteria, Model model) throws Exception {
		
		logger.info("Article list get ...... ");
		logger.info(criteria.toString());
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(articleService.countArticles(criteria));
		
		model.addAttribute("list", articleService.listArticle(criteria));	
		model.addAttribute("pageMaker", pageMaker);
		
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
		
		logger.info("Article write post ...... ");
		logger.info("ArticleVO : " + articleVO.toString());
		
		articleService.createArticle(articleVO);
		//view 수정할 필요 있음(modal 이용하여 성공 띄우기)
		rttr.addFlashAttribute("result", "writeSuccess");
		
		return "redirect:/article/list";
	}
	
	//읽기 GET
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(@RequestParam("articleNo") int articleNo, @ModelAttribute("criteria") Criteria criteria, Model model) throws Exception {
		
		logger.info("Article read get ...... ");
		
		model.addAttribute("article", articleService.readArticle(articleNo));
		
		return "/article/read";
	}
	
	//수정 GET
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGET(@RequestParam("articleNo") int articleNo, @ModelAttribute("criteria") Criteria criteria, Model model) throws Exception {
		
		logger.info("Article modify get ...... ");
		
		model.addAttribute("article", articleService.readArticle(articleNo));
		
		return "/article/modify";
	}
	//수정 POST
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(ArticleVO articleVO, Criteria criteria, RedirectAttributes rttr) throws Exception {
		
		logger.info("Article modify post ...... ");
		
		articleService.updateArticle(articleVO);
		//view 수정할 필요 있음(modal 이용하여 성공 띄우기)
		rttr.addAttribute("page", criteria.getPage());
		rttr.addAttribute("perPageNum", criteria.getPerPageNum());
		rttr.addAttribute("searchType", criteria.getSearchType());
		rttr.addAttribute("keyword", criteria.getKeyword());
		rttr.addAttribute("articleNo", articleVO.getArticleNo());
		rttr.addFlashAttribute("result", "modifySuccess");
		
		return "redirect:/article/read";
	}
	
	//삭제 POST
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("articleNo") int articleNo, Criteria criteria, RedirectAttributes rttr) throws Exception {
		
		logger.info("Article remove post ...... ");
		
		articleService.deleteArticle(articleNo);
		//view 수정할 필요 있음(modal 이용하여 성공 띄우기)
		rttr.addAttribute("page", criteria.getPage());
		rttr.addAttribute("perPageNum", criteria.getPerPageNum());
		rttr.addAttribute("searchType", criteria.getSearchType());
		rttr.addAttribute("keyword", criteria.getKeyword());
		rttr.addFlashAttribute("result", "removeSuccess");
		
		return "redirect:/article/list";
	}
}
