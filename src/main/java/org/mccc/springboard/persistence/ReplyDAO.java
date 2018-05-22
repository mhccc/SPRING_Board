package org.mccc.springboard.persistence;

import java.util.List;

import org.mccc.springboard.domain.Criteria;
import org.mccc.springboard.domain.ReplyVO;

public interface ReplyDAO {
	
	public void createReply(ReplyVO replyVO) throws Exception;
	
	public void updateReply(ReplyVO replyVO) throws Exception;
	
	public void deleteReply(Integer replyNo) throws Exception;
	
	public List<ReplyVO> listReplyCriteria(Integer articleNo, Criteria criteria) throws Exception;
	
	public int countReplies(Integer articleNo) throws Exception;
	
	public int getArticleNo(Integer replyNo) throws Exception;
	
}
