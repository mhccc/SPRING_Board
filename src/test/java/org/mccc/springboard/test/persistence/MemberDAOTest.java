package org.mccc.springboard.test.persistence;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mccc.springboard.domain.MemberVO;
import org.mccc.springboard.persistence.MemberDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations={ "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class MemberDAOTest {
	
	private static Logger logger = LoggerFactory.getLogger(MemberDAOTest.class);

	@Inject
	private MemberDAO memberDAO;
	
	@Test
	public void testCreate() throws Exception {
		MemberVO memberVO = new MemberVO();
		memberVO.setUserid("TEST");
		memberVO.setPassword("TEST");
		memberVO.setEmail("TEST@test.com");
		memberDAO.createMember(memberVO);
	}
	
	@Test
	public void testRead() throws Exception {
		String userid = "TEST";
		MemberVO memberVO = memberDAO.readMember(userid);
		System.out.println(memberVO.toString());
	}
	
	@Test
	public void testUpdate() throws Exception {
		MemberVO memberVO = new MemberVO();
		memberVO.setUserid("TEST");
		memberVO.setPassword("MODTEST");
		memberVO.setEmail("MODTEST@test.com");
		memberDAO.updateMember(memberVO);
	}
	
	@Test
	public void testDelete() throws Exception {
		String userid = "TEST";
		memberDAO.deleteMember(userid);
	}
}
