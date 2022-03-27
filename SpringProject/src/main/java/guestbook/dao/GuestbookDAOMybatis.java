package guestbook.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import guestbook.bean.GuestbookDTO;

@Repository
public class GuestbookDAOMybatis implements GuestbookDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void guestbookWrite(Map<String, String> map) {
		sqlSession.insert("guestbookSQL.guestbookWrite", map);
	}
	
	@Override
	public List<GuestbookDTO> getGuestbookList(Map<String, Integer> map) {
		return sqlSession.selectList("guestbookSQL.getGuestbookList", map);
	}
	
	@Override
	public int getTotalA() {
		return sqlSession.selectOne("guestbookSQL.getTotalA");
	}
}
