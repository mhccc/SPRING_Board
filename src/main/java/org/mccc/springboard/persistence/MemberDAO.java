package org.mccc.springboard.persistence;

import org.mccc.springboard.domain.MemberVO;

public interface MemberDAO {
	
	public void insertMember(MemberVO memberVO) throws Exception;
	
	public MemberVO selectMember(String userid) throws Exception;
	
	public void updateMember(MemberVO memberVO) throws Exception;
	
	public void deleteMember(String userid) throws Exception;
	
}
