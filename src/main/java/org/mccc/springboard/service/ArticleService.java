package org.mccc.springboard.service;

import java.util.List;

import org.mccc.springboard.domain.ArticleVO;
import org.mccc.springboard.domain.Criteria;

public interface ArticleService {

	public void createArticle(ArticleVO articleVO) throws Exception;
	
	public ArticleVO readArticle(int articleNo) throws Exception;
	
	public void updateArticle(ArticleVO articleVO) throws Exception;
	
	public void deleteArticle(int articleNo) throws Exception;
	
	public List<ArticleVO> listCriteria(Criteria criteria) throws Exception;
	
	public int countArticles() throws Exception;
	
}
