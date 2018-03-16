package org.mccc.springboard.persistence;

import org.mccc.springboard.domain.MemberVO;

public interface MemberDAO {
	
	public void createMember(MemberVO memberVO) throws Exception;
	
	public MemberVO readMember(String userid) throws Exception;
	
	public void updateMember(MemberVO memberVO) throws Exception;
	
	public void deleteMember(String userid) throws Exception;
	
}
