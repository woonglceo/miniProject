package member.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private HttpSession session;
	
	@Override
	public String login(Map<String, String> map) {
		MemberDTO m = memberDAO.login(map);
		
		String result = "fail";
		if(m != null) {	
			//세션
			session.setAttribute("memName", m.getName());
			session.setAttribute("memId", m.getId());
			session.setAttribute("memEmail", m.getEmail1()+"@"+m.getEmail2());
			
			result = "ok"; 
		}
		return result;
	}
	
	@Override
	public void logout() {
		session.invalidate();	//세션 무효화
	}

	@Override
	public void write(MemberDTO m) {
		memberDAO.write(m);
	}

	@Override
	public MemberDTO checkId(String id) {
		return memberDAO.checkId(id);
	}

	@Override
	public MemberDTO getMember(String id) {
		return memberDAO.getMember(id);
	}

	@Override
	public void modify(MemberDTO m) {
		memberDAO.modify(m);
	}

}
