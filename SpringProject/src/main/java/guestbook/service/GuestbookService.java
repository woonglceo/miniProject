package guestbook.service;

import java.util.List;
import java.util.Map;

import guestbook.bean.GuestbookDTO;
import guestbook.bean.GuestbookPaging;

public interface GuestbookService {

	public void guestbookWrite(Map<String, String> map);

	public List<GuestbookDTO> getGuestBookList(Map<String, Integer> map);

	public int getTotalA();

	public GuestbookPaging paging(String pg);

}
