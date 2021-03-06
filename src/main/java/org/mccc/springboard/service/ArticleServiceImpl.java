package org.mccc.springboard.service;

import java.util.List;

import javax.inject.Inject;

import org.mccc.springboard.domain.ArticleVO;
import org.mccc.springboard.domain.Criteria;
import org.mccc.springboard.persistence.ArticleDAO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ArticleServiceImpl implements ArticleService {
	
	@Inject
	private ArticleDAO articleDAO;

	@Transactional
	@Override
	public Integer createArticle(ArticleVO articleVO) throws Exception {
		articleDAO.createArticle(articleVO);
		return articleDAO.getLastId();
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public ArticleVO readArticle(int articleNo) throws Exception {
		articleDAO.updateHit(articleNo);
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
	public List<ArticleVO> listArticle(Criteria criteria) throws Exception {
		return articleDAO.listArticleCriteria(criteria);
	}

	@Override
	public int countArticles(Criteria criteria) throws Exception {
		return articleDAO.countArticles(criteria);
	}

}
