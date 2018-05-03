package org.mccc.springboard.test.persistence;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mccc.springboard.domain.Criteria;
import org.mccc.springboard.domain.ReplyVO;
import org.mccc.springboard.persistence.ReplyDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={ "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class ReplyDAOTest {

	private static final Logger logger = LoggerFactory.getLogger(ReplyDAOTest.class);
	
	@Inject
	ReplyDAO replyDAO;
	
	@Test
	public void testReplyCreate() throws Exception {
		
		for (int i = 0; i < 100; i++) {
			ReplyVO replyVO = new ReplyVO();
			replyVO.setArticleNo(100);
			replyVO.setReplyWriter("user0" + (i % 10));
			replyVO.setReplyText((i + 1) + "번째 댓글입니다.");
			
			replyDAO.createReply(replyVO);
		}
	}
	
	@Test
	public void testUpdateReply() throws Exception {
		
		ReplyVO replyVO = new ReplyVO();
		replyVO.setReplyNo(2);
		replyVO.setReplyText(2 + "번재 댓글 수정.");
		
		replyDAO.updateReply(replyVO);
	}
	
	@Test
	public void testDeleteReply() throws Exception {
		
		int replyNo = 3;
		replyDAO.deleteReply(replyNo);
	}
	
	@Test
	public void testListCriteria() throws Exception {

	    Criteria criteria = new Criteria();
	    criteria.setPerPageNum(20);
	    criteria.setPage(1);

	    List<ReplyVO> replies = replyDAO.listReplyCriteria(100, criteria);

	    for (ReplyVO reply : replies) {
	        logger.info(reply.getReplyNo() + " : " + reply.getReplyText());
	    }

	}
	
}
