package org.mccc.springboard.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mccc.springboard.domain.ReplyVO;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	private static final String NAMESPACE = "org.mccc.mapper.ReplyMapper";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void createReply(ReplyVO replyVO) throws Exception {
		sqlSession.insert(NAMESPACE + ".createReply", replyVO);
	}

	@Override
	public List<ReplyVO> listReply(Integer articleNo) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listReply", articleNo);
	}

	@Override
	public void updateReply(ReplyVO replyVO) throws Exception {
		sqlSession.update(NAMESPACE + ".updateReply", replyVO);
	}

	@Override
	public void deleteReply(Integer replyNo) throws Exception {
		sqlSession.delete(NAMESPACE + ".deleteReply", replyNo);
	}

}
