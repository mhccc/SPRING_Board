package org.mccc.springboard.service;

import java.util.List;

import org.mccc.springboard.domain.ReplyVO;

public interface ReplyService {
	
	public void createReply(ReplyVO replyVO) throws Exception;

	public List<ReplyVO> listReply(Integer articleNo) throws Exception;
	
	public void updateReply(ReplyVO replyVO) throws Exception;
	
	public void deleteReply(Integer replyNo) throws Exception;
	
}
