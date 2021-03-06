package org.mccc.springboard.test.persistence;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mccc.springboard.domain.ArticleVO;
import org.mccc.springboard.domain.Criteria;
import org.mccc.springboard.persistence.ArticleDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations={ "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class ArticleDAOTest {
	
	private static Logger logger = LoggerFactory.getLogger(ArticleDAOTest.class);

	@Inject
	private ArticleDAO articleDAO;
	
	@Test
	public void testConn() throws Exception {
		articleDAO.readArticle(2);
	}
	
	@Test
	public void testCreateArticle() throws Exception {
		for (int i=0; i<5000; i++) {
			ArticleVO articleVO = new ArticleVO();
			articleVO.setTitle((i + 1) + "번째 글 제목입니다...");
			articleVO.setContent((i + 1) + "번째 글 내용입니다...");
			articleVO.setWriter("User0" + (i % 10));
			
			articleDAO.createArticle(articleVO);
		}
	}
	
	@Test
	public void testListArticle() throws Exception {
		Criteria criteria = new Criteria();
		criteria.setPage(3);
		criteria.setPerPageNum(20);
		
		List<ArticleVO> list = articleDAO.listArticleCriteria(criteria);
		
		for (ArticleVO articleVO : list) {
			logger.info(articleVO.getArticleNo() + " : " + articleVO.getTitle());
		}
	}
	
	@Test
	public void testReadArticle() throws Exception {
		int articleNo = 1;
		articleDAO.readArticle(articleNo);
	}
	
	@Test
	public void testUpdateArticle() throws Exception {
		ArticleVO articleVO = new ArticleVO();
		articleVO.setArticleNo(1);
		articleVO.setTitle("수정된 글 제목입니다...");
		articleVO.setContent("수정된 글 내용입니다...");
		articleDAO.updateArticle(articleVO);
	}
	
	@Test
	public void testDeleteArticle() throws Exception {
		int articleNo = 3;
		articleDAO.deleteArticle(articleNo);
	}

	@Test
	public void testGetLastId() throws Exception {
		logger.info("LastId : " + articleDAO.getLastId());
	}
	
	@Test
	public void testURI() throws Exception {
		UriComponents uriComponents1 = UriComponentsBuilder.newInstance()
				.path("/article/read")
				.queryParam("articleNo", 12)
				.queryParam("perPageNum", 20)
				.build();
		
		UriComponents uriComponents2 = UriComponentsBuilder.newInstance()
				.path("/{module}/{page}")
				.queryParam("articleNo", 12)
				.queryParam("perPageNum", 20)
				.build()
				.expand("article", "read")
				.encode();
		
		logger.info("/article/read?articleNo=12&perPageNum=20");
		logger.info(uriComponents1.toString());
		logger.info(uriComponents2.toString());
	}
	
	@Test
	public void testDynamicSQL() throws Exception {
		Criteria criteria = new Criteria();
		criteria.setPage(1);
		criteria.setSearchType("t");
		criteria.setKeyword("");
		
		logger.info("====================================================");
		
		List<ArticleVO> list = articleDAO.listArticleCriteria(criteria);
		
		for (ArticleVO articleVO : list) {
			logger.info(articleVO.getArticleNo() + ": " + articleVO.getTitle());
		}

		logger.info("====================================================");
		
		logger.info("COUNT: " + articleDAO.countArticles(criteria));
	}
	
}
