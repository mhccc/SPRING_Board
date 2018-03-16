package org.mccc.springboard.test.persistence;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mccc.springboard.domain.ArticleVO;
import org.mccc.springboard.persistence.ArticleDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations={ "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class ArticleDAOTest {
	
	private static Logger logger = LoggerFactory.getLogger(ArticleDAOTest.class);

	@Inject
	private ArticleDAO articleDAO;
	
	@Test
	public void testCreate() throws Exception {
		ArticleVO articleVO = new ArticleVO("TEST", "TEST", "TEST");
		articleDAO.createArticle(articleVO);
	}
	
	@Test
	public void testRead() throws Exception {
		int articleNo = 1;
		articleDAO.readArticle(articleNo);
	}
	
	@Test
	public void testUpdate() throws Exception {
		ArticleVO articleVO = new ArticleVO("MODTEST", "MODTEST", "MODTEST");
		articleVO.setArticleNo(1);
		articleDAO.updateArticle(articleVO);
	}
	
	@Test
	public void testDelete() throws Exception {
		int articleNo = 3;
		articleDAO.deleteArticle(articleNo);
	}
	
	@Test
	public void testListAll() throws Exception {
		articleDAO.listAllArticle();
	}
}
