package org.mccc.springboard.persistence;

import java.util.List;

import org.mccc.springboard.domain.ArticleVO;
import org.mccc.springboard.domain.Criteria;

public interface ArticleDAO {

	public void createArticle(ArticleVO articleVO) throws Exception;
	
	public ArticleVO readArticle(int articleNo) throws Exception;
	
	public void updateArticle(ArticleVO articleVO) throws Exception;
	
	public void deleteArticle(int articleNo) throws Exception;
	
	public List<ArticleVO> listArticleCriteria(Criteria criteria) throws Exception;
	
	public int countArticles(Criteria criteria) throws Exception;
	
	public void updateReplyCnt(int articleNo, int amount) throws Exception;
	
	public void updateHit(int articleNo) throws Exception;
	
	public int getLastId() throws Exception;
	
}
