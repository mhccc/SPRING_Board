package org.mccc.springboard.service;

import javax.inject.Inject;

import org.mccc.springboard.domain.MemberVO;
import org.mccc.springboard.persistence.MemberDAO;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDAO memberDAO;

	@Override
	public void insertMember(MemberVO memberVO) throws Exception {
		memberDAO.insertMember(memberVO);
	}

	@Override
	public MemberVO selectMember(String userid) throws Exception {
		return memberDAO.selectMember(userid);
	}

	@Override
	public void updateMember(MemberVO memberVO) throws Exception {
		memberDAO.updateMember(memberVO);
	}

	@Override
	public void deleteMember(String userid) throws Exception {
		memberDAO.deleteMember(userid);
	}

}
