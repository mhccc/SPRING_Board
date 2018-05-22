package org.mccc.springboard.service;

import java.util.List;

import javax.inject.Inject;

import org.mccc.springboard.domain.Criteria;
import org.mccc.springboard.domain.ReplyVO;
import org.mccc.springboard.persistence.ArticleDAO;
import org.mccc.springboard.persistence.ReplyDAO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	private ReplyDAO replyDAO;
	
	@Inject
	private ArticleDAO articleDAO;

	@Transactional
	@Override
	public void createReply(ReplyVO replyVO) throws Exception {
		replyDAO.createReply(replyVO);
		articleDAO.updateReplyCnt(replyVO.getArticleNo(), 1);
	}

	@Override
	public void updateReply(ReplyVO replyVO) throws Exception {
		replyDAO.updateReply(replyVO);
	}

	@Transactional
	@Override
	public void deleteReply(Integer replyNo) throws Exception {
		int articleNo = replyDAO.getArticleNo(replyNo);
		replyDAO.deleteReply(replyNo);
		articleDAO.updateReplyCnt(articleNo, -1);
	}
	
	@Override
	public List<ReplyVO> listReplyCriteria(Integer articleNo, Criteria criteria) throws Exception {
		return replyDAO.listReplyCriteria(articleNo, criteria);
	}

	@Override
	public int countReplies(int articleNo) throws Exception {
		return replyDAO.countReplies(articleNo);
	}
	
}
