package board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private HttpSession session;
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private BoardPaging boardPaging;
	
	@Override
	public void boardWrite(Map<String, String> map) {
		map.put("id", (String)session.getAttribute("memId"));
		map.put("name", (String)session.getAttribute("memName"));
		map.put("email", (String)session.getAttribute("memEmail"));
		
		boardDAO.boardWrite(map);
	}

	@Override
	public Map<String, Object> getBoardList(String pg) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("endNum", Integer.parseInt(pg) * 5);
		map.put("startNum", (Integer.parseInt(pg) * 5) - 4);
		
		List<BoardDTO> list = boardDAO.getBoardList(map);
		String memId = (String) session.getAttribute("memId");
		
		Map<String, Object> temp = new HashMap<String, Object>();		
		temp.put("list", list);
		temp.put("memId", memId);
		
		return temp;
	}
	
	@Override
	public BoardPaging boardPaging(String pg) {
		int totalA = boardDAO.getTotalA();
		
		boardPaging.setCurrentPage(Integer.parseInt(pg)); //현재 페이지
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();
		
		return boardPaging;
	}

	@Override
	public BoardPaging boardPaging(Map<String, String> map) {
		int totalA = boardDAO.getTotalSearchA(map); //검색한 총 글수
		
		boardPaging.setCurrentPage(Integer.parseInt(map.get("pg"))); //현재 페이지
		boardPaging.setPageBlock(3);
		boardPaging.setPageSize(5);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();
		
		return boardPaging;
	}
	
	@Override
	public BoardDTO getBoardView(String seq) {
		System.out.println("BoardServiceImpl.getBoardView 실행");
		System.out.println(seq);
		return boardDAO.getBoardView(seq);
	}

	@Override
	public void boardModify(Map<String, String> map) {
		boardDAO.boardModify(map);
	}
	
	@Override
	public void boardDelete(String seq) {
		boardDAO.boardDelete(seq);
	}
	
	@Override
	public void boardReply(Map<String, String> map) {
		//원글
		BoardDTO b = boardDAO.getBoardView(map.get("pseq"));
		
		//세션
		map.put("id", (String)session.getAttribute("memId"));
		map.put("name", (String)session.getAttribute("memName"));
		map.put("email", (String)session.getAttribute("memEmail"));
		map.put("ref", Integer.toString(b.getRef()));   //원글 ref
		map.put("lev", Integer.toString(b.getLev()));   //원글 lev
		map.put("step", Integer.toString(b.getStep())); //원글 step
		
		boardDAO.boardReply(map);
	}
	
	@Override
	public void boardHit(String seq) {
		boardDAO.boardHit(seq);
	}
	
	@Override
	public List<BoardDTO> getBoardSearchList(Map<String, String> map) {
		int endNum = Integer.parseInt(map.get("pg")) * 5;
		int startNum = endNum - 4;
		
		map.put("startNum", Integer.toString(startNum));
		map.put("endNum", Integer.toString(endNum));
		
		return boardDAO.getBoardSearchList(map);
	}
	
	
}
