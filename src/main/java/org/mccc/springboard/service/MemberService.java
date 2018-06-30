package org.mccc.springboard.service;

import org.mccc.springboard.domain.MemberVO;
import org.mccc.springboard.dto.LoginDTO;

public interface MemberService {
	
	public void createMember(MemberVO memberVO) throws Exception;
	
	public MemberVO readMember(String userid) throws Exception;
	
	public void updateMember(MemberVO memberVO) throws Exception;
	
	public void deleteMember(String userid) throws Exception;
	
	public MemberVO login(LoginDTO loginDTO) throws Exception;
	
}
