package org.mccc.springboard.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/article")
public class ArticleController {

	private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);
	
	@Inject
	private ArticleService articleService;
	
	//게시글 리스트 조회 (GET)
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(@ModelAttribute("criteria") Criteria criteria, Model model) throws Exception {
		
		logger.info("Article list get ...... ");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(articleService.countArticles(criteria));
		
		model.addAttribute("list", articleService.listArticle(criteria));	
		model.addAttribute("pageMaker", pageMaker);
		
		return "/article/list";
	}
	
	//게시글 쓰기 (GET)
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeGET() throws Exception {
		
		logger.info("Article write get ...... ");
		
		return "/article/write";
	}
	//게시글 쓰기 (POST)
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(ArticleVO articleVO, RedirectAttributes rttr) throws Exception {
		
		logger.info("Article write post ...... ");
		logger.info("ArticleVO : " + articleVO.toString());
		
		articleService.createArticle(articleVO);
		
		rttr.addFlashAttribute("result", "writeSuccess");
		
		return "redirect:/article/list";
	}
	//파일 업로드 (POST)
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String uploadPOST(HttpServletRequest request, @RequestParam MultipartFile upload, Model model) {
		
		logger.info("Article upload post ...... ");
		
		String rootPath = request.getSession().getServletContext().getRealPath("/");
		String uploadPath = "resources/upload/";
		UUID uid = UUID.randomUUID();
		String fileName = "";
		String CKEditorFuncNum = "";
		
		if (upload != null) {
			fileName = uid + "_" + upload.getOriginalFilename();
			CKEditorFuncNum = request.getParameter("CKEditorFuncNum");
			try {
				File file = new File(rootPath + uploadPath + fileName);
				upload.transferTo(file);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		String filePath = "/" + uploadPath + fileName;
		model.addAttribute("filePath", filePath);
		model.addAttribute("CKEditorFuncNum", CKEditorFuncNum);
		
		return "/article/uploadResult";
	}
	
	//게시글 조회 (GET)
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(@RequestParam("articleNo") int articleNo, @ModelAttribute("criteria") Criteria criteria, Model model) throws Exception {
		
		logger.info("Article read get ...... ");
		
		model.addAttribute("article", articleService.readArticle(articleNo));
		
		return "/article/read";
	}
	
	//게시글 수정 (GET)
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGET(@RequestParam("articleNo") int articleNo, @ModelAttribute("criteria") Criteria criteria, Model model) throws Exception {
		
		logger.info("Article modify get ...... ");
		
		model.addAttribute("article", articleService.readArticle(articleNo));
		
		return "/article/modify";
	}
	//게시글 수정 (POST)
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(ArticleVO articleVO, Criteria criteria, RedirectAttributes rttr) throws Exception {
		
		logger.info("Article modify post ...... ");
		
		articleService.updateArticle(articleVO);
		
		rttr.addAttribute("page", criteria.getPage());
		rttr.addAttribute("perPageNum", criteria.getPerPageNum());
		rttr.addAttribute("searchType", criteria.getSearchType());
		rttr.addAttribute("keyword", criteria.getKeyword());
		rttr.addAttribute("articleNo", articleVO.getArticleNo());
		rttr.addFlashAttribute("result", "modifySuccess");
		
		return "redirect:/article/read";
	}
	
	//게시글 삭제 (POST)
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("articleNo") int articleNo, Criteria criteria, RedirectAttributes rttr) throws Exception {
		
		logger.info("Article remove post ...... ");
		
		articleService.deleteArticle(articleNo);
		
		rttr.addAttribute("page", criteria.getPage());
		rttr.addAttribute("perPageNum", criteria.getPerPageNum());
		rttr.addAttribute("searchType", criteria.getSearchType());
		rttr.addAttribute("keyword", criteria.getKeyword());
		rttr.addFlashAttribute("result", "removeSuccess");
		
		return "redirect:/article/list";
	}
}
