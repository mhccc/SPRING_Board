package org.mccc.springboard.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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
	public void createMember(MemberVO memberVO) throws Exception {
		
		sqlSession.insert(NAMESAPCE + ".createMember", memberVO);
	}

	@Override
	public MemberVO readMember(String userid) throws Exception {
		
		return sqlSession.selectOne(NAMESAPCE + ".readMember", userid);
	}

	@Override
	public void updateMember(MemberVO memberVO) throws Exception {
		
		sqlSession.update(NAMESAPCE + ".updateMember", memberVO);
	}

	@Override
	public void deleteMember(String userid) throws Exception {
		
		sqlSession.delete(NAMESAPCE + ".deleteMember", userid);
	}

	@Override
	public void keepLogin(String userid, String sessionid, Date next) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userid", userid);
		paramMap.put("sessionid", sessionid);
		paramMap.put("next", next);
		
		sqlSession.update(NAMESAPCE + ".keepLogin", paramMap);
	}

	@Override
	public MemberVO checkMemberWithSessionKey(String value) {
		return sqlSession.selectOne(NAMESAPCE + ".checkMemberWithSessionKey", value);
	}

}
