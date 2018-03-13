package org.mccc.springboard.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mccc.springboard.domain.MemberVO;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	private static final String NAMESAPCE = "org.mccc.mapper.MemberMapper";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public void insertMember(MemberVO memberVO) throws Exception {
		sqlSession.insert(NAMESAPCE + ".insertMember", memberVO);
	}

	@Override
	public MemberVO selectMember(String userid) throws Exception {
		return sqlSession.selectOne(NAMESAPCE + ".selectMember", userid);
	}

	@Override
	public void updateMember(MemberVO memberVO) throws Exception {
		sqlSession.update(NAMESAPCE + "updateMember", memberVO);
	}

	@Override
	public void deleteMember(String userid) throws Exception {
		sqlSession.delete(NAMESAPCE + ".deleteMember", userid);
	}

}
