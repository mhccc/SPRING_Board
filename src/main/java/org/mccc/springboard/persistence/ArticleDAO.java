package org.mccc.springboard.persistence;

import java.util.List;

import org.mccc.springboard.domain.ArticleVO;

public interface ArticleDAO {

	public void createArticle(ArticleVO articleVO) throws Exception;
	
	public ArticleVO readArticle(int articleNo) throws Exception;
	
	public void updateArticle(ArticleVO articleVO) throws Exception;
	
	public void deleteArticle(int articleNo) throws Exception;
	
	public List<ArticleVO> listAllArticle() throws Exception;
}