package com.faint.sns;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.faint.domain.MemberVO;
import com.faint.persistence.MemberDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		//locations ={"file:src/main/webapp/WEB-INF/spring/**/MySQL.xml"})
		locations ={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class UserDAOTest {
	
	@Inject
	private MemberDAO dao;
	
	
	@Test
	public void testInsertUser() throws Exception{
		MemberVO vo = new MemberVO();
		vo.setMemberEmail("emaidl@123");
		vo.setMemberPassword("1234");
		vo.setMemberName("kkkdfk");
		System.out.println(vo);
		dao.insertUser(vo);

	}
	

		
	
	
}
