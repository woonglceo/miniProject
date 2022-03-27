package member.service;

import java.util.Map;

import member.bean.MemberDTO;

public interface MemberService {

	public String login(Map<String, String> map);

	public void logout();

	public void write(MemberDTO m);

	public MemberDTO checkId(String id);

	public MemberDTO getMember(String id);

	public void modify(MemberDTO m);
}
