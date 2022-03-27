package guestbook.dao;

import java.util.List;
import java.util.Map;

import guestbook.bean.GuestbookDTO;

public interface GuestbookDAO {

	public void guestbookWrite(Map<String, String> map);

	public List<GuestbookDTO> getGuestbookList(Map<String, Integer> map);

	public int getTotalA();

}
