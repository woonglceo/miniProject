package board.dao;

import java.util.List;
import java.util.Map;

import board.bean.BoardDTO;

public interface BoardDAO {

	public void boardWrite(Map<String, String> map);

	public List<BoardDTO> getBoardList(Map<String, Integer> map);

	public int getTotalA();
	public int getTotalSearchA(Map<String, String> map);

	public BoardDTO getBoardView(String seq);

	public void boardModify(Map<String, String> map);

	public void boardDelete(String seq);

	public void boardReply(Map<String, String> map);

	public void boardHit(String seq);

	public List<BoardDTO> getBoardSearchList(Map<String, String> map);


}
