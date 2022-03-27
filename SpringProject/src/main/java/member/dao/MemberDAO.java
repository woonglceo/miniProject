package member.dao;

import java.util.Map;

import member.bean.MemberDTO;


public interface MemberDAO {

	public MemberDTO login(Map<String, String> map);

	public MemberDTO checkId(String id);
	
	public void write(MemberDTO m);

	public MemberDTO getMember(String id);

	public void modify(MemberDTO m);
	
}
