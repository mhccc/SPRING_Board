package org.mccc.springboard.service;

import java.util.List;

import javax.inject.Inject;

import org.mccc.springboard.domain.Criteria;
import org.mccc.springboard.domain.ReplyVO;
import org.mccc.springboard.persistence.ReplyDAO;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	private ReplyDAO replyDAO;

	@Override
	public void createReply(ReplyVO replyVO) throws Exception {
		replyDAO.createReply(replyVO);
	}

	@Override
	public void updateReply(ReplyVO replyVO) throws Exception {
		replyDAO.updateReply(replyVO);
	}

	@Override
	public void deleteReply(Integer replyNo) throws Exception {
		replyDAO.deleteReply(replyNo);
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
