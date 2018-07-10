package org.mccc.springboard.persistence;

import java.util.Date;

import org.mccc.springboard.domain.MemberVO;

public interface MemberDAO {
	
	public void createMember(MemberVO memberVO) throws Exception;
	
	public MemberVO readMember(String userid) throws Exception;
	
	public void updateMember(MemberVO memberVO) throws Exception;
	
	public void deleteMember(String userid) throws Exception;
	
	public void keepLogin(String userid, String sessionid, Date next) throws Exception;
	
	public MemberVO checkMemberWithSessionKey(String value);
	
}
