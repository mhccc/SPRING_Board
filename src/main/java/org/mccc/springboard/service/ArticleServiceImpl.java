package org.mccc.springboard.service;

import java.util.List;

import javax.inject.Inject;

import org.mccc.springboard.domain.ArticleVO;
import org.mccc.springboard.persistence.ArticleDAO;
import org.springframework.stereotype.Service;

@Service
public class ArticleServiceImpl implements ArticleService {
	
	@Inject
	private ArticleDAO articleDAO;

	@Override
	public void createArticle(ArticleVO articleVO) throws Exception {
		articleDAO.createArticle(articleVO);
	}

	@Override
	public ArticleVO readArticle(int articleNo) throws Exception {
		return articleDAO.readArticle(articleNo);
	}

	@Override
	public void updateArticle(ArticleVO articleVO) throws Exception {
		articleDAO.updateArticle(articleVO);
	}

	@Override
	public void deleteArticle(int articleNo) throws Exception {
		articleDAO.deleteArticle(articleNo);
	}

	@Override
	public List<ArticleVO> listAllArticle() throws Exception {
		return articleDAO.listAllArticle();
	}

}
