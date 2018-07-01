package org.mccc.springboard.service;

import java.util.List;

import org.mccc.springboard.domain.ArticleVO;
import org.mccc.springboard.domain.Criteria;

public interface ArticleService {

	public Integer createArticle(ArticleVO articleVO) throws Exception;
	
	public ArticleVO readArticle(int articleNo) throws Exception;
	
	public void updateArticle(ArticleVO articleVO) throws Exception;
	
	public void deleteArticle(int articleNo) throws Exception;
	
	public List<ArticleVO> listArticle(Criteria criteria) throws Exception;
	
	public int countArticles(Criteria criteria) throws Exception;
	
}
