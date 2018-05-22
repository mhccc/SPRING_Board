package org.mccc.springboard.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mccc.springboard.domain.Criteria;
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
	public void updateReply(ReplyVO replyVO) throws Exception {
		sqlSession.update(NAMESPACE + ".updateReply", replyVO);
	}

	@Override
	public void deleteReply(Integer replyNo) throws Exception {
		sqlSession.delete(NAMESPACE + ".deleteReply", replyNo);
	}
	
	@Override
	public List<ReplyVO> listReplyCriteria(Integer articleNo, Criteria criteria) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("articleNo", articleNo);
		paramMap.put("criteria", criteria);
		
		
		return sqlSession.selectList(NAMESPACE + ".listReply", paramMap);
	}

	@Override
	public int countReplies(Integer articleNo) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".countReply", articleNo);
	}

	@Override
	public int getArticleNo(Integer replyNo) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".getArticleNo", replyNo);
	}

}
